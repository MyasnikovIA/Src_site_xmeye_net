<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%--<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'guide-1.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <style type="text/css">

        * {
            margin: 0px;
        }

        .selected {
            background: no-repeat;
            background-image: url("/cloud/guide/image/selected.jpg");
            height: 35px;

            padding-left: 5px;
            padding-top: 10px;
            font-size: 14px;
            font-weight: bold;
            color: white;
            font-family: -webkit-pictograph;
        }

        .unselected {
            background: no-repeat;
            background-image: url("/cloud/guide/image/unselected.jpg");
            height: 35px;

            padding-left: 5px;
            padding-top: 10px;
            font-size: 14px;
            font-weight: bold;
            color: black;
            font-family: -webkit-pictograph;
        }


    </style>
    <script type="text/javascript">


        function goStep(step) {
            for (var i = 1; i <= 7; i++) {
                document.getElementById("step-" + i).className = "unselected";

            }
            document.getElementById("step-" + step).className = "selected";
        }
    </script>
</head>
<body>

<div style="width: 2px; height: 100%; float: left; background-color: rgb(217,217,217) ;">
</div>
<div style="width: 9px; height: 100%; float: left;">
</div>
<div style="width: 1px; height: 100%; float: left;  background-color: rgb(220,220,220) ;">
</div>

<div style="width: 242px; height: 100%; float: left;  background-color: rgb(248,248,248) ;">
    <div style="height: 30px; width: 100%">
    </div>
    <div id="step-1" class="selected">
        <s:text name="step1"/>
    </div>
    <div style="height: 8px">
    </div>
    <div id="step-2" class="unselected">
        <s:text name="step2"/>
    </div>
    <div style="height: 8px">
    </div>
    <div id="step-3" class="unselected">
        <s:text name="step3"/>
    </div>
    <div style="height:8px">
    </div>
    <div id="step-4" class="unselected">
        <s:text name="step4"/>
    </div>
    <div style="height: 8px">
    </div>
    <div id="step-5" class="unselected">
        <s:text name="step5"/>
    </div>
    <div style="height: 8px">
    </div>
    <div id="step-6" class="unselected">
        <s:text name="step6"/>
    </div>
    <div style="height: 8px">
    </div>
    <div id="step-7" class="unselected">
        <s:text name="step7"/>
    </div>
</div>
<div style="width: 1px; height: 100%; float: left;  background-color: rgb(220,220,220) ;">
</div>
</body>
</html>
