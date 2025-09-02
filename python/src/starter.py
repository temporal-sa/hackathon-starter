import asyncio
import uuid
from temporalio.client import Client
from temporalio.envconfig import ClientConfigProfile
import shared
import workflows


async def main():
    default_profile = ClientConfigProfile.load()
    connect_config = default_profile.to_client_connect_config()

    client = await Client.connect(**connect_config)
    result = await client.execute_workflow(
        workflows.HelloWorldWorkflow,
        "Hacker",
        id=f"hello-world-workflow-{uuid.uuid4()}",
        task_queue=shared.TASK_QUEUE_NAME,
    )
    print("Workflow result:", result)


if __name__ == "__main__":
    asyncio.run(main())
