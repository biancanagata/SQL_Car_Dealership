create table sales_person(
	SalesPersonID integer primary key,
	name VARCHAR(100),
	email VARCHAR (150),
	phone VARCHAR (50)
);

create table customer(
	CustomerID integer primary key, 
	name VARCHAR (100),
	address VARCHAR(400),
	form_of_payment VARCHAR(20)
);

create table Car( 
	Car_id integer primary key,
	Car_model VARCHAR(50),
	Car_condition VARCHAR(50)
);

create table Invoice(
	InvoiceID integer primary key,
	Car_id integer, 
	SalesPersonID integer,
	CustomerID integer,
	foreign key(Car_id) references Car(Car_id),
	foreign key(SalesPersonID) references sales_person(SalesPersonID),
	foreign key(CustomerID) references customer(CustomerID)
);

create table Mechanic(
	Mechanic_id integer primary key, 
	mechanic_name VARCHAR(100)
);

create table ServiceTicket(
	Ticket_id integer primary key, 
	Car_serial_number integer, 
	Mechanic_id integer,
	foreign key(Mechanic_id) references Mechanic(Mechanic_id)
);

insert into sales_person(
	SalesPersonID, 
	name, 
	email, 
	phone
) values (
	1,
	'Barbara', 
	'barbara@gmail.com',
	'555-232-555'
);

insert into sales_person(
	SalesPersonID, 
	name, 
	email, 
	phone
) values (
	2,
	'Bianca', 
	'bianca@gmail.com',
	'555-132-555'
);

insert into sales_person(
	SalesPersonID, 
	name, 
	email, 
	phone
) values (
	3,
	'Amanda', 
	'amanda@gmail.com',
	'255-232-555'
);

insert into customer(
	CustomerID, 
	name, 
	address, 
	form_of_payment
) values (
	1,
	'Amanda', 
	'8st street, NY',
	'Card'
);

insert into customer(
	CustomerID, 
	name, 
	address, 
	form_of_payment
) values (
	2,
	'Bruno', 
	'8th street, NY',
	'Card'
);

insert into customer(
	CustomerID, 
	name, 
	address, 
	form_of_payment
) values (
	3,
	'Clara', 
	'123 dowd lane, NY',
	'Card'
);

insert into car(
	Car_id,
	Car_model, 
	Car_condition
) values (
	1,
	'Honda CRV',
	'Used'
);

insert into car(
	Car_id,
	Car_model, 
	Car_condition
) values (
	2,
	'Honda HRV',
	'Used'
);

insert into car(
	Car_id,
	Car_model, 
	Car_condition
) values (
	3,
	'Jeep Renegade',
	'New'
);

insert into invoice(
	InvoiceID,
	Car_id, 
	SalesPersonID,
	CustomerId
) values (
	1,
	1,
	1,
	1
);

insert into invoice(
	InvoiceID,
	Car_id, 
	SalesPersonID,
	CustomerId
) values (
	2,
	2,
	2,
	2
);

insert into invoice(
	InvoiceID,
	Car_id, 
	SalesPersonID,
	CustomerId
) values (
	3,
	3,
	3,
	3
);

insert into mechanic(
	Mechanic_id,
	mechanic_name
) values (
	1,
	'Jonas'
);

insert into mechanic(
	Mechanic_id,
	mechanic_name
) values (
	2,
	'Caio'
);

insert into mechanic(
	Mechanic_id,
	mechanic_name
) values (
	3,
	'Julio'
);

insert into serviceticket(
	ticket_id, 
	car_serial_number, 
	mechanic_id
) values (
	1,
	1,
	1
);

insert into serviceticket(
	ticket_id, 
	car_serial_number, 
	mechanic_id
) values (
	2,
	2,
	2
);

insert into serviceticket(
	ticket_id, 
	car_serial_number, 
	mechanic_id
) values (
	3,
	3,
	3
);

-- Using Stored Functions: 
create or replace function insert_customer(_CustomerID integer, _name VARCHAR,_address VARCHAR, _form_of_payment VARCHAR) returns void as $$
begin 
	insert into customer(CustomerID,name,address, form_of_payment) values(_customerid,_name, _address, _form_of_payment);
end;
$$ language plpgsql;


select insert_customer(4,'Cassia','1234 Gato St','cash' );
select insert_customer(5,'Sheila', '23 Lulu Street, NY', 'check');

create or replace function insert_car(_Car_id INTEGER , _Car_model VARCHAR, _Car_condition VARCHAR) returns void as $$
begin 
	insert into Car(Car_id, Car_model, Car_condition) values (_Car_id, _Car_model, _Car_condition);
end;
$$ language plpgsql;

select INSERT_CAR(4,'Tesla Y', 'New');
select INSERT_CAR(5,'Toyota Corolla', 'Used');







