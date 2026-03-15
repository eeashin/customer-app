CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
);

INSERT INTO customers (customer_id, first_name, surname, email, status)
VALUES
(1,  'Alice',   'Johnson',   'alice.johnson@example.com',      'active'),
(2,  'Bob',     'Smith',     'bob.smith@example.com',          'active'),
(3,  'Charlie', 'Brown',     'charlie.brown@example.com',      'suspended'),
(4,  'Diana',   'Miller',    'diana.miller@example.com',       'active'),
(5,  'Ethan',   'Davis',     'ethan.davis@example.com',        'archived'),
(6,  'Fatima',  'Rahman',    'fatima.rahman@example.com',      'active'),
(7,  'George',  'Wilson',    'george.wilson@example.com',      'active'),
(8,  'Hannah',  'Taylor',    'hannah.taylor@example.com',      'suspended'),
(9,  'Ibrahim', 'Khan',      'ibrahim.khan@example.com',       'active'),
(10, 'Julia',   'Moore',     'julia.moore@example.com',        'archived'),
(11, 'Kevin',   'Anderson',  'kevin.anderson@example.com',     'active'),
(12, 'Laura',   'Thomas',    'laura.thomas@example.com',       'active'),
(13, 'Michael', 'Jackson',   'michael.jackson@example.com',    'suspended'),
(14, 'Nadia',   'Begum',     'nadia.begum@example.com',        'active'),
(15, 'Oliver',  'Martin',    'oliver.martin@example.com',      'active'),
(16, 'Priya',   'Patel',     'priya.patel@example.com',        'active'),
(17, 'Quentin', 'Hall',      'quentin.hall@example.com',       'archived'),
(18, 'Rachel',  'Lewis',     'rachel.lewis@example.com',       'active'),
(19, 'Samuel',  'Walker',    'samuel.walker@example.com',      'active'),
(20, 'Tania',   'Ali',       'tania.ali@example.com',          'suspended'),
(21, 'Umar',    'Farooq',    'umar.farooq@example.com',        'active'),
(22, 'Victoria','Clark',     'victoria.clark@example.com',     'active'),
(23, 'William', 'Young',     'william.young@example.com',      'archived'),
(24, 'Xenia',   'Scott',     'xenia.scott@example.com',        'active'),
(25, 'Yusuf',   'Mahmood',   'yusuf.mahmood@example.com',      'active'),
(26, 'Zara',    'Hussain',   'zara.hussain@example.com',       'active'),
(27, 'Amir',    'Chowdhury', 'amir.chowdhury@example.com',     'suspended'),
(28, 'Bella',   'Green',     'bella.green@example.com',        'active'),
(29, 'Connor',  'White',     'connor.white@example.com',       'active'),
(30, 'Deepa',   'Nair',      'deepa.nair@example.com',         'archived')
ON CONFLICT (customer_id) DO NOTHING;


INSERT INTO orders (order_id, customer_id, product_name, quantity, unit_price, order_date)
VALUES
(001,  1,  'Laptop Stand',               1,   29.99, '2026-01-05'),
(002,  1,  'Wireless Mouse',             2,   15.50, '2026-01-06'),
(003,  1,  'USB-C Hub',                  1,   45.00, '2026-01-09'),

(004,  2,  'Mechanical Keyboard',        1,   79.99, '2026-01-08'),
(005,  2,  '27-inch Monitor',            1,  189.99, '2026-01-12'),

(006,  3,  'Notebook Pack',              5,    3.50, '2026-01-10'),

(007,  4,  'Desk Lamp',                  1,   22.75, '2026-01-11'),
(008,  4,  'Office Chair',               1,  120.00, '2026-01-15'),

(109,  5,  'Water Bottle',               3,   12.00, '2026-01-13'),

(010,  6,  'Backpack',                   1,   49.99, '2026-01-14'),
(011,  6,  'Phone Charger',              2,   18.99, '2026-01-18'),

(012,  7,  'Noise Cancelling Headphones',1,   89.90, '2026-01-15'),
(013,  7,  'Webcam',                     1,   55.00, '2026-01-16'),

(014,  8,  'Bluetooth Speaker',          1,   35.49, '2026-01-19'),

(015,  9,  'External SSD 1TB',           1,  110.00, '2026-01-17'),
(016,  9,  'Portable Power Bank',        1,   39.95, '2026-01-20'),

(017, 10,  'Table Fan',                  2,   26.75, '2026-01-21'),

(018, 11,  'Fitness Tracker',            1,   65.00, '2026-01-22'),
(019, 11,  'Running Shoes',              1,   84.99, '2026-01-25'),

(020, 12,  'Coffee Maker',               1,   59.99, '2026-01-26'),

(021, 13,  'Electric Kettle',            1,   31.50, '2026-01-27'),

(022, 14,  'Cookware Set',               1,   95.00, '2026-01-28'),
(023, 14,  'Dining Chair',               4,   45.00, '2026-02-01'),

(024, 15,  'Vacuum Cleaner',             1,  135.00, '2026-01-29'),

(025, 16,  'Bookshelf',                  1,   89.00, '2026-01-30'),
(026, 16,  'Wall Clock',                 1,   19.99, '2026-02-03'),

(027, 18,  'Printer Paper Pack',         3,    8.99, '2026-02-03'),
(028, 19,  'Smartphone Tripod',          2,   21.99, '2026-02-04'),
(029, 21,  'LED Desk Light',             1,   27.80, '2026-02-05'),
(030, 22,  'Gaming Mouse Pad',           2,   14.25, '2026-02-06')
ON CONFLICT (order_id) DO NOTHING;