select * from tb_board;

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
	where b.b_no = 1;    
    
insert into tb_board_type (bt_no, bt_name) values (1, '자유');
insert into tb_board_type (bt_no, bt_name) values (2, '공지');
insert into tb_board_type (bt_no, bt_name) values (3, '유머');
insert into tb_board_type (bt_no, bt_name) values (4, '뉴스');
    
insert into tb_member (m_id, m_nickname, password) values ('member', '진정', '1234');

insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목1', '내용1', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목2', '내용2', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목3', '내용3', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목4', '내용4', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목5', '내용5', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목6', '내용6', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목7', '내용7', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목8', '내용8', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목9', '내용9', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목10', '내용10', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목11', '내용11', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목12', '내용12', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목13', '내용13', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목14', '내용14', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목15', '내용15', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목16', '내용16', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목17', '내용17', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목18', '내용18', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목19', '내용19', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목20', '내용20', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목21', '내용21', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목22', '내용22', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목23', '내용23', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목24', '내용24', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목25', '내용25', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목26', '내용26', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목27', '내용27', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목28', '내용28', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목29', '내용29', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목30', '내용30', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목31', '내용31', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목32', '내용32', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목33', '내용33', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목34', '내용34', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목35', '내용35', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목36', '내용36', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목37', '내용37', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목38', '내용38', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목39', '내용39', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목40', '내용40', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목41', '내용41', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목42', '내용42', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목43', '내용43', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목44', '내용44', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목45', '내용45', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목46', '내용46', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목47', '내용47', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목48', '내용48', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목49', '내용49', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목50', '내용50', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목51', '내용51', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목52', '내용52', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목53', '내용53', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목54', '내용54', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목55', '내용55', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목56', '내용56', '진정', sysdate, 0, 'member', 4);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목57', '내용57', '진정', sysdate, 0, 'member', 1);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목58', '내용58', '진정', sysdate, 0, 'member', 2);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목59', '내용59', '진정', sysdate, 0, 'member', 3);
insert into tb_board values ((select nvl(max(b_no), 0)+1 from tb_board), '제목60', '내용60', '진정', sysdate, 0, 'member', 4);

commit;
    
    
    

    