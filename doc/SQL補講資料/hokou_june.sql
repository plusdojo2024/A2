CREATE TABLE USERS (
id 	INT AUTO_INCREMENT PRIMARY KEY,
user_name 	VARCHAR(20) NOT NULL,
created_at 	TIMESTAMP,
updated_at 	TIMESTAMP
);

CREATE TABLE SALES (
id 	INT AUTO_INCREMENT PRIMARY KEY,
user_id VARCHAR(20) NOT NULL,
item_id VARCHAR(20) NOT NULL,
created_at 	TIMESTAMP,
updated_at 	TIMESTAMP
);

CREATE TABLE ITEMS (
id 	INT AUTO_INCREMENT PRIMARY KEY,
item_name 	VARCHAR(20) NOT NULL,
price INT,
created_at 	TIMESTAMP,
updated_at 	TIMESTAMP
);

INSERT INTO USERS(user_name,created_at,updated_at) 
	VALUES ('tomihara',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO USERS(user_name,created_at,updated_at) 
	VALUES ('higuchi',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO USERS(user_name,created_at,updated_at) 
	VALUES ('ueda',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO USERS(user_name,created_at,updated_at) 
	VALUES ('higashi',CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);


INSERT INTO ITEMS(item_name,price,created_at,updated_at) 
	VALUES ('おにぎり',120,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO ITEMS(item_name,price,created_at,updated_at) 
	VALUES ('本',600,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO ITEMS(item_name,price,created_at,updated_at) 
	VALUES ('おかし',110,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO ITEMS(item_name,price,created_at,updated_at)
	VALUES ('ジュース',160,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO ITEMS(item_name,price,created_at,updated_at)
	VALUES ('めがね',3000,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);



INSERT INTO SALES(user_id,item_id,created_at,updated_at)
	VALUES (1,1,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO SALES(user_id,item_id,created_at,updated_at)
	VALUES (3,2,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO SALES(user_id,item_id,created_at,updated_at)
	VALUES (2,4,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO SALES(user_id,item_id,created_at,updated_at)
	VALUES (4,3,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

INSERT INTO SALES(user_id,item_id,created_at,updated_at)
	VALUES (1,2,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);


-- 内部結合
SELECT s.id,s.user_id,u.user_name,s.item_id
	FROM SALES as s JOIN USERS as u
	ON s.user_id = u.id;

--複数結合
SELECT s.id,s.user_id,u.user_name,s.item_id,i.item_name
	FROM SALES as s
	JOIN USERS as u ON s.user_id = u.id
	JOIN ITEMS as i ON s.item_id = i.id;

--データ追加
INSERT INTO SALES(user_id,item_id,created_at,updated_at)
	VALUES (5,6,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);

-- 内部結合(再度)
SELECT s.id,s.user_id,u.user_name,s.item_id
	FROM SALES as s JOIN USERS as u
	ON s.user_id = u.id;

--左外部結合
SELECT s.id,s.user_id,u.user_name,s.item_id
	FROM SALES as s LEFT JOIN users as u
	ON s.user_id = u.id;





-- 参照制約
CREATE TABLE SALES_LIMIT (
id 	INT AUTO_INCREMENT PRIMARY KEY,
user_id VARCHAR(20) NOT NULL,
item_id VARCHAR(20) NOT NULL,
created_at 	TIMESTAMP,
updated_at 	TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES USERS(id)
);

-- エラー発生(参照整合制約違反)
INSERT INTO SALES_LIMIT(user_id,item_id,created_at,updated_at)
	VALUES (5,6,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);



--TIMESTAMP関連

SELECT LEFT(created_at,10) FROM SALES;
SELECT SUBSTRING(created_at,12,8) FROM SALES;
--  SELECT created_at  FROM users ;

SELECT * FROM ITEMS  WHERE LEFT(created_at,10) <= CURRENT_DATE;
SELECT * FROM ITEMS  WHERE LEFT(created_at,10) > (CURRENT_DATE-1);


