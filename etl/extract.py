from db import get_connection

QUERY = """
    SELECT
        c.customer_id,
        c.first_name,
        c.surname,
        c.email,
        c.status,
        o.order_id,
        o.product_name,
        o.quantity,
        o.unit_price,
        o.order_date
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE c.status = 'active'
    ORDER BY c.customer_id, o.order_date, o.order_id
"""

def extract_rows():
    conn = get_connection()
    try:
        with conn.cursor() as cur:
            cur.execute(QUERY)
            return cur.fetchall()
    finally:
        conn.close()