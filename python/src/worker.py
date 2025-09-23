import asyncio
from temporalio.client import Client
from temporalio.worker import Worker
from temporalio.envconfig import ClientConfigProfile
from workflows import HelloWorldWorkflow
from activities import Activities
import shared
import inspect


async def main():
    default_profile = ClientConfigProfile.load()
    connect_config = default_profile.to_client_connect_config()

    client = await Client.connect(**connect_config)

    # Register the activities - you may need to inject dependencies in here
    activities = Activities()

    worker = Worker(
        client,
        task_queue=shared.TASK_QUEUE_NAME,
        workflows=[HelloWorldWorkflow],
        activities=find_activities(activities),
    )

    print("Worker started.")
    await worker.run()


# ---- auto-discovery helper ----
_ACTIVITY_ATTR = "__temporal_activity_definition"  # set by @activity.defn


def find_activities(obj):
    """Return a list of bound methods on `obj` that are Temporal activities."""
    acts = []
    for _, member in inspect.getmembers(obj):
        if callable(member) and is_activity_callable(member):
            acts.append(member)  # bound method carries injected deps
    return acts


def is_activity_callable(attr) -> bool:
    # Works for functions and bound methods
    func = attr.__func__ if inspect.ismethod(attr) else attr
    return hasattr(func, _ACTIVITY_ATTR)


if __name__ == "__main__":
    asyncio.run(main())
