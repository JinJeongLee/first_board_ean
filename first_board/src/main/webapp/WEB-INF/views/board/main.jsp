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
	display: flex;
	gap: 5px;
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
	gap: 750px;
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
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
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
				<form action="" method="get">
				<div class="board_main_box_content">
					<div id="select_write_box">
						<select name="option" id="board_type">
				        	<option value="0">전체</option>
				        	<option value="1">자유</option>
				        	<option value="2">공지</option>
				        	<option value="3">유머</option>
				        	<option value="4">뉴스</option>
				        </select>
						<div id="write_board">
							<button type="button" class="btn_format_mini" id="download_btn">Download</button>
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
						<c:if test="${not empty boardList}">
							<c:forEach items="${boardList}" var="list">
								<tr class="list">
									<td >${list.b_no}</td>
									<td >${list.bt_name}</td>
									<td class="tb_read">${list.b_title} [${list.c_count}]</td>
									<td >${list.f_count}개</td>
									<td >${list.b_writer}</td>
									<td >${list.b_write_date}</td>
									<td >${list.b_count}</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty boardList}">
							<tr><td colspan="7" >검색 결과가 존재하지 않습니다.</td></tr>
						</c:if>
					</table>
					<div id="pageing_all">
		                <div class="pageing">
		                	<p id="p_c">
		                		<c:if test="${not empty boardList}">
		                			<a class="page page_first">처음</a>
									<c:if test="${startPage > 1 }">
										<a class="page page_prev">이전</a>
									</c:if>
									<c:forEach begin="${startPage }" end="${endPage }" var="p">
										<a class="page page_num" >${p}</a>
									</c:forEach>
									<c:if test="${endPage ne totalpageCnt}">
										<a class="page page_post" >다음</a>
									</c:if>
									<a class="page page_last">마지막</a>
								</c:if>
							</p>
		                </div>
		            </div>
				</div>
				<div class="board_main_box_content" id="search_box_button_container">
					<div id="search_box_button">
						
							<select id="search_select" name="searchOpt" value="${searchOpt}">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select>
							<input id="search_box" name="searchVal" type="text" placeholder="검색어를 입력해주세요." value="${searchVal}">
							<button type="submit" class="btn_format_mini_gray">검색</button>
					</div>
				</div>
				<input type="hidden" name="page" value="${page }">
				</form>
				<form action="downloadExcelFile" id="exelForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="option" value="${option}">
					<input type="hidden" name="searchVal" value="${searchVal}">
					<input type="hidden" name="searchOpt" value="${searchOpt}">
				</form>
			</div>
			
		</div>
	</div>
</section>
<script>
//글쓰기 버튼 누르면 이동
	$("#write_btn").on("click", function(){
		location.href="<%= request.getContextPath()%>/insert";
	})
	
// 게시글 상세보기 페이지 이동
$(".tb_read").on("click", function(){
	var b_no = $(this).siblings().first().text() ;
	location.href = "<%= request.getContextPath()%>/read?b_no="+b_no;
})

// 엑셀 다운로드
	$("#download_btn").on('click', function() {
		$("#exelForm").submit();
	});

// 페이지 번호
var js_page_no = (new URL(location.href).searchParams).get('page');

// 핉터 정렬 
	$("#board_type").on('change', function() {
		var option = $('#board_type').val();
		var searchVal = '${searchVal}';
		var searchOpt = '${searchOpt}';
		location.href="<%= request.getContextPath() %>/?page=1&option="+option+"&searchOpt="+searchOpt+"&searchVal="+searchVal;
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
// 페이지처리
$(".page").on('click', function() {
		var option = $("#board_type").val();
		var searchVal = '${searchVal}';
		var searchOpt = '${searchOpt}';
		
		if(searchVal != ""){
			if($(this).hasClass('page_prev')) {
				location.href="<%= request.getContextPath() %>/?page=${startPage-1}&option="+option+"&searchOpt="+searchOpt+"&searchVal="+searchVal;
			} else if($(this).hasClass('page_num')) {
				location.href="<%= request.getContextPath() %>/?page="+$(this).text()+"&option="+option+"&searchOpt="+searchOpt+"&searchVal="+searchVal;
			} else if($(this).hasClass('page_post')) {
				location.href="<%= request.getContextPath() %>/?page=${endPage+1}&option="+option+"&searchOpt="+searchOpt+"&searchVal="+searchVal;
			} else if($(this).hasClass('page_first')) {
				location.href="<%= request.getContextPath() %>/?page=1&option="+option+"&searchOpt="+searchOpt+"&searchVal="+searchVal;
			} else if($(this).hasClass('page_last')) {
				location.href="<%= request.getContextPath() %>/?page=${endPage}&option="+option+"&searchOpt="+searchOpt+"&searchVal="+searchVal;
			}
		} else{
			if($(this).hasClass('page_prev')) {
				location.href="<%= request.getContextPath() %>/?page=${startPage-1}&option="+option;
			} else if($(this).hasClass('page_num')) {
				location.href="<%= request.getContextPath() %>/?page="+$(this).text()+"&option="+option;
			} else if($(this).hasClass('page_post')) {
				location.href="<%= request.getContextPath() %>/?page=${endPage+1}&option="+option;
			} else if($(this).hasClass('page_first')) {
				location.href="<%= request.getContextPath() %>/?page=1&option="+option;
			} else if($(this).hasClass('page_last')) {
				location.href="<%= request.getContextPath() %>/?page=${totalpageCnt}&option="+option;
			}
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