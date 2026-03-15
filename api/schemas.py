from pydantic import BaseModel
from typing import List


class Order(BaseModel):
    order_id: int
    product_name: str
    quantity: int
    unit_price: float
    order_date: str


class CustomerOrders(BaseModel):
    customer_id: int
    first_name: str
    surname: str
    email: str
    status: str
    orders: List[Order]