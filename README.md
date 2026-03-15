# Customer Orders API and ETL

This project implements a small data platform that includes:

- PostgreSQL database to store customers and orders
- FastAPI REST API that retrieves customer and orders
- ETL app that extract, transform and exports to CSV

---

## 1. How to Run Your Application

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

#### Step 1 - Clone the Repository

```
git clone https://github.com/eeashin/customer-app.git
cd customer-app
```
---

#### Step 2 - Create Environment Config file

Create a `.env` file in the project root directory and configure environment variables for DB and other application access. below is an example -

```
POSTGRES_DB=db
POSTGRES_USER=user
POSTGRES_PASSWORD=pass

DB_HOST=db
DB_PORT=5432
```
---

#### Step 3 - Start the DB and Application stack

```
docker compose up --build -d
```
---

#### Step 4 - Invoke and Test the API

| Operation | Method | Endpoint |
|-----------|--------|----------|
| Get Customer and Order data for a single Customer by id | GET | `/customers/{id}` |

- The API will be available at:

```
http://localhost:8000
```
- Check the API health endpoint:

```
curl http://localhost:8000/health
```
- Test the API request (example below):

```
curl http://localhost:8000/customers/1
```
- Interactive API documentation is available at:

```
http://localhost:8000/docs
```
---

#### Step 5 – Run the Export (ETL) app

The ETL runs as a separate container. Execute by using below command:

```
docker compose run --rm etl
```

After the ETL process execution it will write the results to a `.csv` file in the local `output` directory and each run generates a fine with *timestamp*. For example `output/active_customers_orders_20260315_210530.csv` 

---

## 2. Your Choices and Reasoning

| Component | Tools/ libraries |
|----------|-----------|
| Database | PostgreSQL |
| API Framework | FastAPI |
| Database Driver | psycopg2 |
| Data Validation | Pydantic |
| Containerization | Docker |
| Orchestration | Docker Compose |
| Export Format | CSV |

### Database – PostgreSQL

PostgreSQL was chosen because it is a reliable and widely used relational database. It supports strong relational data modelling and integrates well with Docker environments.

The schema represents a simple relationship between customers and orders, where one customer can have multiple orders.

---

### Framework – FastAPI

FastAPI was chosen because it is a modern Python web framework designed for building APIs quickly and efficiently. It provides:

- High performance

- Minimal boilerplate code

- Automatic OpenAPI documentation

- Strong integration with Python type hints

FastAPI also integrates naturally with Pydantic for data validation and response modelling.

---

### Libraries Used

The main Python libraries used are:

- psycopg2

Used as the PostgreSQL driver to execute SQL queries and interact with the database.

- RealDictCursor

Used to return query results as dictionaries, simplifying JSON response creation.

- pydentic

Pydantic was used for defining API response schemas and ensuring data validation.

---

### Docker and Docker Compose

Docker Compose was used to orchestrate the services required for the application. This approach allows the database, API, and ETL script to run in separate containers while sharing a common configuration.

Using Docker ensures that the application runs consistently across different environments without requiring manual dependency installation.

- Service stack:

| Service | Purpose |
|--------|--------|
| db | PostgreSQL database |
| api | FastAPI REST API |
| etl | Standalone export script |

---

## 3. Application Flow

The application consists of 03 components: 
- postgres (DB)
- api (REST API)
- etl (ETL app)

**Database**

When the PostgreSQL container starts, the `db/init.sql` script is executed automatically. It creates the customers and orders tables and inserts sample data.

**API**

The FastAPI service exposes an endpoint:

```
GET /customers/{customer_id}
```
The API queries the database to retrieve the requested customer and their associated orders, then returns the result as a `JSON` response.

**ETL Export**

The ETL script connects directly to the database and performs three steps:
- Extract: Retrieve all active customers and their orders
- Transform: Combine `first_name` and `surname` into `name` and calculate `total_value = quantity × unit_price`
- Export: Write the transformed data to a timestamped `CSV` file in the `output/` directory

---

## 4. What I Would Improve

If more time were available, I would improve the solution in the following areas:

- **Testing and TDD:** Add unit and integration tests and use TDD more consistently to improve reliability and ensure all core functionality is covered.

- **Database migrations:** Use a migration tool such as Alembic instead of relying only on an initialization SQL script.

- **ORM integration:** Introduce SQLAlchemy to improve maintainability and query management.

- **Logging and error handling:** Add structured logging and more robust exception handling for the API and ETL jobs.

- **CI/CD and quality checks:** Add automated pipelines for testing, linting, formatting, and container builds.

- **Scheduling and monitoring:** Run the ETL as a scheduled job with monitoring and alerting for failures.

---

## Project Structure
```
customer-app/
.
├── api
│   ├── app.py
│   ├── db.py
│   ├── Dockerfile
│   ├── models.py
│   ├── requirements.txt
│   └── schemas.py
├── db
│   └── init.sql
├── docker-compose.yml
├── etl
│   ├── db.py
│   ├── Dockerfile
│   ├── extract.py
│   ├── load.py
│   ├── main.py
│   ├── requirements.txt
│   └── transform.py
├── output
│   └── active_customers_orders_20260315_170044.csv
└── README.md

5 directories, 17 files
```