<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<aside id="left_aside">
	<img src="<%= request.getContextPath() %>/resources/images/logo.png" id="logo">
	<div id="login_info">
	<c:if test="${not empty loginSSInfo}">
		<div class="profile_circle">
	        <img id="profile" src="<%= request.getContextPath() %>/resources/images/profile.jpg">
		</div>
		<div class="company_info font_r font_gray94 font_12px">EanSoft</div>
		<div class="person_info"><span class="font_b font_gray94 font_13px">${loginSSInfo.m_nickname }&nbsp;</span><span class="font_r font_gray94 font_13px">회원</span></div>
	</c:if>
		<c:if test="${not empty loginSSInfo }">
			<button class="btn_format_mini logout_btn" id="logout_btn">로그아웃</button>
		</c:if>
		<!-- <div id="test_login_btn_wrap">
			<button class="btn_format_mini test_login_btn">테스트 로그인</button>
			<button class="btn_format_mini test_login_btn">테스트 로그인</button>
			<button class="btn_format_mini test_login_btn">테스트 로그인</button>
			<button class="btn_format_mini test_login_btn">테스트 로그인</button>
			<button class="btn_format_mini test_login_btn">테스트 로그인</button>
			<button class="btn_format_mini test_login_btn">테스트 로그인</button>
			<button class="btn_format_mini test_login_btn">서유빈</button>
			<button class="btn_format_mini test_login_btn">이진정</button>
			<button class="btn_format_mini test_login_btn">민승택</button>
		</div> -->
		<form action="<%= request.getContextPath()%>/login.do" method="post" class="test_login_form">
			<input type="hidden" name="email" value="emp1@email.com">
			<input type="hidden" name="pwd" value="1234">
		</form>
	</div>
	
		<div id="left_menu">
		
			<div class="left_menu_wrap">
				<div class="left_menu_title">
					<div class="left_menu_hr"></div>
					<div class="left_menu_hr_title">EanSoft</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f" id="board">
								게시판
					</div>
				</div>
				<div class="left_menu_wrap_1depth">
					<div class="left_menu_1depth_title" open_chk="f" id="login_side">
								로그인
					</div>
				</div>
			</div>
			
		
		</div>
	
</aside>
<script>
	$("#logo").on("click", function(){
		location.href="<%= request.getContextPath()%>/";
	})
	$("#logout_btn").on("click", function(){
		location.href="<%= request.getContextPath()%>/logout";
	})
</script>

<script type="text/javascript">
	$(".left_menu_1depth_title").on("mouseenter", function() {
		$(this).css("backgroundColor", "rgba(67, 89, 113, 0.04)");
	});
	$(".left_menu_1depth_title").on("mouseleave", function() {
		if($(this).attr("open_chk") == "f") {
			$(this).css("backgroundColor", "transparent");
		}
	});
	
	$(".left_menu_1depth_title").on("click", function() {
		for(var i = 0; i < $(".left_menu_1depth_title").length; i++) {
			if($(this)[0] == $('.left_menu_1depth_title')[i]) {
				continue;
			} else {
				$('.left_menu_1depth_title').eq(i).css("backgroundColor", "transparent");
				$('.left_menu_1depth_title').eq(i).css("margin-bottom", "0px");
				$('.left_menu_1depth_title').eq(i).children(".dpeth_arrow").css("transform", "rotate(0deg)");
				$('.left_menu_1depth_title').eq(i).parent().css("height", "30px");
				$('.left_menu_1depth_title').eq(i).attr("open_chk", "f");
			}
		}
		if($(this).attr("open_chk") == "f") {
			$(this).css("backgroundColor", "rgba(67, 89, 113, 0.04)");
			$(this).css("margin-bottom", "5px");
			$(this).children(".dpeth_arrow").css("transform", "rotate(90deg)");
			var heightTemp = $(this).next(".left_menu_2depth_content_wrap").children(".left_menu_2depth_content").length * 30 + 35 +"px";
			$(this).parent().css("height", heightTemp);
			$(this).attr("open_chk", "t");
		} else if($(this).attr("open_chk") == "t") {
			$(this).css("backgroundColor", "transparent");
			$(this).css("margin-bottom", "0px");
			$(this).children(".dpeth_arrow").css("transform", "rotate(0deg)");
			$(this).parent().css("height", "30px");
			$(this).attr("open_chk", "f");
		}
	});
	
	$(".left_menu_1depth_content").on("mouseenter", function() {
		$(this).css("backgroundColor", "rgba(67, 89, 113, 0.04)");
	});
	$(".left_menu_1depth_content").on("mouseleave", function() {
		$(this).css("backgroundColor", "transparent");
	});
	
</script>


<script>
	$('#board').click(function() {
		location.href = '<%= request.getContextPath()%>/';
	});
	$('#login_side').click(function() {
		location.href = '<%= request.getContextPath()%>/login';
	});
	
</script>

<script>
	$('.test_login_btn').click(function() {
		$('.test_login_form').children().eq(0).val('emp'+($(this).index()+1)+'@email.com');
		$('.test_login_form').submit();
	});
</script>

<script type="text/javascript">
	function openWin(f,s) { 
		adWindow=window.open(f,s,'width=340, height=375, left=800px,top=250px,status=no,scrollbars=auto'); 
		}
</script>




