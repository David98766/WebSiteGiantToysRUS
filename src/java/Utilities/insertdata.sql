INSERT INTO "USERDATA" (
    "fName", "lName", "cEmail", "cPhoneNumber",
    "cPassword", "isLoggedIN", "registerDate", "isManager"
    
) VALUES (
    'John', 'Doe', 'john.doe@example.com','555-1234',
    'password123', false, '2023-01-01', false
    
);

-- Inserting a user with isManager set to true
INSERT INTO "USERDATA" (
    "fName", "lName", "cEmail", "cPhoneNumber",
    "cPassword", "isLoggedIN", "registerDate", "isManager"
   
) VALUES (
    'Jane', 'Smith', 'jane.smith@example.com', '555-5678',
    'password456', false, '2023-01-02', true
    
);

INSERT INTO "CUSTOMERQUERY" (
"fullName", "userEmail", "queryMessage"

) VALUES (
'Aoife Lancaster', 'Aoife@gmail.com', 'There are aliens in James house'
);

INSERT INTO "CUSTOMERQUERY" (
"fullName", "userEmail", "queryMessage"

) VALUES (
'James Galvin', 'James@gmail.com', 'There are aliens in my house'
);

INSERT INTO "DISCOUNT" (
"discountStatus", "saleDescription", "salesPercentage"

) VALUES (
'Reduced To Clear', 'Reducing Product to clear it', 0.8
);

INSERT INTO "DISCOUNT" (
"discountStatus", "saleDescription", "salesPercentage"

) VALUES (
'No Discount', 'Normal Price', 0.0
);

INSERT INTO "DISCOUNT" (
"discountStatus", "saleDescription", "salesPercentage"

) VALUES (
'Fire Sale', 'Fire Sale!', 0.3
);



INSERT INTO "PAYMENT" ("userID", "paymentQuantity", "paymentTotal", "VATAmount", "paymentDate")
VALUES
    (1, 3, 50.25, 11.55, CURRENT_DATE),
    (2, 2, 30.50, 7.02, CURRENT_DATE),
    (2, 1, 15.75, 3.62, CURRENT_DATE);



INSERT INTO "ORDER" ("paymentID", "userID", "deliveryType", "orderDeliveryDate", "orderDelivered")
VALUES
    (1, 1, 'Standard', '2023-01-10', true),
    (2, 2, 'Turbo', '2023-02-15', false),
    (3, 2, 'Standard', '2023-03-20', false);

-- INSERT statements for payment details

-- Receipt 1
-- Receipt 1
INSERT INTO PAYMENTDETAIL (userID, paymentID, productsID, itemName, itemPrice, itemQuantity)
VALUES (1, 1, 1, 'Giant Panda Bear', 50.00, 2);

-- Receipt 2
INSERT INTO PAYMENTDETAIL (userID, paymentID, productsID, itemName, itemPrice, itemQuantity)
VALUES (1, 1, 4, 'Extra Massive Giraffe', 28.00, 1);

-- Receipt 3
INSERT INTO PAYMENTDETAIL (userID, paymentID, productsID, itemName, itemPrice, itemQuantity)
VALUES (2, 2, 8, 'Huge Connect Four', 80.00, 1);

-- Receipt 4
INSERT INTO PAYMENTDETAIL (userID, paymentID, productsID, itemName, itemPrice, itemQuantity)
VALUES (2, 2, 10, 'Jelly Jinga', 220.00, 2);

-- Receipt 5
INSERT INTO PAYMENTDETAIL (userID, paymentID, productsID, itemName, itemPrice, itemQuantity)
VALUES (2, 3, 11, 'Colossal Scrabble', 140.00, 1);

-- Receipt 6
INSERT INTO PAYMENTDETAIL (userID, paymentID, productsID, itemName, itemPrice, itemQuantity)
VALUES (2, 3, 9, 'Giant Checkers', 200.00, 3);











