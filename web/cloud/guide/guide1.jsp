<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<style type="text/css">

.button{
	background-image: url("./image/button.jpg");
	width: 118px;
	height: 39px;
}

.button:HOVER {
	background-image: url("./image/button-hover.jpg");
}

</style>	

<script type="text/javascript">

function load()
{
	parent.goStep(1);
}

</script>
</head>
<body onload="load()">

<br />
<br />
<br />
<div style="background-image: url('/cloud/guide/image/welcome.jpg'); background-repeat: no-repeat; width: 510px; height: 100px">

</div>

<br />
<br />

<div style="float: right;">
	<span style="font-size: 42px; font-weight: bold;font-family: -webkit-pictograph;"><s:text name="welcome_guide" /></span>
</div>

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<div style="float: right;">
	<span style="font-size: 26px; font-weight: bold;font-family: -webkit-pictograph;"><s:text name="check_cable_online" /></span>
</div>
	
</body>
</html>
