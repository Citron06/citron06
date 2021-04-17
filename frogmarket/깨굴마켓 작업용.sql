---여기부터 임의 sql---
select * from member;
insert into member
values(
    'cms','1a2s3d','U','01012341234','blucency@gmail.com',default,1,'치미시'
);

select * from tabs;
select * from member;
select * from p_board;
select * from r_board;
------------------------member에 입력 3개
insert into member
values(
    'oneman','132435','U','01099998888','kjk@naver.com',default,1,'김종국'
);
insert into member
values(
    'blackcow','1a2s3d','U','01011442266','mow@gmail.com',default,0,'흑우'
);
insert into member
values(
    'logcat','abcdef','U','01013134646','cutecat@naver.com',default,3,'로그캣'
);
------------------------p_board에 입력 3개
select * from p_board;

insert into p_board
values(
   seq_p_board_no.nextval ,'oneman','동전지갑','new', 5000,'그냥 동전 넣을 수 있는 주머니입니다.',default,'대전'
);
insert into p_board
values(
   seq_p_board_no.nextval ,'blackcow','마우스','new', 7000,'작동은 됩니다. 좀 더러워요..',default,'서울'
);
insert into p_board
values(
   seq_p_board_no.nextval ,'logcat','가위','new', 3000,'가위가 몇개 남아서 팝니다.',default,'인천'
);
------------------------r_board에 입력 3개
select * from r_board;

insert into r_board
values(
    seq_r_board_no.nextval, 'oneman', 'logcat', default, '판 가위가 날이 상해있습니다.'
);
insert into r_board
values(
    seq_r_board_no.nextval, 'blackcow', 'logcat', default, '못쓰는 가위를 팔았어요'
);
insert into r_board
values(
    seq_r_board_no.nextval, 'oneman', 'blackcow', default, '마우스 선이 끊겨있는걸 팔고있습니다'
);


--sql구문 작성중
insert into p_board values( seq_p_board_no.nextval ,'oneman','동전지갑','new', 5000,'그냥 동전 넣을 수 있는 주머니입니다.',default,'대전')
;
select * from p_board;

