<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <!DOCTYPE HTML>
<html>
<head>
<title>月度/年度车辆费用统计</title>
<script type="text/javascript" src="../../js/jquery-1.9.1.min.js"></script>
</head>

<body>
	<table width="100%"  border="0" align="center" cellspacing="1" >
	  <tr align="center">
	  	<td>年
	  	<select name="year">
		  	<option >2017</option>
		  	<option>2016</option>
		  	<option>2017</option>
		  	<option>2018</option>
		  	<option>2019</option>
	  	</select>
	  	&nbsp;&nbsp;&nbsp;月
	  	<select name="month">
		  	<option >10</option>
		  	<option>1</option>
		  	<option>2</option>
		  	<option>3</option>
		  	<option>4</option>
		  	<option>5</option>
		  	<option>6</option>
		  	<option>7</option>
		  	<option>8</option>
		  	<option>9</option>
		  	<option>10</option>
		  	<option>11</option>
		  	<option>12</option>
	  	</select></td>
	  		<td><img src="../../images/submitFind.gif" onclick="window.location.href='countBikeFee.do'"></td>
	  	</tr>
  	</table>
  	
	<table width="100%"  border="1" align="center" cellspacing="0" class="a1">
	  <tr align="center">
	  	<th>车辆数量</th>
	    <th>借还次数</th>
	    <th>修理次数</th>
	    <th>平均借车收入费用</th>
	    <th>总借车收入费用</th>
	    <th>平均修理费用</th>
	    <th>总修理费用</th>
	  </tr>
	  <tr align="center">
	  	<td>${allBikeQurey.bicycleCount }</td>
	    <td>${allBikeQurey.rentCount}</td>
	    <td>${allBikeQurey.repairCount}</td>
	    <td>${allBikeQurey.avgRentFee}</td>
	    <td>${allBikeQurey.allRentFee}</td>
	    <td>${allBikeQurey.avgRepairFee}</td>
	    <td>${allBikeQurey.allRepairFee}</td>
	    </tr>
	</table>
  
  	<table width="100%"  border="1" align="center" cellspacing="0" id="detailTable">
	  <tr align="center">
	  	<th >车辆Id</th>
	  	<th >使用时间</th>
	    <th >借还次数</th>
	    <th >修理次数</th>
	    <th>调度次数</th>
	    <th >平均借还时间</th>
	    <th >总借还时间</th>
	    <th>总借车收入费用</th>
	    <th >平均借车费用</th>
	    <th>平均修理费用</th>
	    <th>总修理费用</th>
	  </tr >
	  <c:forEach items="${allBikeQurey.list}" var="list">
	  	<tr align="center">
		  	<td>${list.bicycle_id}</td>
		  	<td>${list.userTime}</td>
		    <td>${list.rentCount }</td>
		    <td>${list.repairCount }</td>
		    <td>${list.transferCount }</td>
		    <td>${list.avgRentTime }</td>
		    <td>${list.allRentTime }</td>
		    <td>${list.allRentFee }</td>
		    <td>${list.avgRentFee }</td>
		    <td>${list.avgRepairFee }</td>
		    <td>${list.allRepairFee }</td>
	  	</tr>
  	</c:forEach>
 
</table>

</body>
</html> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>HTML5 Canvas折线图表和柱形图表DEMO演示</title>

<script type="text/javascript" src="jQuery.js"></script>
<script type="text/javascript" src="jqplot.js"></script>


</head>
<body>

	<div id="chart1"></div>

<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>

	<div id="chart2"></div>

	<script type="text/javascript">
		$.post(
			'countBikeFee.do',
			function(data){
				$("#chart2").children().remove();
				$("#chart1").children().remove();
				var d=new Array();
				var d1=new Array();
				var line_title=new Array();
				for(var i=0;i<data.list.length;i++){
				var temp =data.list[i];
				d1=[temp.userTime,temp.rentCount,temp.repairCount,temp.transferCount,temp.avgRentTime,temp.allRentTime,temp.allRentFee,temp.avgRentFee,temp.avgRepairFee,temp.allRepairFee];
				d[i]=d1;
				line_title[i]=temp.bicycle_id;
				}
	 data =d;
	var data_max = 10; //Y轴最大刻度
	var y_label = "次数"; //Y轴标题
	var x_label = "项目"; //X轴标题
	var x = [1,2,3,4,5,6,7,8,9,10,11]; //定义X轴刻度值
	var title = "统计自行车的利用率"; //统计图标标题
	j.jqplot.diagram.base("chart1", data, line_title, "这是统计标题", x, x_label, y_label, data_max, 1);
	j.jqplot.diagram.base("chart2", data, line_title, "这是统计标题", x, x_label, y_label, data_max, 2);
			},"json");


</script>
</body>
</html>
