select b.*, t.bt_name, fb.f_count
	from tb_board b
	left outer join tb_board_type t on b.bt_no = t.bt_no
    left outer join (select count (*) f_count, f.b_no from tb_file f group by f.b_no) fb on fb.b_no = b.b_no
    order by b.b_no desc
    ;
    
    select count (*) f_count, b_no from tb_file group by b_no;
    
    desc tb_comment;
    select * from tb_comment;
    
    select * from tb_comment
	where b_no = 62
	order by c_ref asc ,c_seq, c_write_date desc ;
    
select * from tb_board;
desc tb_File;
select b.*, t.bt_name 
	from tb_board b
	left outer join tb_board_type t 
    on b.bt_no = t.bt_no
    order by b_no desc
    ;
select b.b_no, b_title, b_content, b_writer, b_write_date, b_count, f.*, c_writer, c_write_Date, c_comment
	from tb_board b
	left outer join tb_file f on b.b_no = f.b_no
	left outer join tb_comment c on b.b_no = c.b_no
	where b.b_no = 63;    
