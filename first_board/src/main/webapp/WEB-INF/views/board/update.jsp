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
#board_row3{
	display: flex;
	gap:10px;
}

/* ?????? ?????? ?????? */
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
			<div id="board_main_menu_title">????????? ??????</div>
		</div>
		
		<div id="board_main_container">
			<div class="board_hr_main_box">
				<div class="board_main_box_content">
					<div>
			            <p id="board_write" class="font_title">??????</p>
			        </div>
			        <form action="update" method="post">
			        <div>
			            <input id="board_title" name="b_title" type="text" value="${b_title}">
			        </div>
			        <div id="board_content" class="font_title" >
			            ??????
			        </div>
			        <div id="textEditer">
			            <textarea id="board_content1" name="b_content" >${b_contentf}</textarea>
			        	
			        </div>
			        <!--
			        <div id="board_row3">
				        <div class="font_title" >??? ??????</div>
				        <select name="board_type" id="board_type">
				        	<option value="1">??????</option>
				        	<option value="2">??????</option>
				        	<option value="3">??????</option>
				        	<option value="4">??????</option>
				        </select>
				        <div class="font_title margin1" >????????????</div>
				        <input type="file">
			        </div> 
			        <div id="board_row4">
				        <div class="font_title" >?????????</div>
				        <input id="b_writer" type="text">
				        <div class="font_title margin1" >????????????</div>
				        <input id="b_password" type="text">
			        </div> -->
			        <div id="btn_cancel_submit">
			            <button type="button" id="board_cancel" class="btn_format_mini">??????</button>
			            <button id="board_submit" type="submit" class="btn_format_mini">??????</button>
			        </div>
			        <input type="hidden" name="b_no" value="${b_no}">
			        </form>
				</div>
				
			</div>
			
		</div>
	</div>
</section>
<script>
	$("#board_cancel").on("click", function(){
		history.back();
		<%-- location.href="<%= request.getContextPath()%>/"; --%>
	})
	
//////// ??? ???????????? ///////////
var title;
var content
$(function(){
	
});
</script>
</body>
</html>