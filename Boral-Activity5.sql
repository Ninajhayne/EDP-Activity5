use ordering_system;

LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/UploadCustomerData.csv'
INTO TABLE customers
	fields terminated by ',' lines terminated by '\r\n'
    ignore 1 lines;
    
SELECT * into outfile 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ExportCustomerData2.txt'
	fields terminated by '\t' lines terminated by '\r\n'
    from customers;
