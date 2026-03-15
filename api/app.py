from fastapi import FastAPI, HTTPException
from schemas import CustomerOrders
from models import customer_orders

app = FastAPI(
    title="customer rrders API",
    version="1.0.0"
)

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/customers/{customer_id}", response_model=CustomerOrders)
def read_customer(customer_id: int):
    customer = customer_orders(customer_id)

    if customer is None:
        raise HTTPException(status_code=404, detail="customer not found")

    return customer