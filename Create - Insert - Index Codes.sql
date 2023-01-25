-- Customers
CREATE TABLE customers(
    cust_id SMALLSERIAL PRIMARY KEY NOT NULL UNIQUE,
    cust_fname VARCHAR(20)  NOT NULL,
    cust_lname VARCHAR(20) NOT NULL,
    cust_addr1 VARCHAR(20) NOT NULL,
    cust_addr2 VARCHAR(20),
    cust_city VARCHAR(60) NOT NULL,
    cust_postcode CHAR(8) NOT NULL,
    cust_phone_numb VARCHAR(15) NOT NULL,
    cust_email VARCHAR(100) NOT NULL
);

-- Branch

CREATE TABLE branch(
    branch_id SMALLSERIAL PRIMARY KEY NOT NULL UNIQUE,
    branch_addr1 VARCHAR(20) NOT NULL,
    branch_addr2 VARCHAR(20) NOT NULL,
    branch_city VARCHAR(50) NOT NULL,
    branch_phone_numb VARCHAR(15) NOT NULL,
    branch_email VARCHAR(100) NOT NULL
);
 
-- Staff

CREATE TABLE staff(
    staff_id SMALLSERIAL PRIMARY KEY NOT NULL UNIQUE,
    branch_id INT REFERENCES branch(branch_id) NOT NULL,
    staff_fname VARCHAR(20) NOT NULL,
    staff_lname VARCHAR(20) NOT NULL,
    staff_addr1 VARCHAR(20) NOT NULL,
    staff_addr2 VARCHAR(20) NOT NULL,
    staff_city VARCHAR(60) NOT NULL,
    staff_postcode CHAR(8) NOT NULL,
    staff_phone_numb VARCHAR(15) NOT NULL,
    staff_email VARCHAR(100) NOT NULL
);

-- Roles

CREATE TABLE roles(
    role_id SMALLSERIAL PRIMARY KEY NOT NULL,
    role_name VARCHAR(20) NOT NULL
);

-- staff_roles

CREATE TABLE staff_roles(
    staff_id SMALLINT REFERENCES staff(staff_id) NOT NULL,
    role_id SMALLINT REFERENCES roles(role_id) NOT NULL
);

-- Hotel

CREATE TABLE hotel (
  hotel_id smallserial not null unique,
  hotel_name varchar(40) not null,
  hotel_addr1 varchar(20) not null,
  hotel_addr2 varchar(20),
  hotel_postcode varchar(20),
  hotel_email varchar(100)not null,
  hotel_phone_numb varchar(15) not null,
  hotel_country varchar(100) not null,
  PRIMARY KEY (hotel_id)
);

-- Amenities

CREATE TABLE amenities (
  amen_id smallserial not null unique,
  amen_name varchar(20) not null,
  amen_type varchar(20) not null,
  PRIMARY KEY (amen_id)
);

-- Facilities

CREATE TABLE facilities (
  hotel_id smallint not null,
  amen_id smallint not null,
  facil_type varchar(15) not null,
  facil_cost money not null,
  FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
  FOREIGN KEY (amen_id) REFERENCES amenities(amen_id)
);

-- Packages

CREATE TABLE packages (
  pack_id smallserial not null unique,
  hotel_id smallint not null,
  pack_name varchar(30) not null,
  pack_price money not null,
  pack_length varchar(10) null,
  pack_discount varchar(5),
  pack_car_renting char(1) not null,
  PRIMARY KEY (pack_id),
  FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Booking

CREATE TABLE booking(
    booking_id SMALLSERIAL PRIMARY KEY NOT NULL UNIQUE,
    customer_id SMALLINT REFERENCES customers(cust_id) NOT NULL,
    staff_id SMALLINT REFERENCES staff(staff_id) NOT NULL,
    package_id SMALLINT REFERENCES packages(pack_id) NOT NULL,
    check_in TIME NOT NULL,
    check_out TIME NOT NULL,
    booking_travellers SMALLINT NOT NULL
);

-- Traveller details

CREATE TABLE travellers_details (
  travellers_id smallserial not null unique,
  booking_id smallint not null,
  travel_fname varchar(20) not null,
  travel_lname varchar(20) not null,
  travel_addr1 varchar(20) not null,
  travel_addr2 varchar(20) null,
  travel_city varchar(60) not null,
  travel_postcode char(8) not null,
  travel_dob date not null,
  travel_email varchar(100) not null,
  travel_phone_numb varchar(15) not null,
  travel_passport char(9) not null,
  PRIMARY KEY (travellers_id),
  FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);

--  flight
 
CREATE TABLE flight (
    flight_id SERIAL PRIMARY KEY UNIQUE NOT NULL,
    flight_code VARCHAR(10) NOT NULL,
    flight_destination VARCHAR(50) NOT NULL,
    flight_origin VARCHAR(50) NOT NULL,
    flight_takeoff_time TIMESTAMP NOT NULL,
    flight_landing_time TIMESTAMP NOT NULL,
    flight_date DATE NOT NULL,
    flight_class VARCHAR(11) NOT NULL
);

-- Flight booking

CREATE TABLE flight_booking (
    flight_id INT REFERENCES flight(flight_id),
    booking_id INT REFERENCES booking(booking_id),
    flight_type varchar(8)
);
 
-- payments
 
CREATE TABLE payments (
    payment_id SMALLSERIAL PRIMARY KEY UNIQUE NOT NULL,
    booking_id SMALLINT REFERENCES booking(booking_id) NOT NULL,
    payment_instalments SMALLINT NOT NULL,
    payment_paid BOOLEAN NOT NULL,
    payment_deadline DATE NOT NULL,
    payment_date DATE
);

-- installments
 
CREATE TABLE installments (
    install_id SMALLSERIAL PRIMARY KEY UNIQUE NOT NULL,
    payment_id SMALLINT REFERENCES payments(payment_id) NOT NULL,
    install_due_date DATE NOT NULL,
    install_amount MONEY NOT NULL
);
 
-- rental_company
 
CREATE TABLE rental_company (
    rentalcomp_id SMALLSERIAL PRIMARY KEY UNIQUE NOT NULL,
    rentalcomp_name VARCHAR(50) NOT NULL,
    rentalcomp_addr1 VARCHAR(20) NOT NULL,
    rentalcomp_addr2 VARCHAR(20),
    rentalcomp_postcode VARCHAR(20),
    rentalcomp_city VARCHAR(90) NOT NULL,
    rentalcomp_country VARCHAR(100) NOT NULL,
    rentalcomp_phone_numb VARCHAR(15) NOT NULL
);
 
--  vehicle_info
 
CREATE TABLE vehicle_info (
    veh_id SMALLSERIAL PRIMARY KEY UNIQUE NOT NULL,
    rentalcomp_id INT REFERENCES rental_company(rentalcomp_id) NOT NULL,
    veh_size INT NOT NULL,
    veh_plate_number VARCHAR(20) NOT NULL,
    veh_manufacturer VARCHAR(50) NOT NULL
);
 
-- vehicle_booking
 
CREATE TABLE vehicle_booking (
    booking_id INT REFERENCES booking(booking_id) NOT NULL,
    veh_id INT REFERENCES vehicle_info(veh_id) NOT NULL
);


-- Customer data

insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Ronni', 'Reid', '5 Thackeray Drive', '', 'Mineiros', '5830-000', '55(579)253-7402', 'rreid0@oaic.gov.au');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Ingrid', 'Ellar', '48534 Monument Court', '', 'Borzechów', '9824-224', '48(363)152-9721', 'iellar1@nydailynews.com');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Bronson', 'Drane', '4 Helena Trail', '', 'Xinzhai', 'BJ21 KAJ', '86(471)632-9825', 'bdrane2@ucoz.com');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Shani', 'De Carlo', '25 Quincy Center', '', 'Kuluran', 'LKJK 190', '62(453)419-4746', 'sdecarlo3@jiathis.com');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Coralyn', 'Scinelli', '93646 Street', '', 'Stanari', 'KJSG 179', '387(788)270-131', 'cscinelli4@nature.com');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Quinton', 'Germaine', '33 Toban Parkway', '', 'Coruripe', '7230-000', '55(638)185-0287', 'qgermaine5@howstuffworks.com');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Valentine', 'Udy', '11 Monica Drive', '', 'Jangdam', 'TYU1 678', '86(364)926-6404', 'vudy6@virginia.edu');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Jacenta', 'Challiss', '76200 Miller Pass', '', 'Tibro', 'B543 3F5', '46(634)930-7568', 'jchalliss7@naver.com');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ('Clemence', 'Pittock', '557 Eagle Crest Park', '', 'Jinjiang', 'AGHO 133', '86(468)474-6198', 'cpittock8@uol.com.br');
insert into customers (cust_fname, cust_lname, cust_addr1, cust_addr2, cust_city, cust_postcode, cust_phone_numb, cust_email) values ( 'Anabal', 'Grindell', '9824 Anni Pass', '', 'Qingyun', '3098 297', '86(606)300-3901', 'agrindell9@howstuffworks.com');

-- Branch data

insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('289 Hoffman Crossing', '', 'Amsterdam Rivierenbuurt', '303-846-3706', 'gtolmie0@weibo.com');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('63 Carpenter Point', '', 'Mehtar Lām', '321-165-0436', 'mflintoft1@mail.ru');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('84 Hintze Center', '', 'Lyubertsy', '491-533-7624', 'bviggars2@shutterfly.com');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('4133 Ryan Crossing', '', 'Anicuns', '924-484-6199', 'cantoniazzi3@army.mil');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('42 Jay Crossing', '', 'Qiewa', '498-138-0331', 'wmatuszinski4@newsvine.com');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('73 Waywood Plaza', '', 'Taveiro', '482-613-4602', 'cphilippe5@twitter.com');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('81064 Amer Road', '', 'Várzea', '817-735-7013', 'mkeasey6@slashdot.org');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('33028 Rutledge Way', '', 'Jiupu', '629-187-5277', 'fgrady7@google.it');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ('3817 Hermina Street', '', 'Jīwani', '636-498-5979', 'rbick8@webs.com');
insert into branch (branch_addr1, branch_addr2, branch_city, branch_phone_numb, branch_email) values ( '77 Amer Junction', '', 'Kingscourt', '470-988-3682', 'adannehl9@auda.org.au');

-- Staff data

insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('1', 'Rubina', 'Stackbridge', '1870 Orin Court', '', 'Jepara', 'GU16 7HF', '565-202-4711', 'rstackbridge0@walmart.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('1', 'Colan', 'Lindell', '7 Bowman Parkway', '', 'Fentange', 'PO56 7GZ', '454-202-6309', 'clindell1@wordpress.org');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('2', 'Pooh', 'Melsom', '0637 Debs Drive', '', 'Tagbacan Ibaba', 'BK16 7UK', '301-303-7696', 'pmelsom2@nsw.gov.au');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('3', 'Denys', 'Rookeby', '6 Fallview Point', '', 'Dobratice', 'PO16 7GZ', '714-181-4038', 'drookeby3@redcross.org');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('4', 'Prinz', 'Corradengo', '746 Vidon Point', '', 'Pittsburgh', 'BN15 255', '412-914-7745', 'pcorradengo4@tumblr.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('5', 'Clarisse', 'Dulanty', '976 Porter Place', '', 'Temperak', 'SW1W 0NY', '601-597-9247', 'cdulanty5@mediafire.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('3', 'Francklin', 'Cuchey', '8200 Oriole Pass', '', 'Skövde', 'B541 P33', '608-529-8294', 'fcuchey6@skype.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('2', 'Maryanne', 'Balfour', '51847 Arr Street', '', 'Kauhava', 'BN16 2KI', '992-613-4427', 'mbalfour7@seesaa.net');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('2', 'Sylvester', 'Chasmer', '1 Bay Center', '', 'Quiches', 'LO54 LKN', '780-614-8351', 'schasmer8@about.me');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('3', 'Edgardo', 'Druce', '2 Summer Center', '', 'Norrköping', 'ED03 K72', '434-658-4866', 'edruce9@t-online.de');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('6', 'Elinor', 'Lowin', '6 Dahle Lane', '', 'La Fortuna', 'BN15 2LE', '475-127-3861', 'elowin0@salon.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('7', 'Nisse', 'Bedinn', '6064 Hagan Alley', '', 'Ngrowo', 'HK26 2LM', '436-702-6438', 'nbedinn1@symantec.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('7', 'Phebe', 'Nestor', '644 Amer Terrace', '', 'Bytkiv', 'KO78 6ML', '509-381-6733', 'pnestor2@rediff.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('8', 'Lowrance', 'Hutchens', '5 Anzinger Circle', '', 'Örebro', 'TO16 7GZ', '807-595-7236', 'lhutchens3@bbc.co.uk');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('8', 'Andriana', 'Mignot', '212 Manley Park', '', 'Las Palmas', 'NU43 HJL', '661-926-1304', 'amignot4@hostgator.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('9', 'Mack', 'Paradyce', '27 Hintze Pass', '', 'Otoka', 'GR29 4Lh', '253-381-8505', 'mparadyce5@furl.net');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('9', 'Ilsa', 'Camerello', '4 Glendale Place', '', 'Ramalhal', 'BI80 5KJ', '277-582-5572', 'icamerello6@go.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('9', 'Stearne', 'Cartmill', '89 Calypso Center', '', 'Želetava', 'BH53 140', '462-161-7110', 'scartmill7@edublogs.org');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('10', 'Xena', 'Conahy', '6 Drewry Avenue', '', 'Can-Avid', 'ES11 7YU', '131-748-4019', 'xconahy8@aol.com');
insert into staff (branch_id, staff_fname, staff_lname, staff_addr1, staff_addr2, staff_city, staff_postcode, staff_phone_numb, staff_email) values ('10', 'Laurel', 'Brambill', '6 Warrior Court', '', 'Tangzhuang', 'JK10 1HE', '351-758-7977', 'lbrambill9@goo.gl');

-- Roles data

insert into roles (role_name) values ('Manager');
insert into roles (role_name) values ('Sales');
insert into roles (role_name) values ('Accountant');
insert into roles (role_name) values ('Cleaner');
insert into roles (role_name) values ('Receptionist');
insert into roles (role_name) values ('Assitant');
insert into roles (role_name) values ('It Support');

-- staff_roles data

insert into staff_roles (staff_id, role_id) values (1, 1);
insert into staff_roles (staff_id, role_id) values (2, 2);
insert into staff_roles (staff_id, role_id) values (3, 3);
insert into staff_roles (staff_id, role_id) values (4, 4);
insert into staff_roles (staff_id, role_id) values (5, 5);
insert into staff_roles (staff_id, role_id) values (6, 6);
insert into staff_roles (staff_id, role_id) values (7, 7);
insert into staff_roles (staff_id, role_id) values (8, 5);
insert into staff_roles (staff_id, role_id) values (9, 1);
insert into staff_roles (staff_id, role_id) values (10, 2);
insert into staff_roles (staff_id, role_id) values (11, 3);
insert into staff_roles (staff_id, role_id) values (12, 4);
insert into staff_roles (staff_id, role_id) values (13, 5);
insert into staff_roles (staff_id, role_id) values (14, 6);
insert into staff_roles (staff_id, role_id) values (15, 7);
insert into staff_roles (staff_id, role_id) values (16, 7);
insert into staff_roles (staff_id, role_id) values (17, 5);
insert into staff_roles (staff_id, role_id) values (18, 7);
insert into staff_roles (staff_id, role_id) values (19, 4);
insert into staff_roles (staff_id, role_id) values (20, 4);

-- hotel data

insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Langosh-Mueller', '81697 Arkansas Trail', '', 'HU10', 'dbette0@webnode.com', '909-735-4822', 'Peru');
insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Bergstrom Inc', '9105', '87 Summit Pass', '676150', 'rmille1@state.tx.us', '115-335-2407', 'Argentina');
insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Christiansen, Kertzmann and Reilly', '72 Delaware Circle', '72 Delaware Circle', null, 'aianson2@java.com', '326-521-2500', 'Indonesia');
insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Blanda-Howe', '8 Swallow Hill', '', null, 'kglossup3@theguardian.com', '679-136-8367', 'Democratic Republic of the Congo');
insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Zboncak, Gulgowski and Kuhic', '8123 Transport Hill', '8123 Transport Hill', '1114', 'dbarrable4@drupal.org', '884-297-9386', 'Angola');
insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Lueilwitz, Kemmer and Durgan', '2125 Melby Trail', '2125 Melby Trail', null, 'lcapel5@angelfire.com', '906-743-7837', 'Iraq');
insert into hotel (hotel_name, hotel_addr1, hotel_addr2, hotel_postcode, hotel_email, hotel_phone_numb, hotel_country) values ('Mertz Group', '2519 North Court', '', '353159', 'ecastaner6@google.de', '670-922-2974', 'United Arab Emirates');


-- Amenities data

insert into amenities (amen_name, amen_type) values ('Robe', 'Clothes');
insert into amenities (amen_name, amen_type) values ('Slippers', 'Clothes');
insert into amenities (amen_name, amen_type) values ('High-end soap', 'Product');
insert into amenities (amen_name, amen_type) values ('Slippers', 'Clothes');
insert into amenities (amen_name, amen_type) values ('Robe', 'Clothes');
insert into amenities (amen_name, amen_type) values ('Bible', 'Book');
insert into amenities (amen_name, amen_type) values ('Robe', 'Clothes');
insert into amenities (amen_name, amen_type) values ('Bible', 'Book');
insert into amenities (amen_name, amen_type) values ('Bible', 'Book');
insert into amenities (amen_name, amen_type) values ('Robe', 'Clothes');

-- Facilities data

insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (1, 2, 'Sauna', '31.77');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (3, 3, 'Gym', '9.96');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (2, 5, 'Gym', '9.27');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (5, 8, 'Gym', '30.43');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (1, 10, 'Gym', '36.28');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (3, 1, 'Sauna', '20.03');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (7, 2, 'Gym', '33.84');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (6, 6, 'Gym', '7.94');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (6, 9, 'Sauna', '8.84');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (3, 7, 'Sauna', '11.88');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (5, 4, 'Pool', '16.43');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (6, 10, 'Sauna', '18.86');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (4, 4, 'Gym', '32.62');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (2, 5, 'Sauna', '15.85');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (6, 2, 'Pool', '3.21');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (7, 7, 'Pool', '1.33');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (1, 9, 'Pool', '11.79');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (2, 6, 'Pool', '12.72');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (3, 1, 'Pool', '15.59');
insert into facilities (hotel_id, amen_id, facil_type, facil_cost) values (6, 4, 'Sauna', '30.86');


-- Packages data

insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('1', '1st class Experience', '996.53', '2 days', '10%', 'N');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('1', '2nd class Experience', '572.69', '7 days', '', 'Y');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('2', 'Bergstrom Experence', '421.15', '5 days', '12%', 'Y');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('3', 'Kertzmann and Reilly Upgrade', '719.93', '2 days', '', 'N');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('4', 'Blanda-Howe Life', '559.71', '2 days', '', 'Y');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('4', 'Blanda-Howe', '792.30', '9 days', '20%', 'N');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('5', 'Zboncak, GulKuhic Fun', '387.18', '6 days', '', 'N');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('5', 'Zboncak Live', '995.31', '4 days', '', 'N');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('6', 'Kemmer Durgan Escape', '562.49', '7 days', '70%', 'N');
insert into packages (hotel_id, pack_name, pack_price, pack_length, pack_discount, pack_car_renting) values ('7', 'Mertz Group', '832.58', '10 days', '', 'Y');

-- Booking data

insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (1, 1, 1, '7:34 AM', '8:15 PM', 1);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (2, 2, 2, '6:02 AM', '10:24 PM', 2);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (3, 3, 3, '7:49 AM', '7:06 AM', 3);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (4, 4, 4, '5:24 PM', '3:20 PM', 4);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (5, 5, 5, '9:43 AM', '11:46 AM', 1);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (6, 6, 6, '3:26 PM', '9:51 AM', 3);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (7, 7, 7, '9:18 PM', '8:29 AM', 5);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (8, 8, 8, '7:33 PM', '10:05 PM', 2);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (9, 9, 9, '10:07 PM', '5:22 PM', 3);
insert into booking (customer_id, staff_id, package_id, check_in, check_out, booking_travellers) values (10, 10, 10, '8:51 AM', '10:18 PM', 1);

-- Traveller Details data

insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (3, 'Muire', 'Ffrench', '3543 Hermina Point', '', 'Toledo', '14243610', '1986-04-08', 'mffrench0@ezinearticles.com', '419-413-7985', '6987-2309');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (7, 'Joete', 'Ginglell', '3124 Walton Pass', '', 'Pataruman', 'BHYU 287', '1998-08-09', 'jginglell1@wikipedia.org', '494-874-4918', '4868-3867');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (3, 'Allen', 'Ramalhete', '028 Anderson Trail', '', 'Jajawai', 'UJ78 101', '1996-06-19', 'aramalhete2@posterous.com', '439-896-6234', '2695-7754');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (6, 'Faith', 'Rackstraw', '33035 Shopko Plaza', '', 'Uinskoye', 'B617 520', '1984-12-11', 'frackstraw3@digg.com', '613-157-5574', '1695-3272');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (6, 'Godfree', 'Cowtherd', '78 Thackeay Crossing', '', 'San José', 'BN40 602', '1986-01-27', 'gcowtherd4@usgs.gov', '563-138-9559', '3857-0155');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (1, 'Esme', 'Laurenty', '22144 Amoth Trail', '', 'Saint-Denis', 'HY14 5TM', '1985-12-20', 'elaurenty5@craigslist.org', '938-398-6644', '3261-3369');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (5, 'Brewster', 'Gerardeaux', '9260 Vidon Plaza', '', 'Archis', 'PO16 7GZ', '2000-10-10', 'bgerardeaux6@tripod.com', '678-583-5654', '9035-7989');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (2, 'Chadwick', 'Sember', '4 Cottonwood Road', '', 'Fatufaun', 'PO16 7GZ', '1994-03-03', 'csember7@issuu.com', '112-826-8477', '0268-1037');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (5, 'Trever', 'Leasor', '37077 Mocking Plaza', '', 'Lintan Chengguan', 'PO16 7GZ', '1988-06-11', 'tleasor8@telegraph.co.uk', '330-196-8243', '5356-2265');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (3, 'Maurise', 'Kyllford', '924 Farwell Court', '', 'Žatec', 'SW1W 0NY', '1989-01-19', 'mkyllford9@who.int', '331-202-6377', '0178-0799');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (3, 'Margette', 'Chilton', '805 Anzinger Street', '', 'Wonorejo', 'SW1W 0NY', '1984-06-24', 'mchiltona@sogou.com', '565-853-7673', '3808-0823');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (7, 'Tove', 'MacIlraith', '6769 Fremont Alley', '', 'Guozhuang', 'SW1W 0NY', '1987-05-03', 'tmacilraithb@webmd.com', '713-189-4333', '7856-2002');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (1, 'Matthiew', 'Bevis', '5 Hoffman Drive', '', 'Ino', 'SW1W 0NY', '1985-05-23', 'mbevisc@mayoclinic.com', '460-696-5966', '8951-9072');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (2, 'Annissa', 'McComas', '91 Village Hill', '', 'Sañgay', 'BH F8006', '1986-10-31', 'amccomasd@wikispaces.com', '967-596-1731', '0067-8117');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (6, 'Maurits', 'Warlaw', '34 Luster Plaza', '', 'Ganjiang', 'TY18 MNH', '1994-04-14', 'mwarlawe@accuweather.com', '632-149-2992', '2507-9987');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (4, 'Ole', 'Walkden', '3 Express Park', '', 'Ziketan', 'LK15 194', '1988-07-23', 'owalkdenf@pbs.org', '199-304-1226', '7510-0506');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (5, 'Muriel', 'Jackett', '4 Sycamore Terrace', '', 'Dengjiang', 'TH15 179', '1991-08-28', 'mjackettg@surveymonkey.com', '526-923-2459', '3063-0466');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (7, 'Sim', 'Godleman', '5393 Miller Plaza', '', 'Dmytrivka', 'HJ25 53F', '1997-02-05', 'sgodlemanh@pbs.org', '395-393-4904', '2125-4075');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (3, 'Shannon', 'Luxford', '16142 Dahle Road', '', 'Hofors', 'B813 527', '1991-05-15', 'sluxfordi@xrea.com', '661-314-2249', '0615-7582');
insert into travellers_details (booking_id, travel_fname, travel_lname, travel_addr1, travel_addr2, travel_city, travel_postcode, travel_dob, travel_email, travel_phone_numb, travel_passport) values (7, 'Carr', 'Mabon', '17 Tony Drive', '', 'Karma', 'LKAR 539', '1994-01-18', 'cmabonj@ted.com', '944-610-1639', '7877-1642');

-- flight data

insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('JA-65', 'Japan', 'China', '2022-11-05 6:42 AM', '2022-11-06 3:26 AM', '5/19/2022',  'Economy');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('AZ-67', 'Azerbaijan', 'Greece', '2022-12-08 1:27 AM', '2022-12-09 3:44 PM', '4/30/2022', 'Business');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('CH-09', 'China', 'Russia', '2022-09-01 2:22 AM', '2022-09-02 1:56 AM', '10/14/2022', 'Business');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('TH-27', 'Thailand', 'Netherlands', '2021-12-14 3:44 PM', '2021-12-15 4:25 PM', '1/2/2022', 'Economy');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('PO-89', 'Portugal', 'Poland', '2022-05-27 6:29 AM', '2022-05-28 12:36 AM', '7/2/2022', 'First-class');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('CH-80', 'China', 'Ukraine', '2022-07-04 1:57 PM', '2022-07-05 5:40 PM', '4/2/2022', 'Economy');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('JA-89', 'Japan', 'Cuba', '2022-11-05 8:59 AM', '2022-11-06 8:58 AM', '8/12/2022', 'Economy');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('FR-50', 'France', 'Sweden', '2022-04-18 1:01 PM', '2022-04-19 11:12 PM', '5/15/2022', 'Economy');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('PO-00', 'Portugal', 'Mexico', '2022-10-14 6:08 PM', '2022-10-15 12:10 AM', '6/8/2022', 'First-class');
insert into flight (flight_code, flight_destination, flight_origin, flight_takeoff_time, flight_landing_time, flight_date, flight_class) values ('MA-49', 'Malaysia', 'Peru', '2022-07-20 11:39 AM', '2022-07-21 12:36 PM', '12/28/2021',  'Economy');

-- flight booking details

insert into flight_booking (flight_id, booking_id, flight_type) values (1, 1, 'Outbound');
insert into flight_booking (flight_id, booking_id, flight_type) values (2, 2, 'Return');
insert into flight_booking (flight_id, booking_id, flight_type) values (3, 3, 'Outbound');
insert into flight_booking (flight_id, booking_id, flight_type) values (4, 4, 'Return');
insert into flight_booking (flight_id, booking_id, flight_type) values (5, 5, 'Return');
insert into flight_booking (flight_id, booking_id, flight_type) values (6, 6, 'Outbound');
insert into flight_booking (flight_id, booking_id, flight_type) values (7, 7, 'Return');
insert into flight_booking (flight_id, booking_id, flight_type) values (8, 8, 'Return');
insert into flight_booking (flight_id, booking_id, flight_type) values (9, 9, 'Outbound');
insert into flight_booking (flight_id, booking_id, flight_type) values (10, 10, 'Outbound');

-- payments data

insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (1, 5, true, '12/11/2021', '6/15/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (2, 5, false, '12/13/2021', '8/22/2020');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (3, 1, true, '12/30/2021', '7/29/2021');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (4, 5, false, '1/11/2022', '10/16/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (5, 3, true, '1/11/2022', '7/30/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (6, 5, false, '1/1/2022', '2/3/2021');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (7, 4, true, '1/12/2022', '9/20/2021');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (8, 4, false, '12/26/2021', '4/15/2021');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (9, 2, true, '12/26/2021', '9/8/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (10, 2, false, '12/23/2021', '11/3/2021');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (1, 5, true, '12/15/2021', '6/14/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (2, 5, false, '12/7/2021', '11/24/2021');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (5, 1, true, '12/25/2021', '1/23/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (3, 4, false, '12/19/2021', '2/1/2022');
insert into payments (booking_id, payment_instalments, payment_paid, payment_deadline, payment_date) values (2, 1, true, '1/4/2022', '9/24/2021');

-- instalments data

insert into installments (payment_id, install_due_date, install_amount) values (10, '7/10/2021', '77.58');
insert into installments (payment_id, install_due_date, install_amount) values (7, '9/25/2022', '171.64');
insert into installments (payment_id, install_due_date, install_amount) values (10, '8/10/2022', '227.73');
insert into installments (payment_id, install_due_date, install_amount) values (4, '12/21/2020', '135.47');
insert into installments (payment_id, install_due_date, install_amount) values (6, '4/28/2021', '228.17');
insert into installments (payment_id, install_due_date, install_amount) values (15, '8/1/2022', '80.54');
insert into installments (payment_id, install_due_date, install_amount) values (12, '4/29/2021', '208.05');
insert into installments (payment_id, install_due_date, install_amount) values (3, '11/10/2021', '242.52');
insert into installments (payment_id, install_due_date, install_amount) values (14, '8/18/2021', '2.91');
insert into installments (payment_id, install_due_date, install_amount) values (6, '1/19/2021', '171.55');
insert into installments (payment_id, install_due_date, install_amount) values (2, '7/22/2021', '27.87');
insert into installments (payment_id, install_due_date, install_amount) values (5, '1/9/2021', '114.06');
insert into installments (payment_id, install_due_date, install_amount) values (4, '5/7/2022', '141.15');
insert into installments (payment_id, install_due_date, install_amount) values (1, '4/25/2021', '132.58');
insert into installments (payment_id, install_due_date, install_amount) values (15, '10/22/2021', '39.16');
insert into installments (payment_id, install_due_date, install_amount) values (15, '11/21/2022', '77.72');
insert into installments (payment_id, install_due_date, install_amount) values (10, '6/25/2022', '25.51');
insert into installments (payment_id, install_due_date, install_amount) values (9, '4/15/2021', '222.49');
insert into installments (payment_id, install_due_date, install_amount) values (2, '8/21/2022', '19.56');
insert into installments (payment_id, install_due_date, install_amount) values (3, '10/20/2022', '79.14');
insert into installments (payment_id, install_due_date, install_amount) values (11, '4/11/2022', '102.69');
insert into installments (payment_id, install_due_date, install_amount) values (2, '6/5/2021', '178.67');
insert into installments (payment_id, install_due_date, install_amount) values (4, '1/23/2021', '213.32');
insert into installments (payment_id, install_due_date, install_amount) values (9, '10/22/2021', '69.96');
insert into installments (payment_id, install_due_date, install_amount) values (13, '11/11/2022', '147.86');
insert into installments (payment_id, install_due_date, install_amount) values (6, '9/24/2021', '149.21');
insert into installments (payment_id, install_due_date, install_amount) values (14, '8/20/2021', '131.98');
insert into installments (payment_id, install_due_date, install_amount) values (6, '5/31/2021', '13.60');
insert into installments (payment_id, install_due_date, install_amount) values (11, '10/16/2022', '62.53');
insert into installments (payment_id, install_due_date, install_amount) values (9, '2/7/2022', '15.47');
insert into installments (payment_id, install_due_date, install_amount) values (13, '9/12/2021', '220.36');
insert into installments (payment_id, install_due_date, install_amount) values (7, '5/7/2021', '215.24');
insert into installments (payment_id, install_due_date, install_amount) values (10, '8/2/2021', '241.52');
insert into installments (payment_id, install_due_date, install_amount) values (3, '12/21/2020', '174.63');
insert into installments (payment_id, install_due_date, install_amount) values (1, '5/6/2021', '224.37');
insert into installments (payment_id, install_due_date, install_amount) values (9, '11/23/2022', '46.29');
insert into installments (payment_id, install_due_date, install_amount) values (11, '8/27/2022', '220.25');
insert into installments (payment_id, install_due_date, install_amount) values (10, '4/2/2021', '171.33');
insert into installments (payment_id, install_due_date, install_amount) values (15, '1/3/2021', '10.74');
insert into installments (payment_id, install_due_date, install_amount) values (5, '10/12/2022', '124.42');
insert into installments (payment_id, install_due_date, install_amount) values (12, '10/18/2022', '239.20');
insert into installments (payment_id, install_due_date, install_amount) values (13, '1/16/2022', '94.30');
insert into installments (payment_id, install_due_date, install_amount) values (2, '12/18/2020', '174.05');
insert into installments (payment_id, install_due_date, install_amount) values (13, '2/13/2021', '3.90');
insert into installments (payment_id, install_due_date, install_amount) values (3, '11/28/2021', '109.30');
insert into installments (payment_id, install_due_date, install_amount) values (2, '7/13/2021', '241.36');
insert into installments (payment_id, install_due_date, install_amount) values (7, '9/24/2021', '23.52');
insert into installments (payment_id, install_due_date, install_amount) values (14, '8/25/2021', '140.18');
insert into installments (payment_id, install_due_date, install_amount) values (11, '6/3/2022', '68.72');
insert into installments (payment_id, install_due_date, install_amount) values (2, '1/22/2021', '157.48');
insert into installments (payment_id, install_due_date, install_amount) values (3, '9/25/2021', '56.74');
insert into installments (payment_id, install_due_date, install_amount) values (10, '2/15/2021', '340.75');

-- rental_company data

insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Babbleblab', '1 Kingsford Park', '88 Mitchell Alley', '36350', 'Santa Rita', 'Mexico', '578-897-5271');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Quimm', '7 Morningstar Center', '3 Spohn Terrace', '11600-000', 'São Sebastião', 'Brazil', '947-848-4521');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Dazzlesphere', '532 Iowa Road', '01 Hovde Park', '2422', 'Botao', 'Philippines', '844-146-8570');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Viva', '5285 Mallard Plaza', '624 Oak Plaza', null, 'Chagou', 'China', '957-974-1642');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Twitterbridge', '9459 Maple Parkway', '61083 Russ Terrace', '142281', 'Protvino', 'Russia', '933-276-8827');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Latz', '33 Shoshone Avenue', '729 Knutson Junction', '403879', 'Kamyshin', 'Russia', '504-865-1378');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Topicshots', '8761 Caliangt Center', '1226 Spenser Street', '5964', 'Nikopol', 'Bulgaria', '427-616-3124');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Trupe', '406 Tennessee Hill', '', '36980-000', 'Bataiporã', 'Brazil', '112-133-2509');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Gabtype', '89 8th Court', '46924 Badeau Avenue', '747 69', 'Pustá Polom', 'Czech Republic', '257-663-9713');
insert into rental_company (rentalcomp_name, rentalcomp_addr1, rentalcomp_addr2, rentalcomp_postcode, rentalcomp_city, rentalcomp_country, rentalcomp_phone_numb) values ('Feedfish', '039 Lindbergh Street', '69947 Susan Road', 'G6G', 'Princeville', 'Canada', '329-734-4555');

-- Vehicle_info data

insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (1, 1, '0591-3971', 'Hummer');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (2, 2, '63323-117', 'Maserati');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (3, 3, '48883-007', 'Lexus');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (4, 4, '66424-045', 'Dodge');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (5, 5, '58876-103', 'Subaru');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (6, 6, '14783-029', 'Lincoln');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (7, 7, '22700-151', 'Kia');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (8, 8, '76237-278', 'Ford');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (9, 9, '55714-4502', 'Mercury');
insert into vehicle_info (rentalcomp_id, veh_size, veh_plate_number, veh_manufacturer) values (10, 10, '54868-0023', 'Ford');

-- vehicle_booking data

insert into vehicle_booking (booking_id, veh_id) values (1, 3);
insert into vehicle_booking (booking_id, veh_id) values (9, 1);
insert into vehicle_booking (booking_id, veh_id) values (2, 6);
insert into vehicle_booking (booking_id, veh_id) values (2, 10);
insert into vehicle_booking (booking_id, veh_id) values (5, 8);
insert into vehicle_booking (booking_id, veh_id) values (6, 8);
insert into vehicle_booking (booking_id, veh_id) values (5, 10);
insert into vehicle_booking (booking_id, veh_id) values (6, 1);
insert into vehicle_booking (booking_id, veh_id) values (8, 9);
insert into vehicle_booking (booking_id, veh_id) values (3, 8);



CREATE INDEX traveller_passport_details ON travellers_details(travel_passport);
CREATE INDEX hotel_name ON hotel(hotel_name);
CREATE INDEX booking_staff ON booking(staff_id); 
CREATE INDEX booking_customer ON booking(customer_id); 
CREATE INDEX booking_package ON booking(package_id); 
CREATE INDEX installment_payment ON installments(payment_id); 

