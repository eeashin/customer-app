from extract import extract_rows
from transform import transform_rows
from load import export_rows

def main():
    rows = extract_rows()
    transformed_rows = transform_rows(rows)
    output_file = export_rows(transformed_rows)

    print(f"Exported {len(transformed_rows)} rows to {output_file}")

if __name__ == "__main__":
    main()