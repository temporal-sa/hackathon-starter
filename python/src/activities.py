from temporalio import activity


class Activities:
    # If you wish to connect any dependencies (eg, database), add in here
    # def __init__(self, db: DB):
    #     self.db = db

    @activity.defn
    async def sayName(self, name: str) -> str:
        if name == "":
            name = "anonymous human"

        return f"Hello {name}!"
