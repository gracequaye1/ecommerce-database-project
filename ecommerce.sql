-- ecommerce.sql

CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    base_price DECIMAL(10, 2),
    brand_id INT,
    category_id INT,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    hex_code VARCHAR(7)
);

CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    size_category_id INT,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    sku VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);

CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    data_type VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES attribute_category(id)
);

CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_type_id INT,
    value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);
