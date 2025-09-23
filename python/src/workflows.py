import asyncio
from datetime import timedelta
from temporalio import workflow
from activities import Activities
from params import AskForMoneyParams, HelloWorldParams


@workflow.defn
class HelloWorldWorkflow:
    @workflow.run
    async def run(self, params: HelloWorldParams) -> str:
        greeting = await workflow.execute_activity(
            Activities.sayName,
            params.name,
            schedule_to_close_timeout=timedelta(seconds=10),
        )

        await asyncio.sleep(10)

        return await workflow.execute_activity(
            Activities.askForMoney,
            AskForMoneyParams(amount=params.amount, greeting=greeting),
            schedule_to_close_timeout=timedelta(seconds=10),
        )
