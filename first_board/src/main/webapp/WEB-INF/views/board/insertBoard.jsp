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
			<div id="board_main_menu_title">게시글 작성</div>
		</div>
		
		<div id="board_main_container">
			<div class="board_hr_main_box">
				<div class="board_main_box_content">
					<form action="insert" method="post" id="insert_frm" enctype="multipart/form-data">
						<div>
				            <p id="board_write" class="font_title">제목</p>
				        </div>
				        <div>
				            <input id="board_title" name="b_title" type="text" placeholder="제목 입력">
				        	<div class="board_input_count" id="title_input_cnt">0/90</div>
				        </div>
				        <div id="board_content" class="font_title" >
				            내용
				        </div>
				        <div id="textEditer">
				            <textarea id="board_content1" name="b_content" placeholder="내용을 입력해 주세요."></textarea>
				        	<div class="board_input_count" id="content_input_cnt">0/1000</div>
				        </div>
				        <div id="board_row3">
					        <div class="font_title" >글 종류</div>
					        <select name="bt_no" id="board_type">
					        	<option value="1">자유</option>
					        	<option value="2">공지</option>
					        	<option value="3">유머</option>
					        	<option value="4">뉴스</option>
					        </select>
					        <div class="font_title margin1" >첨부파일</div>
					        <input type="file" name="uploadfile" id="uploadfile" multiple>
				        </div><!-- 
				        <div id="board_row4">
					        <div class="font_title" >닉네임</div>
					        <input id="b_writer" type="text">
					        <div class="font_title margin1" >비밀번호</div>
					        <input id="b_password" type="text">
				        </div> -->
				        <div id="btn_cancel_submit">
				            <button type="button" id="board_cancel" class="btn_format_mini">취소</button>
				            <button id="board_submit" type="button" class="btn_format_mini">등록</button>
				        </div>
					</form>
				</div>
				
			</div>
			
		</div>
	</div>
</section>
<script>
	// 누르면 다시 메인가기
	$("#board_cancel").on("click", function(){
		location.href="<%= request.getContextPath()%>/";
	})
	
	// 글쓰기
	$("#board_submit").click(function(){
		if($("#board_title").val() == "" || $("#board_content1").val() == ""){
			alert("제목과 내용을 모두 작성해 주세요") ;
			return;
		}
		if(!($("#uploadfile").val())){
			$("#uploadfile").remove();
		}
		$("#insert_frm").submit();
	
	});
	
////////글자수 유효성 ///////////
var strByteLength = function(s,b,i,c){
  for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
  return b
}
console.log(strByteLength("a한글b") + " Bytes");

$('#board_content1').on('input', function(){
	let contentCount = strByteLength($(this).val());
	if(contentCount.length == 0 || contentCount == '') {
		$('#content_input_cnt').text('0/1000');
	} else {
		$('#content_input_cnt').text(contentCount+'/1000');
	}
	if(contentCount > 1000) {
		$(this).val($(this).val().substring(0, 300));
		alert('내용은 1000byte 까지 입력 가능합니다.')
		$('#content_input_cnt').text('1000/1000');
	}
});

$('#board_title').on('input', function(){
	let contentCount = strByteLength($(this).val());
	if(contentCount.length == 0 || contentCount == '') {
		$('#title_input_cnt').text('0/90');
	} else {
		$('#title_input_cnt').text(contentCount+'/90');
	}
	if(contentCount > 90) {
		$(this).val($(this).val().substring(0, 30));
		alert('제목은 한글 30자, 영어 90자 까지 입력 가능합니다.')
		$('#title_input_cnt').text('90/90');
	}
});

</script>
</body>
</html>