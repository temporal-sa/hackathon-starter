import { Client, Connection } from '@temporalio/client';
import { nanoid } from 'nanoid';

import { TASK_QUEUE_NAME } from './shared';
import { helloWorldWorkflow } from './workflows';

async function run() {
  const connection = await Connection.connect({
    address: process.env.TEMPORAL_ADDRESS,
    tls: process.env.TEMPORAL_TLS === 'true',
    apiKey: process.env.TEMPORAL_API_KEY,
  });

  const client = new Client({
    connection,
    namespace: process.env.TEMPORAL_NAMESPACE,
  });

  const handle = await client.workflow.start(helloWorldWorkflow, {
    taskQueue: TASK_QUEUE_NAME,
    args: ['Hacker'],
    // in practice, use a meaningful business ID, like customerId or transactionId
    workflowId: 'hello-world-' + nanoid(),
  });
  console.log(`Started workflow ${handle.workflowId}`);

  // optional: wait for client result
  console.log(await handle.result());
}

run().catch((err) => {
  console.error(err);
  process.exit(1);
});
