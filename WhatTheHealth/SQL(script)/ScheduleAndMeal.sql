//ExSchedule listSchedule.jsp ���
INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user1' , '�ȱ������', '1��Ʈ 10ȸ, ��3��Ʈ', '255', TO_DATE('2019-02-12', 'YY-MM-DD'), 0);

INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user2' , '���帮��Ʈ', '1��Ʈ 3ȸ, ��3��Ʈ', '312', TO_DATE('2019-02-13', 'YY-MM-DD'), 0);

INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user3' , '����Ʈ', '1��Ʈ 2ȸ, ��5��Ʈ', '115', TO_DATE('2019-02-14', 'YY-MM-DD'), 0);

INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user4' , '�ΰ���', '1��Ʈ 10ȸ, ��3��Ʈ', '89', TO_DATE('2019-02-15', 'YY-MM-DD'), 0);

INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user5' , '10Km ������', '1��Ʈ 10ȸ, ��3��Ʈ', '422', TO_DATE('2019-02-16', 'YY-MM-DD'), 0);

INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user6' , '�ȱ������', '1��Ʈ 10ȸ, ��3��Ʈ', '132', TO_DATE('2019-02-17', 'YY-MM-DD'), 0);

INSERT INTO 
   ex_sc( ex_sc_no , user_id , ex_sc_title ,ex_sc_contents, ex_sc_calorie, ex_sc_date, delete_status)
VALUES ( seq_ex_sc_ex_sc_no.NEXTVAL , 'user7' , '����� �', '1��Ʈ 10ȸ, ��3��Ʈ', '111', TO_DATE('2019-02-18', 'YY-MM-DD'), 0);

//DietSchduel ���
INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user1' , '2019-02-19', '1', 222,'0');

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user2' , '2019-02-20', '2', 15,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user3' , '2019-02-21', '0', 421,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user4' , '2019-02-22', '1', 812,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user5' , '2019-02-23', '0', 711,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user6' , '2019-02-24', '1', 165,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user7' , '2019-02-25', '2', 1165,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user8' , '2019-02-26', '0', 521,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user9' , '2019-02-27', '0', 315,'0' );

INSERT INTO 
    diet_sc( diet_sc_no , user_id , diet_sc_date , meal_time , diet_sc_calorie, delete_status) 
VALUES (seq_diet_sc_diet_sc_no.NEXTVAL, 'user10' , '2019-02-28', '2', 2267,'0');

//Meal
INSERT INTO 
	meal(meal_no, diet_sc_no, food_name, food_calorie, amount_food) 
VALUES (seq_meal_meal_no.NEXTVAL , 10000 , '����', 2246, '��')

INSERT INTO 
	meal(meal_no, diet_sc_no, food_name, food_calorie, amount_food) 
VALUES (seq_meal_meal_no.NEXTVAL , 10000 , '����', 2246, '��')

INSERT INTO 
	meal(meal_no, diet_sc_no, food_name, food_calorie, amount_food) 
VALUES (seq_meal_meal_no.NEXTVAL , 10000 , '����', 2246, '��')

INSERT INTO 
	meal(meal_no, diet_sc_no, food_name, food_calorie, amount_food) 
VALUES (seq_meal_meal_no.NEXTVAL , 10000 , '����', 2246, '��')

 