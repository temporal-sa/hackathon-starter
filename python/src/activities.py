from temporalio import activity


@activity.defn
async def sayName(name: str) -> str:
    if name == "":
        name = "anonymous human"

    return f"Hello {name}!"
