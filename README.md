# Customer Orders API and ETL

This project implements a small data platform that includes:

- PostgreSQL database to store customers and orders
- FastAPI REST API that retrieves customer and orders
- ETL app that extract, transform and exports to CSV

---

## 1. Run the Application

### Prerequisites

> **Note:** This project was fully built and tested on macOS. Therefore, this documentation applies to macOS environments, using other operating systems may require minor modifications.

Before running the project, install following required tools-

| Tool             | Version | Purpose                         |
|------------------|---------|---------------------------------|
| Docker           | latest  | Runtime & package manager       |
| Docker Compose   | latest  | Multi-container orchestration   |
| Git              | latest  | Source control                  |

> **Important:** All prerequisites tools should be installed and running on system level.

---

### Step 1 – Clone the Repository

```
git clone https://github.com/eeashin/customer-app.git
cd customer-app
```
---

### Step 2 – Create Environment Configuration

Create a .env file in the project root directory and configure environment variables for DB and other application access. below is an example (feel free to use your own credntials) -

```
POSTGRES_DB=emdb1
POSTGRES_USER=emuser1
POSTGRES_PASSWORD=eMpass!

DB_HOST=emdb1
DB_PORT=5432
```
