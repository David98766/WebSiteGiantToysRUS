
DROP TABLE "CUSTOMERQUERY";
DROP TABLE "ORDER";
DROP TABLE "PAYMENTDETAIL";
DROP TABLE "PAYMENT";
DROP TABLE "SHOPPINGCART";

DROP TABLE "DISCOUNT";
DROP TABLE "USERDATA";


CREATE TABLE "USERDATA"
(
    "USER_ID" INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),   
    "fName" VARCHAR(255),
    "lName" VARCHAR(255),
    "cEmail" VARCHAR(255),
    "cDeliveryAddress" VARCHAR(255),
    "cDeliveryAddress2" VARCHAR(255),
    "cCountry" VARCHAR(50),
    "cCity" VARCHAR(50),
    "cProvince" VARCHAR(50),
    "cZipCode" VARCHAR(20),
    "cPhoneNumber" VARCHAR(20),
    "cPassword" VARCHAR(255),
    "isLoggedIN" BOOLEAN,
    "registerDate" DATE,
    "isManager" BOOLEAN,
    "userDisable" BOOLEAN,
    "rememberMe" BOOLEAN
);

CREATE TABLE "CUSTOMERQUERY"
(
"QUERY_ID" INT NOT NULL PRIMARY KEY
      GENERATED ALWAYS AS IDENTITY
      (START WITH 1, INCREMENT BY 1),
"fullName" VARCHAR(400),
"userEmail" VARCHAR(255),
"queryMessage" VARCHAR(10000)
);

CREATE TABLE "DISCOUNT"
(
    "discountStatus" VARCHAR(50) PRIMARY KEY, -- Add constraints or adjust length as needed,
    "saleDescription" VARCHAR(255),
    "salesPercentage" DECIMAL(2, 2)
);

CREATE TABLE "PRODUCTS"
(
    "PRODUCT_ID" INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "productName" VARCHAR(255) NOT NULL,
    "productPrice" DECIMAL(10, 2) NOT NULL,
    "productCategory" VARCHAR(50),
    "productDescription" VARCHAR(10000),
    "productDimensions" VARCHAR(100),
    "productInventory" INT,
    "productImage" BLOB(16M),
    "isDeleted" BOOLEAN,
    "discountStatus" VARCHAR(50),
    "containsPlastic" BOOLEAN,
    "stuffingMaterial" VARCHAR(50),
    "suitableForKids" BOOLEAN,
    "ageRange" VARCHAR(20),
    "publisher" VARCHAR(100),
    "maxPlayers" VARCHAR(20)
); 



CREATE TABLE "PAYMENT"
(
    "PAYMENT_ID" INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "userID" INT NOT NULL,
    "paymentQuantity" INT,
    "paymentTotal" DECIMAL(10, 2),
    "VATAmount" DECIMAL(10, 2),
    "paymentDate" DATE
);

CREATE TABLE "PAYMENTDETAIL"
(
    "userID" INT NOT NULL,
    "paymentID" INT NOT NULL,
    "productsID" INT NOT NULL, 
    "itemName" VARCHAR(255),
    "itemPrice" DECIMAL(10, 2),
    "itemQuantity" INT 
);


CREATE TABLE "SHOPPINGCART"
(
    "userID" INT NOT NULL,
    "productsID" INT NOT NULL, 
    "cartItemName" VARCHAR(255) NOT NULL,
    "cartItemPrice" DECIMAL(10, 2) NOT NULL,
    "cartItemQuantity" INT NOT NULL
);

CREATE TABLE "ORDER"
(
    "ORDER_ID" INT not null primary key
        GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "paymentID" INT NOT NULL,
    "userID" INT NOT NULL,
    "deliveryType" VARCHAR(50) NOT NULL,
    "orderDeliveryDate" DATE,
    "orderDelivered" BOOLEAN
);



