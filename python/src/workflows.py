from datetime import timedelta
from temporalio import workflow
from activities import Activities


@workflow.defn
class HelloWorldWorkflow:
    @workflow.run
    async def run(self, name: str) -> str:
        return await workflow.execute_activity(
            Activities.sayName,
            name,
            schedule_to_close_timeout=timedelta(seconds=10),
        )
