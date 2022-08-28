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

#search_box_button{
	margin-top: 30px;
}
#search_box_button_container{
	text-align: right;
}
#search_box{
	border: 1px solid rgb(224, 224, 224);
    width: 180px;
    height: 25px;
    font-size: 12px;
    font-family: NotoSansR;
    color: rgb(94, 94, 94);
}
#search_select{
	width: 60px;
	}

/* grid box~! */

#select_write_box{
	display: flex;
	gap: 850px;
}


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
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section id="board_section">
	<div id="board_main_wrap">
		<div id="board_main_header">
			<div id="board_main_menu_title">게시판</div>
		</div>
		
		<div id="board_main_container">
			<div class="board_hr_main_box">
				<div class="board_main_box_content">
					<div id="select_write_box">
						<select name="board_type" id="board_type">
				        	<option value="0">전체</option>
				        	<option value="1">자유</option>
				        	<option value="2">공지</option>
				        	<option value="3">유머</option>
				        	<option value="4">뉴스</option>
				        </select>
						<div id="write_board">
							<button type="button" class="btn_format_mini" id="write_btn">글쓰기</button>
						</div>
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
					<div id="pageing_all">
		                <div class="pageing">
		                	<p id="p_c">
		                		<c:if test="${not empty boardList}">
									<c:if test="${startPage > 1 }">
										<a class="page page_prev">이전</a>
									</c:if>
									<c:forEach begin="${startPage }" end="${endPage }" var="p">
										<a class="page page_num" >${p}</a>
									</c:forEach>
									<c:if test="${endPage ne totalpageCnt}">
										<a class="page page_post" >다음</a>
									</c:if>
								</c:if>
							</p>
		                </div>
		            </div>
				</div>
				<div class="board_main_box_content" id="search_box_button_container">
					<div id="search_box_button">
						<select id="search_select">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select>
						<input id="search_box" type="text" placeholder="검색어를 입력해주세요.">
						<button type="button" class="btn_format_mini_gray">검색</button>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
</section>
<script>
//글쓰기 버튼 누르면 이동
	$("#write_btn").on("click", function(){
		location.href="<%= request.getContextPath()%>/insert";
	})
	<%-- 
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
		
	}); --%>
// 게시글 상세보기 페이지 이동
$(".tb_read").on("click", function(){
	var b_no = $(this).siblings().first().text() ;
	location.href = "<%= request.getContextPath()%>/read?b_no="+b_no;
})

// 핉터 정렬 
	$("#board_type").on('change', function() {
		var option = $('#board_type').val();
		location.href="<%= request.getContextPath() %>/?page=1&option="+option;
	});
	var urlOption = '${option}';
	if(urlOption == '0') {
		$('#board_type').val('0').prop('selected', true);
	} else if(urlOption == '1') {
		$('#board_type').val('1').prop('selected', true);
	} else if(urlOption == '2'){
		$('#board_type').val('2').prop('selected', true);
	}else if(urlOption == '3'){
		$('#board_type').val('3').prop('selected', true);
	}else if(urlOption == '4'){
		$('#board_type').val('4').prop('selected', true);
	}

// 페이지 번호
var js_page_no = (new URL(location.href).searchParams).get('page');
// 페이지처리
$(".page").on('click', function() {
		var option = $("#board_type").val();
		if($(this).hasClass('page_prev')) {
			location.href="<%= request.getContextPath() %>/?page=${startPage-1}&option="+option;
		} else if($(this).hasClass('page_num')) {
			location.href="<%= request.getContextPath() %>/?page="+$(this).text()+"&option="+option;
		} else if($(this).hasClass('page_post')) {
			location.href="<%= request.getContextPath() %>/?page=${endPage+1}&option="+option;
		}
	});

for(var i = 0; i < $(".page_num").length; i++) {
	if($(".page_num").eq(i).text() == js_page_no) {
		$(".page_num").eq(i).css({
			"background-color" : "#4B4DB2",
			color : "white"
		});
		break;
	}
}

</script>
</body>
</html>