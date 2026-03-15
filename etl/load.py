import csv
from pathlib import Path
from datetime import datetime, timezone

OUTPUT_DIR = Path("/output")
CSV_COLUMNS = [
    "customer_id",
    "name",
    "email",
    "status",
    "order_id",
    "product_name",
    "quantity",
    "unit_price",
    "total_value",
    "order_date",
]

def export_rows(rows):
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d_%H%M%S")
    output_file = OUTPUT_DIR / f"active_customers_orders_{timestamp}.csv"

    with output_file.open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=CSV_COLUMNS)
        writer.writeheader()
        writer.writerows(rows)

    return output_file