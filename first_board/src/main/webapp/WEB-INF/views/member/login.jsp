<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/login/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
<script>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
</script>
</head>
<script>
$(function(){
    
    
  //로그인 버튼 클릭시
    $("#login").on("click", function(){
        if($("#saveId").is(":checked")){ // 저장 체크시
        	saveLogin($("#email").val());
        } else{ // 체크 해제시는 공백
        	saveLogin("");
        }
    });
});
</script>
<script>

</script>
<body>
<c:if test="${not empty msg}">
	alert("${msg}");
</c:if>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section>
	<div id="section">
		<div id="top">
	        <p id="top_text">로그인</p>
	    </div>
	    <div id="mid">
	        <p id="mid_text">EanSoft 로그인</p>
	        <form action="login.do" method="post">
	            <div id="f_section">
	                <input type="text" placeholder=" 아이디" name="m_id" id="m_id" required></input><br>
	                <input type="password" placeholder=" 비밀번호" name="password" id="password" required></input><br>
	            </div>
	            
	            <input type="submit" id="login" name="login" value="로그인">
	            <div id="m_section">
	                <span id="join_bottom">회원가입</span> 
	            </div>
	        </form>
	    </div>
    </div>
</section>
<script>

	// 비밀번호 찾기 버튼 클릭 시 
	$("#join_bottom").click(function(){
		location.href="<%= request.getContextPath() %>/join";
	})
</script>
</body>
</html>