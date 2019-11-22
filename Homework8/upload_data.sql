CREATE TABLE sys.averages (
congress int,
chamber	varchar(255),
bioguide varchar(255),	
last_name varchar(255),	
state varchar(255),
district varchar(255),
party varchar(255),	
votes int,	
agree_pct int,	
predicted_agree	int,
net_trump_vote int
);

LOAD DATA INFILE  '/Users/zdalexander/Desktop/averages.csv'
INTO TABLE sys.averages
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from sys.averages;
