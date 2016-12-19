<%@ Language=VBScript CodePage=65001%>

<%Session.CodePage=65001%>
<!--#include virtual="database/db_connect_string.asp"-->
<%   objDBconn.Open param & ";dbq=" & Server.MapPath(mm_company_string)	
    sql="SELECT * FROM user WHERE acct='"&request("acct")&"' AND pw='"&request("pwd")&"'"
      objRs.Open sql,objDBconn,1,3
    if NOT objRs.EOF then
      session("type")="admin"
      session("pw")=objrs("pw")
	  session("user")=objrs("acct")
	  welcome="&#27489;&#36814;&#31649;&#29702;&#32773;&#30331;&#20837;!"
    
    else
      response.redirect "news.asp?aa=fault"   
    end if   
  objRs.close  
 %>  
 <html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title> <%=welcome%> </title>
</head>

<body topmargin="0" leftmargin="0">
<%  if request("edit") = "ok" then 
		Response.write "<script language=javascript>alert(' 修改密碼成功 ');</script>"
    end if		
%>
<%
if session("type")<>"nil" then 

%>
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

</style> 



</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">


<table border="0" width="709" height="420" id="table1" cellspacing="0" cellpadding="0" background="images/newsbk.jpg">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2" height="420">
			<tr>
				<td height="137">
				<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3">
					<tr>
						<td width="261" height="137" background="images/manage.jpg">&nbsp;</td>
						<td>&nbsp;<p>&nbsp;</p>
						<table border="0" width="448" cellspacing="0" cellpadding="0" id="table6" height="20">
							<tr>
								<td width="112"><font color="#E7E7E7">｜<a href="modpws.asp">修改密碼</a></font></td>
								<td width="112"><font color="#E7E7E7">｜<a href="addnews.asp">新增消息</a></font></td>
								<td width="112"><font color="#E7E7E7">｜<a href="modnews.asp">管理消息</a></font></td>
								<td width="112"><font color="#E7E7E7">｜<a href="news.asp?mod=logout">登出管理</a></font></td>
							</tr>
						</table>
						</td>
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
		<p align="center">
		<img border="0" src="images/logo.jpg" width="133" height="92" align="right"></td>
						<td width="160" rowspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="325">
						<p align="center"><font color="#808080">生活美學：最新消息：後台管理系統</font></p>
						<p align="center"><font color="#808080">歡迎您　登入！</font></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<%
else
   response.write "no found"
end if

%>


</body>

</html>