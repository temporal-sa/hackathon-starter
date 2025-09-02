import asyncio
from temporalio.client import Client
from temporalio.worker import Worker
from temporalio.envconfig import ClientConfigProfile
from workflows import HelloWorldWorkflow
from activities import sayName
import shared


async def main():
    default_profile = ClientConfigProfile.load()
    connect_config = default_profile.to_client_connect_config()

    client = await Client.connect(**connect_config)
    worker = Worker(
        client,
        task_queue=shared.TASK_QUEUE_NAME,
        workflows=[HelloWorldWorkflow],
        activities=[sayName],
    )

    print("Worker started.")
    await worker.run()


if __name__ == "__main__":
    asyncio.run(main())
