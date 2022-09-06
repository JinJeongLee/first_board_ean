<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/csslink.jsp" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/attendance/attendance.css">
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 
<meta charset="UTF-8">
<title>WCW</title>
<%@ include file="/WEB-INF/views/template/font.jsp" %>

<style type="text/css">
.attendance_main_box_first_container {
	flex-grow: 1;
}

#insert_attendance_box_top{
	width: 240px;
	height: 36px;
	border: 2px solid rgb(224, 224, 224);
	background-color: rgb(244, 244, 244);
	text-align: center;
	line-height: 36px;
	
}
#insert_attendance_box_bottom{
	width: 240px;
	height: 64px;
	border-left: 2px solid rgb(224, 224, 224);
	border-right: 2px solid rgb(224, 224, 224);
	border-bottom: 2px solid rgb(224, 224, 224);
	border-top: 0px;
	text-align: center;
	display: flex;
	align-items: center;
}
#insert_box_bottom_buttons{
	margin: auto;
}


.first_box_text{
	margin-bottom: 13px;
}

#search_date_range{
	display: flex;
	gap: 30px;
}

#att_appr_clock_in, #att_appr_clock_out{
	border: 1px solid rgb(224, 224, 224);
	width: 138px; height:25px;
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);	
}
#att_modify_reason_text{
	border: 1px solid rgb(224, 224, 224);
	font-size: 12px;
	font-family: NotoSansR;
	color: rgb(94, 94, 94);
}
.charts{
	margin-top: 25px;
}

/* grid box~! */
#attendance_modify_grid_container{
	display: grid;
	grid-template-columns: 1fr 1.5fr 1fr 1.5fr 1fr 1.5fr;
	grid-template-rows: 1fr 3fr 1fr;
	row-gap: 30px;
	
}
#att_modify_reason_text{
	
	grid-column: 2 / 7;
	grid-row: 2 / 3;

}
.attendance_modify_grid_first_row{
	align-self: center;
}

#attendance_modify_submit_btn{
	grid-column: 6 / 7;
	grid-row: 3 / 4;
	justify-self: end;
	
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
<section id="attendance_section">
	<div id="attendance_main_wrap">
		<div id="attendance_main_header">
			<div id="attendance_main_menu_title">휴가 통계</div>
		</div>
		
		<div id="attendance_main_container">
			<div class="attendance_hr_main_box">
				<div class="attendance_main_box_content">
					<div id="search_date_range">
						<div class="font_title">기준년월</div>
						<input type="month" class="att_date_form" id="att_month" name="att_month">
					</div>
				</div>
				<div class="attendance_main_box_content">
					<table class="attendance_hr_main_box_content_table" id="att_date_search_table">
						<tr class="table_title">
							<td style="width: 25%">사번</td>
							<td style="width: 25%">성명</td>
							<td style="width: 25%">휴가구분</td>
							<td style="width: 25%">사용일수</td>
						</tr>
						<tr><td colspan="4">기준년월을 선택해주세요</td></tr>
					</table>
					<div class="charts">
	                    <canvas id="chart1"></canvas>
	                </div>
				</div>
			</div>
			
		</div>
	</div>
</section>
<script>


$("#att_month").on("change", function(){
	var namelist = [];
	var vacationcnt = [];
	$(".table_title").eq(0).nextAll().remove();
	$.ajax({
		url: "<%=request.getContextPath()%>/hr/attendance/vacation_chart",
		type: "post",
		async: false, 
		data: {att_month:$('#att_month').val()} ,
		dataType:"json",
		success: function(result){
			console.log(result);
			var html;
			if(result.length==0){
				html = "";
				html += '<tr class="table_content_white">';
				html += '<td colspan="4">휴가 내역이 없습니다.</td>';
				 html += '</tr>';
	                $('#att_date_search_table').append(html);
			} else{
			for(var i = 0; i < result.length; i++){
				var vo = result[i];
				namelist.push(vo.name);
				vacationcnt.push(vo.vaca_cnt);
				html = "";
				html += '<tr class="table_content_white">';
				
	                html += '<td >'+vo.emp_no+'</td>';
	                html += '<td >'+vo.name+'</td>';
	                html += '<td >';
	                if(vo.vaca_sort == '1') {
	                	html += "연차휴가";}
	                else if(vo.vaca_sort == 2){
	                	html += "출산휴가";
	                }else if(vo.vaca_sort == 3){
	                	html += "배우자 출산휴가";
	                }else if(vo.vaca_sort == 5){
	                	html += "생리휴가";
	                }else if(vo.vaca_sort == 4){
	                	html += "가족 돌봄 휴가";
	                }else{
	                	html += "error";
	                }
	            	   html += '</td>';
	            	   html += '<td >'+vo.vaca_cnt+'</td>';
                html += '</tr>';
                $('#att_date_search_table').append(html);
                
				}
			}
		},
		error: function(error){
			alert("휴가 통계 조회에 실패했습니다."); 
		}
	});
	
	/*////////////////// 차트 /////////////////// */
	$(".charts").children().remove();
	$(".charts").append('<canvas id="chart1"></canvas>');
	const chart1 = document.getElementById('chart1').getContext('2d');
	    const myChart1 = new Chart(chart1, {
	        type: 'bar',
	        data: {
	            labels: namelist,
	            datasets: [{
	                label: '휴가일수',
	                data: vacationcnt,
	                backgroundColor: '#4B4DB2',
	                borderColor: '#4B4DB2'
	                
	            }]
	        },
	        options: {
	            scales: {
	                y: { beginAtZero: true}
	            }
	        }
	    });
	    
});



    
//////////////연습

/* 	var jsonData = {
		"STATUS" : "",
		"MATRL" : "A0000001"
	};
	var promise = $.ajax({
		type : "POST",
		url : "/test/go",
		dataType : "json",
		data : jsonData
	});
	promise.done(successFunction);
	promise.fail(failFunction);
	function successFunction(data) {
		if (data.result === 'success')
			var a = "함수호출 success";
		return alert(a);
	}
	function failFunction(data) {
		if (data.result != 'success')
			var a = "함수호출 fail";
		return alert(a);
	} */
</script>
</body>
</html>