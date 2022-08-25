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
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<meta charset="UTF-8">
<title>Board</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">
.board_main_box_first_container {
	flex-grow: 1;
}
#cke_1_bottom{
	display: none;
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
					<button class="btn_format_mini_gray">삭제</button>
				</form>
				<form action="update" method="get">
					<input type="hidden" name="b_no" value="${board.b_no}">
					<button class="btn_format_mini_gray">수정</button>
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
				
				<%-- 
				<c:if test="${not empty fileList }">
				<div class="project_board_read_title">파일 업로드</div>
				<div class="project_board_read_file_wrap">
					<c:forEach items="${fileList }" var="file">
						<div class="project_board_read_file"><span class="project_board_read_file_span" url="${file.pf_url }">${file.pf_name }</span></div>
					</c:forEach>
				</div>
				</c:if>
				 --%>
				<%-- 
				<div class="project_board_read_hr"></div>
				<div class="project_board_read_comemnt_title">댓글</div>
				<div class="project_board_read_comemnt_content_flex">
					<div class="project_board_read_comemnt_content_wrap">
						<div class="project_board_read_comemnt_content_profile_wrap">
							<div class="project_board_read_comemnt_content_profile_img"><c:if test="${not empty loginSSInfo.profile}"><img src="${loginSSInfo.profile}"></c:if></div>
							<div class="project_board_read_comment_content_profile_flex">
								<div class="project_board_read_comemnt_content_profile_name">${loginSSInfo.m_nickname }</div>
								<div class="project_board_read_comemnt_content_profile_job">회원</div>
							</div>
						</div>
						<div class="project_board_read_comemnt_content_input_wrap">
							<textarea type="text" class="project_board_read_comemnt_content_input" name=""></textarea>
							<button type="button" class="project_board_read_comemnt_content_input_btn">등록</button>
						</div>
					</div>
					<c:forEach items="${commentList }" var="comment">
						<div class="project_board_read_comemnt_content_wrap">
							<div class="project_board_read_comemnt_content_profile_wrap">
								<div class="project_board_read_comemnt_content_profile_img"><c:if test="${not empty comment.profile}"><img src="${comment.profile}"></c:if></div>
								<div class="project_board_read_comment_content_profile_flex">
									<div class="project_board_read_comemnt_content_profile_name">${comment.name }</div>
									<div class="project_board_read_comemnt_content_profile_job">${comment.job_title }</div>
								</div>
								<div class="project_board_read_comemnt_content_date"></div>
								<c:if test="${loginSSInfo.emp_no eq comment.emp_no }">
									<button type="button" pc_no="${comment.pc_no }" class="project_board_read_comemnt_content_delete_btn">삭제</button>
								</c:if>
								<c:if test="${loginSSInfo.emp_no eq comment.emp_no }">
									<button type="button" pc_no="${comment.pc_no }" class="project_board_read_comemnt_content_update_btn">수정</button>
								</c:if>
							</div>
							<div class="project_board_read_comemnt_content_input_wrap">
								<div class="project_board_read_comemnt_content">${comment.pc_content }</div>
							</div>
						</div>
					</c:forEach>
				</div>
				 --%>
				
			</div>
			<button class="project_board_read_btn btn_format_mini">확인</button>
			</div>
		
		</div>
	</div>
</section>
<script>
	$("#board_cancel").on("click", function(){
		location.href="<%= request.getContextPath()%>/";
	})
	
	$("#board_submit").click(function(){
		if($("#board_title").val() == "" || $("#board_content1").val() == ""){
			alert("모두 작성해 주세요") ;
			return;
		}
		$.ajax({
			url: "<%=request.getContextPath()%>/board/insert",
			type: "post",
			data: {b_title : $('#board_title').val()
				, b_content : $('#board_content1').val()
				, bt_no : $('#board_type').val()
				, b_writer : $('#b_writer').val()
				, b_password : $('#b_password').val()
				} ,
			dataType:"json",
			success: function(result){
				console.log(result);
				alert("글 등록을 완료했습니다."); 
				location.href="<%= request.getContextPath()%>/"; 
				
			},
			error: function(error){
				alert("글 등록에 실패했습니다."); 
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