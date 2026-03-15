def transform_row(row):
    unit_price = float(row["unit_price"])

    return {
        "customer_id": row["customer_id"],
        "name": f'{row["first_name"]} {row["surname"]}',
        "email": row["email"],
        "status": row["status"],
        "order_id": row["order_id"],
        "product_name": row["product_name"],
        "quantity": row["quantity"],
        "unit_price": unit_price,
        "total_value": row["quantity"] * unit_price,
        "order_date": row["order_date"].isoformat(),
    }

def transform_rows(rows):
    return [transform_row(row) for row in rows]