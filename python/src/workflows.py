from datetime import timedelta
from temporalio import workflow
from activities import sayName


@workflow.defn
class HelloWorldWorkflow:
    @workflow.run
    async def run(self, name: str) -> str:
        return await workflow.execute_activity(
            sayName,
            name,
            schedule_to_close_timeout=timedelta(seconds=10),
        )
