<%@ Language=VBScript CodePage=65001%>

<%Session.CodePage=65001%>
<%if request("mod")="logout" then
   session("type")=""
   session("user")=""
   session("pw")=""
   response.write   "<script   language='javascript'>window.location='news.asp';</script>"
end if%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理介面</title>
<LINK href="word.css" type=text/css rel=stylesheet>
<style type="text/css">
input
{
background:transparent; 
color: #7E7E7E;
border: 1px solid #7E7E7E;
}
img
{
cursor:pointer;
}
</style> 

<script>
	function check(){
		if(document.forms['loginfrm'].acct.value == ""){
			alert("請輸入帳號");
			return;
		}else if(document.forms['loginfrm'].pwd.value == ""){
			alert("請輸入密碼");
			return;	
		}
		document.forms['loginfrm'].submit();	
	}


</script>

</head>
<% if request("aa")="fault" then
		Response.write "<script language=javascript>alert('帳號、密碼錯誤，請重新輸入');</script>"
   end if 	
%>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">


<table border="0" width="709" height="420" id="table1" cellspacing="0" cellpadding="0" background="images/newsbk.jpg">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2" height="420">
			<tr>
				<td height="137">
				<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3">
					<tr>
						<td width="261" height="137" background="images/login.jpg">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td>
				<table border="0" width="709" cellspacing="0" cellpadding="0" id="table4" height="100%">
					<tr>
						<td height="25" width="709" colspan="3">&nbsp;</td>
					</tr>
					<tr>
						<td width="167" rowspan="2">&nbsp;</td>
						<td width="325" height="121" background="images/usebk.jpg" style="border-left-width: 1px; border-right: 1px solid #2D2D2D; border-top-width: 1px; border-bottom-width: 1px">
		<form action="logon.asp" name="loginfrm" method="POST" >						
						<table border="0" width="325" cellspacing="0" cellpadding="0" id="table5">
							<tr>
								<td width="101">
								<p align="center">
								<font color="#7E7E7E">帳　號：</font></td>
								<td width="160"><input name="acct" type="text" id="id" size="20" maxlength="10"   /></td>
								<td width="64" rowspan="2">
								<img border="0"  type="button" alt="&#30331;&#20837;&#24460;&#21488;" src="images/loginbot.jpg" width="50" height="54" align="right" onclick="check()"></td>
							</tr>
							<tr>
								<td width="101">
								<p align="center">
								<font color="#7E7E7E">密　碼：</font></td>
								<td width="160">
								<input name="pwd" type="password" size="20" maxlength="10"   /></td>
							</tr>
						</table>
		</form>				
						</td>
						<td width="160" rowspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="325">&nbsp;</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>

</html>