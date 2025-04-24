--Question 1
CREATE TABLE color (
  color_id INT PRIMARY KEY AUTO_INCREMENT,
  color_name VARCHAR(50) NOT NULL
);


-- Question 2 
CREATE TABLE size_category (
  size_category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(50) NOT NULL
);


-- Question 3
CREATE TABLE size_option (
  size_option_id INT PRIMARY KEY AUTO_INCREMENT,
  size_label VARCHAR(10) NOT NULL,
  size_category_id INT,
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);


-- Question 4
CREATE TABLE product_variation (
  variation_id INT PRIMARY KEY AUTO_INCREMENT,
  product_item_id INT NOT NULL,
  color_id INT,
  size_option_id INT,
  stock_quantity INT DEFAULT 0,
  FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

