select * from tb_board;

select b.*, t.bt_name 
	from tb_board b
	left outer join tb_board_type t 
    on b.bt_no = t.bt_no
    order by b_no desc
    ;
    
    
insert into tb_board_type (bt_no, bt_name) values (1, '자유');
insert into tb_board_type (bt_no, bt_name) values (2, '공지');
insert into tb_board_type (bt_no, bt_name) values (3, '유머');
insert into tb_board_type (bt_no, bt_name) values (4, '뉴스');
    
    commit;
    
insert into tb_member
    (m_id, m_nickname, password)
    values ('member', '진정', '1234');
    
    
    
    
select b.b_no, b_title, b_content, b_writer, b_write_date, b_count, f.*, c_writer, c_write_Date, c_comment
	from tb_board b
	left outer join tb_file f on b.b_no = f.b_no
	left outer join tb_comment c on b.b_no = c.b_no
	where b.b_no = 1;
    