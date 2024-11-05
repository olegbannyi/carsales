CREATE TABLE IF NOT EXISTS manufacturers (
    manufacturer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    manufacturer_id INT NOT NULL,
    model VARCHAR(45) NOT NULL,
    price DECIMAL NOT NULL,
    horsepower INT NOT NULL,
    fuel_efficiency INT NOT NULL,
    FOREIGN KEY (manufacturer_id)
        REFERENCES manufacturers (manufacturer_id)
);

CREATE TABLE IF NOT EXISTS inventory (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL,
    reorder_level INT NOT NULL DEFAULT 2,
    last_inventory_date DATE NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);
