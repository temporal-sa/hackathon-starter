import {
  OpenTelemetryActivityInboundInterceptor,
  OpenTelemetryActivityOutboundInterceptor,
} from '@temporalio/interceptors-opentelemetry';
import {
  NativeConnection,
  Runtime,
  Worker,
  bundleWorkflowCode,
} from '@temporalio/worker';

import { createActivities } from './activities';
import { TASK_QUEUE_NAME } from './shared';

async function run() {
  Runtime.install({
    telemetryOptions: {
      metrics: {
        otel: {
          url: process.env.OTEL_EXPORTER_OTLP_ENDPOINT ?? '',
          temporality: 'delta',
        },
      },
    },
  });

  const connection = await NativeConnection.connect({
    address: process.env.TEMPORAL_ADDRESS,
    tls: process.env.TEMPORAL_TLS === 'true',
    apiKey: process.env.TEMPORAL_API_KEY,
  });

  try {
    // Create the worker with the task queue "hackathon"
    const worker = await Worker.create({
      connection,
      namespace: process.env.TEMPORAL_NAMESPACE,
      taskQueue: TASK_QUEUE_NAME,
      // Workflows are registered using a path as they run in a separate JS context.
      workflowsPath: require.resolve('./workflows'),
      // workflowBundle: await bundleWorkflowCode({
      //   workflowsPath: require.resolve('./workflows'),
      // }),
      // Register the activities - you may need to inject dependencies in here
      activities: createActivities(),
      interceptors: {
        activity: [
          (ctx) => ({
            inbound: new OpenTelemetryActivityInboundInterceptor(ctx),
            outbound: new OpenTelemetryActivityOutboundInterceptor(ctx),
          }),
        ],
      },
    });

    await worker.run();
  } finally {
    // Close the connection once the worker has stopped
    await connection.close();
  }
}

run().catch((err) => {
  console.error(err);
  process.exit(1);
});
