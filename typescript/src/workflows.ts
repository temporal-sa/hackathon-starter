import { proxyActivities } from '@temporalio/workflow';

import type { createActivities } from './activities';

const { sayName } = proxyActivities<ReturnType<typeof createActivities>>({
  startToCloseTimeout: '1 minute',
});

// Add Workflow Definitions here.
export async function helloWorldWorkflow(name: string): Promise<string> {
  // Your workflow code here
  return sayName(name);
}
