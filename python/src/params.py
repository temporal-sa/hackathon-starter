from dataclasses import dataclass


@dataclass
class HelloWorldParams:
    amount: int
    name: str


@dataclass
class AskForMoneyParams:
    amount: int
    greeting: str
