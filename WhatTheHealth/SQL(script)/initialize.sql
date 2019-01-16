DROP TABLE MEAL CASCADE CONSTRAINTS;
DROP TABLE EX_SC CASCADE CONSTRAINTS;
DROP TABLE FAVORITE CASCADE CONSTRAINTS;
DROP TABLE REFUND CASCADE CONSTRAINTS;
DROP TABLE EX_INFO CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE MEETING CASCADE CONSTRAINTS;
DROP TABLE JOIN CASCADE CONSTRAINTS;
DROP TABLE LIVE CASCADE CONSTRAINTS;
DROP TABLE POINT CASCADE CONSTRAINTS;
DROP TABLE USERS CASCADE CONSTRAINTS;
DROP TABLE POST CASCADE CONSTRAINTS;
DROP TABLE HASHTAG CASCADE CONSTRAINTS;
DROP TABLE CLAIM CASCADE CONSTRAINTS;
DROP TABLE DIET_SC CASCADE CONSTRAINTS;
DROP TABLE SOCKET CASCADE CONSTRAINTS;

DROP SEQUENCE seq_point_point_no;
DROP SEQUENCE seq_post_post_no;
DROP SEQUENCE seq_hashtag_hashtag_no;
DROP SEQUENCE seq_claim_claim_no;
DROP SEQUENCE seq_diet_sc_diet_sc_no;
DROP SEQUENCE seq_meal_meal_no;
DROP SEQUENCE seq_ex_sc_ex_sc_no;
DROP SEQUENCE seq_favorite_favorite_no;
DROP SEQUENCE seq_refund_refund_no;
DROP SEQUENCE seq_ex_info_ex_info_no;
DROP SEQUENCE seq_reply_reply_no;
DROP SEQUENCE seq_meeting_meet_no;
DROP SEQUENCE seq_join_join_no;
DROP SEQUENCE seq_socket_socket_no;
DROP SEQUENCE seq_socekt_socket_no;
DROP SEQUENCE seq_meeting_meeting_no;
DROP SEQUENCE seq_users_user_id;
DROP SEQUENCE seq_dietcom_dietcom_no;
DROP SEQUENCE seq_excom_excom_no;

CREATE SEQUENCE seq_point_point_no	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_hashtag_hashtag_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_claim_claim_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_diet_sc_diet_sc_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meal_meal_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_ex_sc_ex_sc_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_favorite_favorite_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_refund_refund_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_ex_info_ex_info_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_reply_reply_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meeting_meet_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_join_join_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_socket_socket_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_dietcom_dietcom_no		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_excom_excom_no		INCREMENT BY 1 START WITH 10000;


CREATE TABLE users ( 
	user_id 		VARCHAR2(20)	NOT NULL,
	password 	VARCHAR2(30)	NOT NULL,
	nickname 	VARCHAR2(30)	UNIQUE	NOT NULL,
	email 		VARCHAR2(50),
	user_image	VARCHAR2(100),
	gender		VARCHAR2(5)		NOT NULL,
	user_phone 	VARCHAR2(14),
	reg_date 		DATE,
	dlt_date 		DATE,
	holder		VARCHAR2(10),
	bank_name	VARCHAR2(20),
	account_num	VARCHAR2(30),
	claim_count	NUMBER(10)		DEFAULT '0',
	role 		VARCHAR2(10) 		DEFAULT 'user',
	user_status_code	VARCHAR2(3)		DEFAULT '0',
	having_point	NUMBER(10)		DEFAULT '0',
	sns_type_code	VARCHAR2(3)		DEFAULT '0',
	id_token		VARCHAR2(300),
	access_token	VARCHAR2(300),
	refresh_token	VARCHAR2(300),
	PRIMARY KEY(user_id)
);

CREATE TABLE point ( 
	point_no 			NUMBER 			NOT NULL,
	point_date 		DATE		NOT NULL,
	using_point 		NUMBER(10)		NOT NULL,
	point_status_code		VARCHAR2(3)		NOT NULL,
	sender_id 		VARCHAR2(20)	NOT NULL	REFERENCES users(user_id),
	receiver_id		VARCHAR2(20)	REFERENCES users(user_id),
	PRIMARY KEY(point_no)
);

CREATE TABLE post (
	post_no		VARCHAR2(10)	NOT NULL,
	title	VARCHAR2(100)	NOT NULL,
	contents	CLOB	NOT NULL,
	user_id	VARCHAR2(20)	NOT NULL	REFERENCES USERS(user_id),
	post_date	DATE,
	photo	VARCHAR2(100),
	video	VARCHAR2(100),
	click_count	NUMBER(10),
	like_count	NUMBER(10),
	blind_status	VARCHAR2(3),
	category	VARCHAR2(3),
	delete_status	VARCHAR2(3),
	locationtag_name	VARCHAR2(100),
	x_coordinate	NUMBER(20),
	y_coordinate	NUMBER(20),
	diet_sc_no	NUMBER(10),
	ex_sc_no	NUMBER(10),
	address 	VARCHAR2(100),
	ex_info_no 	NUMBER,
	ex_calorie	NUMBER(5),
	ex_place	VARCHAR2(3),
	ex_part		VARCHAR2(3),
	ex_videotime	VARCHAR2(20),	
	PRIMARY KEY(post_no)
);

CREATE TABLE hashtag ( 
	hashtag_no NUMBER NOT NULL,
	hashtag 	VARCHAR2(50) NOT NULL,
	post_no		VARCHAR2(10)	NOT NULL 	REFERENCES POST(post_no),
	PRIMARY KEY(hashtag_no)
);

CREATE TABLE claim ( 
	claim_no NUMBER NOT NULL,
	user_id VARCHAR2(20) NOT NULL REFERENCES users(user_id),
	claim_date DATE NOT NULL,
	claimed_id VARCHAR2(20) REFERENCES users(user_id),
	claim_type VARCHAR2(3),
	claim_status VARCHAR2(3) NOT NULL,
	claim_reason VARCHAR2(3)NOT NULL,
	claim_contents VARCHAR2(400),
	claim_target_no VARCHAR2(20),
	PRIMARY KEY(claim_no)
);


CREATE TABLE diet_sc( 
	diet_sc_no NUMBER NOT NULL,
	user_id VARCHAR2(20) NOT NULL REFERENCES users(user_id),
	diet_sc_date DATE NOT NULL,
	meal_time VARCHAR2(3) NOT NULL,
	bmi_value NUMBER(5),
	weight NUMBER(5),
	delete_status VARCHAR2(3),
	PRIMARY KEY(diet_sc_no)
);

CREATE TABLE MEAL( 
	meal_no NUMBER NOT NULL,
	food_name VARCHAR2(20) NOT NULL ,
	food_calorie NUMBER(5) NOT NULL,
	amount_food NUMBER(5) NOT NULL,
	diet_sc_no NUMBER REFERENCES diet_sc(diet_sc_no),
	PRIMARY KEY(meal_no)
);

CREATE TABLE EX_SC( 
	ex_sc_no NUMBER NOT NULL,
	user_id VARCHAR2(20) NOT NULL REFERENCES users(user_id),
	ex_sc_title VARCHAR2(100) NOT NULL,
	ex_sc_contents VARCHAR2(500) NOT NULL,
	ex_sc_calorie NUMBER(5),
	ex_sc_date DATE,
	ex_sc_time DATE,
	post_no VARCHAR2(10) REFERENCES POST(post_no),
	delete_status VARCHAR2(3),
	PRIMARY KEY(ex_sc_no)
);

CREATE TABLE FAVORITE(
	post_no	VARCHAR2(10)	NOT NULL	REFERENCES POST(post_no),
	favorite_no	NUMBER	NOT NULL,
	user_id	VARCHAR2(20)	NOT NULL	REFERENCES USERS(user_id),
	favorite_type	VARCHAR2(3)	NOT NULL,
	PRIMARY KEY(favorite_no)	
);

CREATE TABLE REFUND(
	refund_no	NUMBER	NOT NULL,
	refund_date	DATE,
	refund_money	NUMBER(10)	NOT NULL,
	bank_name	VARCHAR2(20)	NOT NULL,
	holder	VARCHAR2(10)	NOT NULL,
	account_num	VARCHAR2(30)	NOT NULL,
	refund_req_date	DATE	NOT NULL,
	user_id	VARCHAR2(20)	NOT NULL	REFERENCES USERS(user_id),
	refund_status	NUMBER(10)	NOT NULL,	
	PRIMARY KEY(refund_no)
);



CREATE TABLE reply (
	reply_no	NUMBER	NOT NULL,
	parent_reply_no	NUMBER	REFERENCES reply(reply_no),
	rereply_no	NUMBER(3)	DEFAULT '0',
	reply_date	DATE	NOT NULL,
	post_no	VARCHAR2(10)	NOT NULL	REFERENCES post(post_no),
	text	VARCHAR2(500)	NOT NULL,
	writer_id	VARCHAR2(20)	NOT NULL	REFERENCES users(user_id),
	blind_status	VARCHAR2(3),
	delete_status	VARCHAR2(3),
	PRIMARY KEY(reply_no)
);

CREATE TABLE meeting (
	meet_no	NUMBER	NOT NULL,
	post_no	VARCHAR2(10)	NOT NULL,
	depo_amount	NUMBER(10),
	depo_bank	VARCHAR2(20),
	depo_account	VARCHAR2(30),
	depo_deadline	DATE,
	depo_acc_holder	VARCHAR2(10),
	entryfee	NUMBER(10),
	min_party	NUMBER(3),
	max_party	NUMBER(3),
	chief_id	VARCHAR2(20)	NOT NULL	REFERENCES users(user_id),
	depo_condition	VARCHAR2(3)	NOT NULL,
	meet_time	DATE	NOT NULL,
	deadline_time	DATE,
	PRIMARY KEY(meet_no)
);

CREATE TABLE join (
	join_no	NUMBER	NOT NULL,
	join_date	DATE	NOT NULL,
	join_status	VARCHAR2(3)	NOT NULL,
	depo_status	VARCHAR2(3),
	post_no	VARCHAR2(10)	NOT NULL	REFERENCES post(post_no),
	party_id	VARCHAR2(20)	NOT NULL	REFERENCES users(user_id),
	delete_status	VARCHAR2(3),
	PRIMARY KEY(join_no)
);


CREATE TABLE socket (
	socket_no	NUMBER	NOT NULL,
	bj_id	VARCHAR2(20)	NOT NULL	REFERENCES users(user_id),
	live_date	DATE	NOT NULL,
	live_title	VARCHAR2(100)	NOT NULL,
	total_viewer	NUMBER(10),
	live_type	VARCHAR2(3)	NOT NULL,
	fir_player_id	VARCHAR2(20)	REFERENCES users(user_id),
	sec_player_id	VARCHAR2(20)	REFERENCES users(user_id),
	live_status		VARCHAR2(3),
	PRIMARY KEY(socket_no)
);	

commit;