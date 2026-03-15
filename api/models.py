from db import get_connection

CUSTOMER_QUERY = """
    SELECT customer_id, first_name, surname, email, status
    FROM customers
    WHERE customer_id = %s
"""

ORDERS_QUERY = """
    SELECT order_id, product_name, quantity, unit_price, order_date
    FROM orders
    WHERE customer_id = %s
    ORDER BY order_date, order_id
"""

def customer_orders(customer_id: int):
    conn = get_connection()

    try:
        with conn.cursor() as cur:
            cur.execute(CUSTOMER_QUERY, (customer_id,))
            customer = cur.fetchone()

            if customer is None:
                return None

            cur.execute(ORDERS_QUERY, (customer_id,))
            orders = cur.fetchall()

        customer["orders"] = [
            {
                **order,
                "unit_price": float(order["unit_price"]),
                "order_date": order["order_date"].isoformat(),
            }
            for order in orders
        ]

        return customer

    finally:
        conn.close()