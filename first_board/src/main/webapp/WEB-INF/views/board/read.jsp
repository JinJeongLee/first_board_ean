<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/board/board.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>

<meta charset="UTF-8">
<title>Board</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">

.re_reply_wrap{
	display: grid;
	grid-template-columns: 40px 460px 155px 30px 30px;
	column-gap: 5px;
	height: 25px;
	line-height: 25px;
}
.board_main_box_first_container {
	flex-grow: 1;
}
#cke_1_bottom{
	display: none;
}
#c_reply_content{
	width: 590px;
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

#btn_cancel_submit{
	margin-top: 30px;
	text-align: center;
	width: 1070px;
}

#board_title, #textEditer{
	margin-top: 10px;
}
#board_content, #board_row3, #board_row4{
	margin-top: 20px;
	
}
#board_title{
	border: 1px solid rgb(204, 204, 204);
	width: 1070px;
	height: 25px;
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}
#board_content1{
	width: 1070px;
	height: 400px;
	font-size: 13px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
	border: 1px solid rgb(204, 204, 204);
	resize: none;
}
#b_writer, #b_password{
	border: 1px solid rgb(224, 224, 224);
	width: 138px; height:25px;
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);	
}
#b_writer{
	margin-left: 3px;
}
.margin1{
	margin-left: 50px;
}
a{
	color: rgb(94, 94, 94);	 
}
a:hover{
	text-decoration: underline;
}

/* grid box~! */
#update_delete_btn{
	display: flex;
	gap: 5px;
	flex-direction: row-reverse;
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
			<div id="board_main_menu_title">게시글 </div>
		</div>
		
		<div id="board_main_container">
			<div id="project_board_read_wrap">
				<div id="project_board_read_grid">
				<div class="project_board_read_title">No. ${board.b_no }</div>
					<div id="update_delete_btn">
					<form action="delete" method="post">
						<input type="hidden" name="b_no" value="${board.b_no}">
						<button class="btn_format_mini_gray btn_d_u">삭제</button>
					</form>
					<form action="update" method="get">
						<input type="hidden" name="b_no" value="${board.b_no}">
						<input type="hidden" name="b_title" value="${board.b_title}">
						<input type="hidden" name="b_content" value="${board.b_content}">
						<button class="btn_format_mini_gray btn_d_u">수정</button>
					</form>
					</div>
				<div class="project_board_read_title">게시물 제목</div>
				<div class="project_board_read_title" id="project_board_read_title">${board.b_title }</div>
				<div class="project_board_read_title">게시물 내용</div>
				<div class="project_board_read_content">${board.b_content }</div>
				<div class="project_board_read_title">작성자</div>
				<div class="project_board_read_content">${board.b_writer }</div>
				<div class="project_board_read_title">작성일</div>
				<div class="project_board_read_content">${board.b_write_date }</div>
				<c:if test="${not empty fileList }">
					<c:forEach items="${fileList }" var="file" varStatus="i">
						<div class="project_board_read_title">첨부파일 ${i.count}</div>
						<div class="project_board_read_content">
						<a href="<%= request.getContextPath() %>${file.f_rename_filename}" download>${file.f_original_filename }</a> 
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty fileList }">
						<div class="project_board_read_title">첨부파일 없음</div>
						<div class="project_board_read_content">
						</div>
				</c:if>
				
				<div class="project_board_read_hr"></div>
				<div class="project_board_read_comment_title">댓글</div>
				<div class="project_board_read_comment_content_flex">
					<c:forEach items="${commentList }" var="comment">
						<div class="project_board_read_comment_content_wrap">
							<div class="project_board_read_comment_content_profile_wrap ">
								<c:if test="${comment.c_level ne 0}">
									<div class="re_reply_wrap">
										<div></div>
										<div class="project_board_read_reply_comment_content"><c:forEach begin="1" end="${comment.c_level }">&#8618;</c:forEach>${comment.c_writer} : ${comment.c_comment } &nbsp;&nbsp;&nbsp;</div>
										<div class="project_board_read_comment_content_date" style="line-height: 25px">${fn:substring(comment.c_write_date, 0, 19) }</div>
										<c:if test="${loginSSInfo.m_id eq comment.m_id }">
											<button type="button" c_no="${comment.c_no }" class="project_board_read_comment_content_delete_btn">삭제</button>
										</c:if>
										<c:if test="${loginSSInfo.m_id eq comment.m_id }">
											<div></div>
											<%-- <button type="button" c_no="${comment.c_no }" class="project_board_read_comment_content_update_btn">수정</button> --%>
										</c:if>
										<c:if test="${loginSSInfo.m_id ne comment.m_id }">
											<div></div>
											<%-- <button type="button" c_no="${comment.c_no }" class="project_board_read_comment_content_reply_btn">답글</button> --%>
										</c:if>
									</div>
								</c:if>
								<c:if test="${comment.c_level eq 0}">
									<div class="project_board_read_comment_content_profile_img"><img src="<%= request.getContextPath() %>/resources/images/profile.jpg"></div>
									<div class="project_board_read_comment_content_profile_flex">
										<div class="project_board_read_comment_content_profile_name">${comment.c_writer}</div>
										<div class="project_board_read_comment_content_profile_job">회원</div>
									</div>
									<div class="project_board_read_comment_content_date">${fn:substring(comment.c_write_date, 0, 19) }</div>
									<c:if test="${loginSSInfo.m_id eq comment.m_id }"> 
										<button type="button" c_no="${comment.c_no }" class="project_board_read_comment_content_delete_btn">삭제</button>
									</c:if>
									<c:if test="${loginSSInfo.m_id eq comment.m_id }">
										<button type="button" c_no="${comment.c_no }" class="project_board_read_comment_content_update_btn">수정</button>
									</c:if>
									<c:if test="${loginSSInfo.m_id ne comment.m_id }">
										<button type="button" c_no="${comment.c_no }" class="project_board_read_comment_content_reply_btn">답글</button>
									</c:if>
								</c:if>
							</div>
							<c:if test="${comment.c_level eq 0}">
								<div class="project_board_read_comment_content_input_wrap">
										<div class="project_board_read_comment_content">${comment.c_comment }</div>
								</div>	
							</c:if>
							<c:if test="${comment.c_level ne 0}">
								
							</c:if>
							
						</div>
					</c:forEach>
					<div class="project_board_read_comment_content_wrap">
						<div class="project_board_read_comment_content_input_wrap">
							<textarea type="text" class="project_board_read_comment_content_input" name=""></textarea>
							<button type="button" class="btn_format_mini_gray" id="project_board_read_comment_content_input_btn">등록</button>
						</div>
					</div>
				</div>
			
				
			</div>
			<button class="project_board_read_btn btn_format_mini" id="ok_btn">확인</button>
			</div>
		
		</div>
	</div>
</section>
<script>
//게시글 번호
var js_b_no = (new URL(location.href).searchParams).get('b_no');


	$(function(){
	  if(${loginSSInfo.m_nickname ne board.b_writer }){
		  $(".btn_d_u").hide();
	  }
	});
	
	$('#ok_btn').click(function() {
		history.back();
	});

//대댓글 프사줄 없애기
/* var c_list[] = ${commentList};
console.log()
$(function(){
	if(  .c_level > 0 ){
		$(".project_board_read_comment_content_profile_wrap").hide();
	}
}); */

//댓글 등록
	$("#project_board_read_comment_content_input_btn").on("click", function() {
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/comment/insert",
			dataType: "json",
			data: {
				b_no : js_b_no,
				c_comment: $(".project_board_read_comment_content_input").val().replaceAll(/(\n|\r\n)/g, "<br>")
			},
			success: function(result) {
				if(result == -1) {
					alert("댓글 등록에 실패했습니다. 다시 시도해 주세요.");					
				}
				else {
					console.log(result);
					createCommentList(result);
					$(".project_board_read_comment_content_input").val('');
					alert("댓글이 등록되었습니다.");	
					location.href="<%= request.getContextPath()%>/read?b_no="+js_b_no; 
				}
			},
			error: function(request, status, error) {
				alert("댓글 등록에 실패했습니다. 다시 시도해 주세요.");
			}
		});
	});

//댓글 삭제
	$(".project_board_read_comment_content_delete_btn").on("click", function(){
		$.ajax({
			type: "POST",
			url: "<%= request.getContextPath()%>/comment/delete",
			dataType: "json",
			data: {
				b_no : js_b_no,
				c_no : $(this).attr("c_no")
			},
			success: function(result) {
				if(result == -1) {
					alert("댓글 삭제에 실패했습니다.");					
				}
				else {
					console.log(result);
					createCommentList(result);
					alert("댓글이 삭제되었습니다.");	
					location.href="<%= request.getContextPath()%>/read?b_no="+js_b_no; 
				}
			},
			error: function(request, status, error) {
				alert("댓글 삭제에 실패했습니다. 다시 시도해 주세요.");
			}
		});
	});
// 댓글 수정
$(".project_board_read_comment_content_update_btn").on("click", updateBtnFnc);

// 댓글 수정 버튼 수정 기능
function updateBtnFnc() {
	$(this).text("완료");
	$(this).off("click");
	$(this).on("click", updateDoCommentFnc);
	let temtText = $(this).parent().next().children().text();
	$(this).parent().next().children().remove();
	$(this).parent().next().append('<textarea class="project_board_read_comemnt_content_input" name="">'+temtText+'</textarea>');
}

// 댓글 수정 함수 기능
function updateDoCommentFnc() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/comment/update",
		dataType: "json",
		data: {
			c_no : $(this).attr("c_no"),
			b_no : js_b_no,
			c_comment : $(this).parent().next().children().val().replaceAll(/(\n|\r\n)/g, "<br>")
		},
		success: function(result) {
			if(result == -1) {
									
			}
			else {
				console.log(result);
				createCommentList(result);
				alert("댓글이 수정되었습니다.");
				location.href="<%= request.getContextPath()%>/read?b_no="+js_b_no; 
			}
		},
		error: function(request, status, error) {
			alert("댓글 수정에 실패했습니다. 다시 시도해 주세요.");
		}
	});
}

//대댓글 달기 
$(".project_board_read_comment_content_reply_btn").on("click", replyBtnFnc);
//대댓글 달기 버튼 수정 기능
function replyBtnFnc() {
	$(this).text("완료");
	$(this).off("click");
	$(this).on("click", replyDoCommentFnc);
	let temtText = $(this).parent().next().children().text();
	$(this).parent().parent().append('<textarea type="text" class="project_board_read_comemnt_content_input" name="" id="c_reply_content"></textarea>');
}
//대댓글 달기 함수 기능
function replyDoCommentFnc() {
	$.ajax({
		type: "POST",
		url: "<%= request.getContextPath()%>/comment/insert",
		dataType: "json",
		data: {
			c_no : $(this).attr("c_no"),
			b_no : js_b_no,
			c_comment : $("#c_reply_content").val().replaceAll(/(\n|\r\n)/g, "<br>")
		},
		success: function(result) {
			if(result == -1) {
									
			}
			else {
				console.log(result);
				createCommentList(result);
				alert("답글이 등록되었습니다.");	
				location.href="<%= request.getContextPath()%>/read?b_no="+js_b_no; 
			}
		},
		error: function(request, status, error) {
			alert("답글 등록에 실패했습니다. 다시 시도해 주세요.");
		}
	});
}

// 댓글리스트 생성
function createCommentList(commentList) {
	$(".project_board_read_comment_content_wrap").eq(0).nextAll().remove();
	for(var i = 0; i < commentList.length; i++) {
		$(".project_board_read_comment_content_profile_wrap").last().append('<div class="project_board_read_comment_content_profile_flex"></div>');
		$(".project_board_read_comment_content_profile_flex").last().append('<div class="project_board_read_comment_content_profile_name">'+commentList[i].c_writer+'</div>');
		$(".project_board_read_comment_content_profile_flex").last().append('<div class="project_board_read_comment_content_profile_job">'+'회원'+'</div>');
		$(".project_board_read_comment_content_profile_wrap").last().append('<div class="project_board_read_comment_content_date">'+commentList[i].c_write_date+'</div>');
		$(".project_board_read_comment_content_input_wrap").last().append('<div class="project_board_read_comment_content">'+commentList[i].c_comment+'</div>');
		if(commentList[i].m_id == '${loginSSInfo.m_id}') {
			$(".project_board_read_comment_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].c_no+'" class="project_board_read_comment_content_delete_btn">삭제</button>');
			$(".project_board_read_comment_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].c_no+'" class="project_board_read_comment_content_update_btn">수정</button>');
		}
		if(commentList[i].m_id != '${loginSSInfo.m_id}') {
			$(".project_board_read_comment_content_profile_wrap").last().append('<button type="button" pc_no="'+commentList[i].c_no+'" class="project_board_read_comment_content_reply_btn">답글</button>');
		}
		
		$(".project_board_read_comment_content_flex").append('<div class="project_board_read_comment_content_wrap"></div');
		$(".project_board_read_comment_content_wrap").last().append('<div class="project_board_read_comment_content_profile_wrap"></div');
		$(".project_board_read_comment_content_wrap").last().append('<div class="project_board_read_comment_content_input_wrap"></div');
		$(".project_board_read_comment_content_profile_wrap").last().append('<div class="project_board_read_comment_content_profile_img"></div>');
		$(".project_board_read_comment_content_profile_img").last().append('<img src="<%= request.getContextPath() %>/resources/images/profile.jpg">');
		
		
	}
	$(".project_board_read_comment_content_update_btn").off("click");
	$(".project_board_read_comment_content_update_btn").on("click", updateBtnFnc);
	
}

/////댓글쓸때 유효성
//바이트수 구하기
var strByteLength = function(s,b,i,c){
  for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
  return b
}
//바이트까지 자르기
String.prototype.cutByte = function(len) {
     var str = this;
     var l = 0;
     for (var i=0; i<str.length; i++) {
	         l += (str.charCodeAt(i) > 128) ? 3 : 1;
	      if (l > len) return str.substring(0, i);
	     }
     return str;
 }
$('.project_board_read_comment_content_input').on('input', function(){
	let contentCount = strByteLength($(this).val());
	let str = $(this).val();
	
	if(contentCount > 90) {
		$(this).val(str.cutByte(90));
		alert('댓글은 한글 30자, 영어 90자 까지 입력 가능합니다.')
	}
});
$('.project_board_read_comemnt_content_input').on('input', function(){
	let contentCount = strByteLength($(this).val());
	let str = $(this).val();
	
	if(contentCount > 90) {
		$(this).val(str.cutByte(90));
		alert('댓글은 한글 30자, 영어 90자 까지 입력 가능합니다.')
	}
});

</script>
</body>
</html>