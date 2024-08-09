create schema salesSchema;

create schema productionSchema;

CREATE TABLE salesSchema.customers (
    customerid INT NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    state VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    zipcode VARCHAR(20) NOT NULL,
    street VARCHAR(100) NOT NULL
);
create table salesSchema.orders(
     orderid INT NOT NULL,
customerid INT NOT NULL,
orderstatus VARCHAR,
orderdate DATE,
requireddate DATE,
shippeddate DATE,
storeid INT NOT NULL,
     staffid INT NOT NULL
);

ALTER TABLE salesSchema.orders
ADD CONSTRAINT ORDERIDPK PRIMARY KEY (orderid);

	 ALTER TABLE salesSchema.customers
ADD CONSTRAINT CUSTOMERIDPK PRIMARY KEY (customerid);

ALTER TABLE salesSchema.orders
ADD CONSTRAINT customeridFK FOREIGN KEY (customerid)
REFERENCES salesSchema.customers (customerid);

CREATE TABLE salesSchema.staffs(
       staffid INT NOT NULL,
firstname VARCHAR,
lastname VARCHAR,
email VARCHAR,
phone VARCHAR,
active VARCHAR,
storeid INT NOT NULL,
mangerid INT NOT NULL
);

ALTER TABLE salesSchema.staffs
ADD CONSTRAINT Staffidpk PRIMARY KEY ( staffid)

ALTER TABLE salesSchema.orders
ADD CONSTRAINT Staffidfk FOREIGN KEY ( staffid)
REFERENCES salesSchema.staffs( staffid)

ALTER TABLE salesSchema.orders
ADD CONSTRAINT custameridfk FOREIGN KEY ( customerid)
REFERENCES salesSchema.customers( customerid)

CREATE TABLE salesSchema.stores(
             storeid INT PRIMARY KEY,
			 storename VARCHAR,
			 phone VARCHAR,
			 email VARCHAR,
			 street VARCHAR,
			 city VARCHAR,
			 state CHAR(30),
			 zipcode VARCHAR
);


CREATE TABLE salesSchema.orderitems (
    orderid INT,
    itemid INT PRIMARY KEY,
    productid INT,
    quantity INT NOT NULL,
    listprice DECIMAL NOT NULL,
    FOREIGN KEY (orderid) REFERENCES salesSchema.orders (orderid),
    FOREIGN KEY (productid) REFERENCES salesSchema.products (productid)
);

CREATE TABLE productionSchema.products(
             productid INT PRIMARY KEY ,
			 productname VARCHAR,
			 brandid INT,
			 categoryid INT,
			 modelyear DATE,
			 listprice  DECIMAL NOT NULL,
			 FOREIGN KEY (brandid) REFERENCES  productionSchema.brands(brandid),
			 FOREIGN KEY(categoryid) REFERENCES  productionSchema.category(categoryid),
);

CREATE TABLE productionSchema.category(
             categoryid INT PRIMARY KEY,
			 categoryname VARCHAR
);

CREATE TABLE productionSchema.brands(
             brandid INT PRIMARY KEY,
			 brandname VARCHAR NOT NULL
);

CREATE TABLE productionSchema.stoks(
             storeid INT,
			 productid INT,
			 quantity NUMERIC,
			 FOREIGN KEY (storeid) REFERENCES  salesSchema.stores(storeid),
			 FOREIGN KEY (productid) REFERENCES productionSchema.products(productid)
);
