USE Myguitarshop;


CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Products (
  ProductID         INT            PRIMARY KEY,
  CategoryID        INT, 
  ProductCode       VARCHAR(10)    NOT NULL      UNIQUE,
  ProductName       VARCHAR(255)   NOT NULL,
  Description       TEXT           NOT NULL,
  ListPrice         VARCHAR(10)    NOT NULL,
  DiscountPercent   VARCHAR(10)    NOT NULL      DEFAULT 0.00,
  DateAdded         DATETIME                     DEFAULT NULL,
  CONSTRAINT fk_products_categories
  FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);

CREATE TABLE Customers (
  CustomerID           INT            PRIMARY KEY,
  EmailAddress         VARCHAR(255)   NOT NULL      UNIQUE,
  Password             VARCHAR(60)    NOT NULL,
  FirstName            VARCHAR(60)    NOT NULL,
  LastName             VARCHAR(60)    NOT NULL,
  ShippingAddressID    INT            DEFAULT NULL,
  BillingAddressID     INT            DEFAULT NULL
);

CREATE TABLE Addresses (
  AddressID          INT            PRIMARY KEY,
  CustomerID         INT, 
  Line1              VARCHAR(60)    NOT NULL,
  Line2              VARCHAR(60)    DEFAULT NULL,
  City               VARCHAR(40)    NOT NULL,
  State              VARCHAR(2)     NOT NULL,
  ZipCode            VARCHAR(10)    NOT NULL,
  Phone              VARCHAR(12)    NOT NULL,
  Disabled           INT            NOT NULL      DEFAULT 0,
  CONSTRAINT fk_addresses_customers
  FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

CREATE TABLE Orders (
  OrderID           INT            PRIMARY KEY,
  CustomerID        INT,
  OrderDate         DATETIME       NOT NULL,
  ShipAmount        VARCHAR(10)    NOT NULL,
  TaxAmount         VARCHAR(10)    NOT NULL,
  ShipDate          DATETIME       DEFAULT NULL,
  ShipAddressID     INT            NOT NULL,
  CardType          VARCHAR(50)    NOT NULL,
  CardNumber        CHAR(16)       NOT NULL,
  CardExpires       CHAR(7)        NOT NULL,
  BillingAddressID  INT            NOT NULL,
  CONSTRAINT fk_orders_customers
  FOREIGN KEY (CustomerID)  REFERENCES Customers (CustomerID)
);

CREATE TABLE OrderItems (
  ItemID             INT,
  OrderID            INT,
  ProductID          INT,
  ItemPrice          VARCHAR(10)    NOT NULL,
  DiscountAmount     VARCHAR(10)    NOT NULL,
  Quantity           INT            NOT NULL,
  CONSTRAINT OrderItems_pk PRIMARY KEY (OrderID, ProductID),
  CONSTRAINT fk_orderitems_orders
  FOREIGN KEY (OrderID)  REFERENCES Orders (OrderID),
  CONSTRAINT fk_orderitems_products
  FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);

CREATE TABLE Administrators (
  AdminID           INT            PRIMARY KEY,
  EmailAddress      VARCHAR(255)   NOT NULL     UNIQUE,
  Password          VARCHAR(255)   NOT NULL,
  FirstName         VARCHAR(255)   NOT NULL,
  LastName          VARCHAR(255)   NOT NULL
);

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(11111, 'Guitars'),
(22222, 'Basses'),
(33333, 'Drums'), 
(44444, 'Keyboards');

INSERT INTO Products (ProductID, CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded) VALUES
(199, 11111, 'strat', 'Fender Stratocaster', 'The Fender Stratocaster is the electric guitar design that changed the world. New features include a tinted neck, parchment pickguard and control knobs, and a ''70s-style logo. Includes select alder body, 21-fret maple neck with your choice of a rosewood or maple fretboard, 3 single-coil pickups, vintage-style tremolo, and die-cast tuning keys. This guitar features a thicker bridge block for increased sustain and a more stable point of contact with the strings. At this low price, why play anything but the real thing?\r\n\r\nFeatures:\r\n\r\n* New features:\r\n* Thicker bridge block\r\n* 3-ply parchment pick guard\r\n* Tinted neck', '699.00', '30.00', '2011-10-30 09:32:40'),
(299, 11111, 'les_paul', 'Gibson Les Paul', 'This Les Paul guitar offers a carved top and humbucking pickups. It has a simple yet elegant design. Cutting-yet-rich tone?the hallmark of the Les Paul?pours out of the 490R and 498T Alnico II magnet humbucker pickups, which are mounted on a carved maple top with a mahogany back. The faded finish models are equipped with BurstBucker Pro pickups and a mahogany top. This guitar includes a Gibson hardshell case (Faded and satin finish models come with a gig bag) and a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n* Carved maple top and mahogany back (Mahogany top on faded finish models)\r\n* Mahogany neck, ''59 Rounded Les Paul\r\n* Rosewood fingerboard (Ebony on Alpine white)\r\n* Tune-O-Matic bridge with stopbar\r\n* Chrome or gold hardware\r\n* 490R and 498T Alnico 2 magnet humbucker pickups (BurstBucker Pro on faded finish models)\r\n* 2 volume and 2 tone knobs, 3-way switch', '1199.00', '30.00', '2011-12-05 16:33:13'),
(399, 11111, 'sg', 'Gibson SG', 'This Gibson SG electric guitar takes the best of the ''62 original and adds the longer and sturdier neck joint of the late ''60s models. All the classic features you''d expect from a historic guitar. Hot humbuckers go from rich, sweet lightning to warm, tingling waves of sustain. A silky-fast rosewood fretboard plays like a dream. The original-style beveled mahogany body looks like a million bucks. Plus, Tune-O-Matic bridge and chrome hardware. Limited lifetime warranty. Includes hardshell case.\r\n\r\nFeatures:\r\n\r\n* Double-cutaway beveled mahogany body\r\n* Set mahogany neck with rounded ''50s profile\r\n* Bound rosewood fingerboard with trapezoid inlays\r\n* Tune-O-Matic bridge with stopbar tailpiece\r\n* Chrome hardware\r\n* 490R humbucker in the neck position\r\n* 498T humbucker in the bridge position\r\n* 2 volume knobs, 2 tone knobs, 3-way switch\r\n* 24-3/4" scale', '2517.00', '52.00', '2015-02-04 11:04:31'),
(499, 11111, 'fg700s', 'Yamaha FG700S', 'The Yamaha FG700S solid top acoustic guitar has the ultimate combo for projection and pure tone. The expertly braced spruce top speaks clearly atop the rosewood body. It has a rosewood fingerboard, rosewood bridge, die-cast tuners, body and neck binding, and a tortoise pickguard.\r\n\r\nFeatures:\r\n\r\n* Solid Sitka spruce top\r\n* Rosewood back and sides\r\n* Rosewood fingerboard\r\n* Rosewood bridge\r\n* White/black body and neck binding\r\n* Die-cast tuners\r\n* Tortoise pickguard\r\n* Limited lifetime warranty', '489.99', '38.00', '2015-06-01 11:12:59'),
(599, 11111, 'washburn', 'Washburn D10S', 'The Washburn D10S acoustic guitar is superbly crafted with a solid spruce top and mahogany back and sides for exceptional tone. A mahogany neck and rosewood fingerboard make fretwork a breeze, while chrome Grover-style machines keep you perfectly tuned. The Washburn D10S comes with a limited lifetime warranty.\r\n\r\nFeatures:\r\n\r\n    * Spruce top\r\n    * Mahogany back, sides\r\n    * Mahogany neck Rosewood fingerboard\r\n    * Chrome Grover-style machines', '299.00', '0.00', '2015-07-30 13:58:35');

INSERT INTO Customers (CustomerID, EmailAddress, Password, FirstName, LastName, ShippingAddressID, BillingAddressID) VALUES
(1, 'allan.sherwood@yahoo.com', '650215acec746f0e32bdfff387439eefc1358737', 'Allan', 'Sherwood', 11, 21),
(2, 'barryz@gmail.com', '3f563468d42a448cb1e56924529f6e7bbe529cc7', 'Barry', 'Zimmer', 31, 31),
(3, 'christineb@solarone.com', 'ed19f5c0833094026a2f1e9e6f08a35d26037066', 'Christine', 'Brown', 41, 41),
(4, 'david.goldstein@hotmail.com', 'b444ac06613fc8d63795be9ad0beaf55011936ac', 'David', 'Goldstein', 51, 61),
(5, 'erinv@gmail.com', '109f4b3c50d7b0df729d299bc6f8e9ef9066971f', 'Erin', 'Valentino', 71, 71),
(6, 'frankwilson@sbcglobal.net', '3ebfa301dc59196f18593c45e519287a23297589', 'Frank Lee', 'Wilson', 81, 81),
(7, 'gary_hernandez@yahoo.com', '1ff2b3704aede04eecb51e50ca698efd50a1379b', 'Gary', 'Hernandez', 91, 101),
(8, 'heatheresway@mac.com', '911ddc3b8f9a13b5499b6bc4638a2b4f3f68bf23', 'Heather', 'Esway', 111, 112);

INSERT INTO Addresses (AddressID, CustomerID, Line1, Line2, City, State, ZipCode, Phone, Disabled) VALUES
(11, 1, '100 East Ridgewood Ave.', '', 'Paramus', 'NJ', '07652', '201-653-4472', 0),
(21, 1, '21 Rosewood Rd.', '', 'Woodcliff Lake', 'NJ', '07677', '201-653-4472', 0),
(31, 2, '16285 Wendell St.', '', 'Omaha', 'NE', '68135', '402-896-2576', 0),
(41, 3, '19270 NW Cornell Rd.', '', 'Beaverton', 'OR', '97006', '503-654-1291', 0),
(51, 4, '186 Vermont St.', 'Apt. 2', 'San Francisco', 'CA', '94110', '415-292-6651', 0),
(61, 4, '1374 46th Ave.', '', 'San Francisco', 'CA', '94129', '415-292-6651', 0),
(71, 5, '6982 Palm Ave.', '', 'Fresno', 'CA', '93711', '559-431-2398', 0),
(81, 6, '23 Mountain View St.', '', 'Denver', 'CO', '80208', '303-912-3852', 0),
(91, 7, '7361 N. 41st St.', 'Apt. B', 'New York', 'NY', '10012', '212-335-2093', 0),
(101, 7, '3829 Broadway Ave.', 'Suite 2', 'New York', 'NY', '10012', '212-239-1208', 0),
(111, 8, '2381 Buena Vista St.', '', 'Los Angeles', 'CA', '90023', '213-772-5033', 0),
(112, 8, '291 W. Hollywood Blvd.', '', 'Los Angeles', 'CA', '90024', '213-391-2938', 0);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipAmount, TaxAmount, ShipDate, ShipAddressID, CardType, CardNumber, CardExpires, BillingAddressID) VALUES
(1000, 1, '2015-02-28 09:40:28', '5.00', '32.32', '2015-02-28 15:32:51', 1, 'Visa', '4111111111111111', '04/2015', 2),
(2000, 2, '2015-02-28 11:23:20', '5.00', '0.00', '2015-02-28 12:52:14', 3, 'Visa', '4012888888881881', '08/2016', 3),
(3000, 1, '2015-02-25 09:44:58', '10.00', '89.92', '2015-02-27 9:11:41', 1, 'Visa', '4111111111111111', '04/2015', 2),
(4000, 3, '2015-02-28 15:22:31', '5.00', '0.00', '2015-03-03 16:32:21', 4, 'American Express', '3782822463100005', '04/2013', 4),
(5000, 4, '2015-02-28 05:43:11', '5.00', '0.00', '2015-03-02 14:21:12', 5, 'Visa', '4111111111111111', '04/2016', 6),
(6000, 5, '2015-02-28 18:37:22', '5.00', '0.00', NULL, 7, 'Discover', '6011111111111117', '04/2016', 7),
(7000, 6, '2015-03-01 23:11:12', '15.00', '0.00', '2015-03-03 10:21:35', 8, 'MasterCard', '5555555555554444', '04/2016', 8),
(8000, 7, '2015-03-02 11:26:38', '5.00', '0.00', NULL, 9, 'Visa', '4012888888881881', '04/2016', 10),
(9000, 4, '2015-03-03 12:22:31', '5.00', '0.00', NULL, 5, 'Visa', '4111111111111111', '04/2016', 6);

INSERT INTO OrderItems (OrderID, ProductID, ItemPrice, DiscountAmount, Quantity) VALUES
(1000, 299, '1199.00', '359.70', 1),
(2000, 499, '489.99', '186.20', 1),
(3000, 399, '2517.00', '1308.84', 1),
(4000, 299, '1199.00', '359.70', 2),
(5000, 599, '299.00', '0.00', 1),
(6000, 599, '299.00', '0.00', 1),
(7000, 199, '699.00', '209.70', 1);

INSERT INTO Administrators (AdminID, EmailAddress, Password, FirstName, LastName) VALUES
(1, 'admin@myguitarshop.com', '6a718fbd768c2378b511f8249b54897f940e9022', 'Admin', 'User'),
(2, 'joel@murach.com', '971e95957d3b74d70d79c20c94e9cd91b85f7aae', 'Joel', 'Murach'),
(3, 'mike@murach.com', '3f2975c819cefc686282456aeae3a137bf896ee8', 'Mike', 'Murach');

