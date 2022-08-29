<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink2.jsp" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/join/join.css">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/aside.jsp" %>
<section>
    <div id="txt">
        <p id="main_txt">EanSoft 회원가입</p><br>
        <span class="mid_txt" id="f_txt">반갑습니다! 이안소프트 회원가입 페이지 입니다.</span><br>
    </div>
    <form action="join" method="post" id="submit">
        <span class="btn_name" id="id_html">아이디 *</span><br>
        <div class="email_area">
            <input type="text" id="m_id" name="m_id" placeholder=" 아이디를 입력해 주세요. (영문 대소문자, 숫자 4~20자)" class="text" required>
            <input type="button" id="member_id_check" name="member_id_check" value="중복 확인">
            <input type="button" id="member_id_check2" name="member_id_check2" value="확인 완료">
        </div>
        <span class="btn_name" id="nickname_html">닉네임 *</span><br> 
        <div class="email_area">
            <input type="text" id="m_nickname" name="m_nickname" placeholder=" 닉네임을 입력해 주세요. (한글 2~10자)" class="text" required>
            <input type="button" id="member_nickname_check" name="member_nickname_check" value="중복 확인">
            <input type="button" id="member_nickname_check2" name="member_nickname_check2" value="확인 완료">
        </div>
        <span class="btn_name" id="pwd_txt">비밀번호 *</span> <br>
        <input type="password" placeholder=" 비밀번호를 입력해 주세요. (영문 대소문자, 숫자 8~20자)" name="pwd" id="pwd_1" class="text" required><br>
        <span class="btn_name">비밀번호 확인 *</span> <br>
        <input type="password" placeholder=" 비밀번호 확인." id="pwd_2" class="text" required><br>
        <input type="submit" id="ok" value="회원가입">
    </form>    
</section>
<script>
	// 유효성 검사

	        
	     // 비밀번호 형식 확인
	        var chkPwd = false;
	        var chkPwd2 = false;
	        
			$("#pwd_1").focusout(function(){
			
		    	var pwd = /^[0-9a-zA-Z]{8,20}$/;
		    	var pwdVal = $("#pwd_1").val();
		    		
		    	if(!pwd.test(pwdVal)){
		    		chkPwd = false;
		    	} else {
		    		chkPwd = true;
		    	}
		    });
			$("#pwd_1").on("input",function(){
				var pwd = /^[0-9a-zA-Z]{8,20}$/;
		    	var pwdVal = $("#pwd_1").val();
				if(!pwd.test(pwdVal)){
				$("#pwd_txt").html("비밀번호 형식이 맞지 않습니다.");
				} else{
					$("#pwd_txt").html("비밀번호 *");
				}
			});
	        
		// 비밀번호 확인 형식 확인
	        var chkPwdCk = false;
	        
			$("#pwd_2").focusout(function(){
			
		    	var pwdCk = /^[0-9a-zA-Z]{8,20}$/;
		    	var pwdCkVal = $("#pwd_2").val();
		    		
		    	if(!pwdCk.test(pwdCkVal)){
		    		chkPwdCk = false;
		    	} else {
		    		chkPwdCk = true;
		    	}
		    });   
			
	//아이디
   	var chkId = false;
   	var checkIdDu = 0;
   	
   		// 아이디 형식 확인
    	$("#m_id").on("input", (function(){
    		checkIdDu = 0;
    		$("#member_id_check").show();
			$("#member_id_check2").hide();
    		
    		var id = /^[0-9a-zA-Z]{4,20}$/;
    		var idVal = $("#m_id").val();
    		
    		if(!id.test(idVal)){
    			$("#id_html").html("아이디 형식에 맞지 않습니다.");
    			chkId = false;
    		} else {
    			$("#id_html").html("아이디 *");
    			chkId = true;
    		}
    	}));		
		
		// 닉네임 형식 확인
		var chkNickname = false;
		var checkNicknameDu = 0;
    	$("#m_nickname").on("input", (function(){
    		checkIdDu = 0;
    		$("#member_nickname_check").show();
			$("#member_nickname_check2").hide();
    		
    		var nickname = /^[가-힣]{2,10}$/;
    		var nicknameVal = $("#m_nickname").val();
    		
    		if(!nickname.test(nicknameVal)){
    			$("#nickname_html").html("닉네임 형식에 맞지 않습니다.");
    			chkNickname = false;
    		} else {
    			$("#nickname_html").html("닉네임 *");
    			chkNickname = true;
    		}
    	}));
/////////////////////////////////////////////////////////////////

// 닉네임 중복 확인 - 버튼클릭

	$("#member_nickname_check").click(function(){
    	// 닉네임 입력 칸에 입력한 값이 있다면
   		if($("#m_nickname").val() != "") {
   			if(chkNickname){
    				$.ajax({
    					url:"nicknameChk",
    					type: "post",
    					data: {m_nickname: $("#m_nickname").val()},
    					success: function(result){
    						if(result == 0){
    							checkNicknameDu = 0;
    							alert("사용 가능한 닉네임입니다.")
    							$("#member_nickname_check").hide();
    							$("#member_nickname_check2").show();
    							
    						} else if(result > 0) {
    							checkNicknameDu = 1;
    							alert("이미 사용 중인 닉네임입니다. 다시 입력해 주세요.");
    							$("#m_nickname").focus();
    						} else {
    							checkNicknameDu = 2;
    							alert("오류 발생. 다시 시도해 주세요.");
    						}
    					},
    					error: function(){
    						alert("ajax 오류 발생");
    					}
    				})
    		} else {
        		alert("닉네임을 바르게 입력해주세요.");
    		}	
   		} else if($("#m_nickname").val() == ""){
   			alert("닉네임을 입력해주세요.");
   		}
   	});

//아이디 중복확인
	$("#member_id_check").click(function(){
		// 아이디 입력 칸에 입력한 값이 있다면
		if($("#m_id").val() != "") {
			if(chkId){
 			console.log("아이디 중복 체크하러 갑니다.");
 				$.ajax({
 					url:"idChk",
 					type: "post",
 					data: {m_id: $("#m_id").val()},
 					success: function(result){
 						if(result == 0){
 							checkIdDu = 0;
 							alert("사용 가능한 아이디입니다.")
 							$("#member_id_check").hide();
 							$("#member_id_check2").show();
 							
 						} else if(result > 0) {
 							checkIdDu = 1;
 							alert("이미 사용 중인 아이디입니다. 다시 입력해 주세요.");
 							$("#m_id").focus();
 						} else {
 							checkIdDu = 2;
 							alert("오류 발생. 다시 시도해 주세요.")
 						}
 					},
 					error: function(){
 						alert("ajax 오류 발생");
 					}
 				})
 		} else {
     		alert("아이디를 바르게 입력해주세요.");
 		}	
		} else if($("#member_id").val() == ""){
			alert("아이디를 입력해주세요.");
		}
	});
/////////////////////////////////////////////////////////////////

	
	// 회원가입 버튼 클릭 시
	$("#submit").submit(function(){
		rt = true;
		
		// 비밀번호, 비밀번호 확인 체크
        if($("#pwd_1").val() != $("#pwd_2").val()){
 		    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
 			return rt = false;
 		}
       
		// 형식 확인
		if(chkPwd == false){
			alert("비밀번호를 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 8~20자)");
			return rt = false;
		}
		if(chkPwdCk == false){
			alert("비밀번호 확인 내 입력 값을 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 8~20자)");
			return rt = false;
		}
		if(chkNickname == false){
			alert("닉네임을 형식에 맞게 입력해 주세요. (한글 2~10자)");
			return rt = false;
		}
		if(chkId == false){
			alert("아이디를 형식에 맞게 입력해 주세요. (영문 대소문자, 숫자 4~20자)");
			return rt = false;
		}
	})
	
</script>
</body>
</html>