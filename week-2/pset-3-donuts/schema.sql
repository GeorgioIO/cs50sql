CREATE TABLE ingredients (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    price_per_unit NUMERIC NOT NULL CHECK(price_per_unit > 0),
    PRIMARY KEY (id)
);

CREATE TABLE donuts (
    id INTEGER,
    name TEXT NOT NULL UNIQUE,
    gluten_free INTEGER NOT NULL CHECK (gluten_free IN (0,1)),
    price NUMERIC NOT NULL CHECK(price > 0),
    PRIMARY KEY (id)
);

CREATE TABLE donuts_ingredients (
    donut_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY (donut_id , ingredient_id),
    FOREIGN KEY (donut_id) REFERENCES donuts (id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id)
);

CREATE TABLE customers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    order_number INTEGER NOT NULL UNIQUE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    donut_id INTEGER,
    customer_id INTEGER,
    PRIMARY KEY (order_number),
    FOREIGN KEY (donut_id) REFERENCES donuts (id),
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);
