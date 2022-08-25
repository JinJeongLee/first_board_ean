<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board/board.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<meta charset="UTF-8">
<title>Board</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">
.board_main_box_first_container {
	flex-grow: 1;
}

/* #insert_board_box_top{
	width: 240px;
	height: 36px;
	border: 2px solid rgb(224, 224, 224);
	background-color: rgb(244, 244, 244);
	text-align: center;
	line-height: 36px;
	
}
#insert_board_box_bottom{
	width: 240px;
	height: 64px;
	border-left: 2px solid rgb(224, 224, 224);
	border-right: 2px solid rgb(224, 224, 224);
	border-bottom: 2px solid rgb(224, 224, 224);
	border-top: 0px;
	text-align: center;
	display: flex;
	align-items: center;
} */



.first_box_text{
	margin-bottom: 13px;
}

#write_board{
	text-align: right;
}


/* grid box~! */



/* 같은 폰트 적용 */
.font_title{
	font-size: 13px;
	font-family: NotoSansB;
	color: rgb(94, 94, 94);
}
.font_content{
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

#clock{
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="board_section">
	<div id="board_main_wrap">
		<div id="board_main_header">
			<div id="board_main_menu_title">게시판</div>
		</div>
		
		<div id="board_main_container">
			<div class="board_hr_main_box">
				<div class="board_main_box_content">
					<div id="write_board">
						<button type="button" class="btn_format_mini" id="write_btn">글쓰기</button>
					</div>
				</div>
				<div class="board_main_box_content">
					<table class="board_hr_main_box_content_table" id="att_date_search_table">
						<tr class="table_title">
							<td style="width: 6%">No</td>
							<td style="width: 10%">글 종류</td>
							<td style="width: 49%">글 제목</td>
							<td style="width: 6%">첨부파일</td>
							<td style="width: 9%">작성자</td>
							<td style="width: 14%">작성일</td>
							<td style="width: 6%">조회수</td>
						</tr>
						<c:forEach items="${boardList}" var="list">
							<tr class="list">
								<td class="tb_read">${list.b_no}</td>
								<td >${list.bt_name}</td>
								<td class="tb_read">${list.b_title}</td>
								<td >몰라요</td>
								<td >${list.b_writer}</td>
								<td >${list.b_write_date}</td>
								<td >${list.b_count}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</section>
<script>
//글쓰기 버튼 누르면 이동
	$("#write_btn").on("click", function(){
		location.href="<%= request.getContextPath()%>/board/insert";
	})
	
	$(".tb_read").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/hr/employee/select",
			type: "post",
			data: {b_no: $(this).nextAll(".last_tb").children(".empNo").val()},
			dataType: "json",
			success: function(result){
				
			},
			error: function(result){
				console.log("직원 상세 정보 ajax 오류");
			}
		});
		
	});
	
////////날짜 유효성 ///////////
//start input -> end min
$("#att_date_start").on("input", function() {
	$("#att_date_end").attr("min", $("#att_date_start").val());
});

// end input -> start max
$("#att_date_end").on("input", function() {
	$("#att_date_start").attr("max", $("#att_date_end").val());
});
</script>
</body>
</html>