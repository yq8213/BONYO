<%@ Language=VBScript CodePage=65001%>

<%Session.CodePage=65001%>
<!--#include virtual="database/db_connect_string.asp"-->

<%
aa=session("type")
if aa = "" then 
   response.write   "<script   language='javascript'>parent.window.location='news.asp';</script>"
end if 

%>
<%
linkcls="logon.asp?acct="&session("user")&"&pwd="&session("pw")
If Request.ServerVariables("Request_method") = "POST" then
a2=request("name2")
   objDBconn.Open param & ";dbq=" & Server.MapPath(mm_company_string)  
   sql="update user set pw='" & a2 & "' where acct='" & session("user") & "'"
objDBconn.Execute(sql)
session("pw")=a2
link="logon.asp?edit=ok&acct="&session("user")&"&pwd="&session("pw")
response.redirect link
End If

%>   

 <html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title> 修改密碼 </title>
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
<script type="text/javascript">
function check()
  {
  var aname1=document.postform.name1.value;
  var aname2=document.postform.name2.value;
  var aname3=document.postform.name3.value;
  var aname4=document.postform.name4.value;
  if ((aname1.length)==0)   {  alert(" 原密碼不可空白 ")  }
  else if ((aname2.length)==0)   {  alert(" 新密碼不可空白 ")  }
  else if (aname2 != aname3){  alert(" 新密碼輸入不一樣 ")  }
  else if (aname2 == aname1){  alert(" 跟原密碼一樣，請新想一個密碼 ")  }
  else if (aname1 != aname4){  alert(" 原密碼錯誤 ")  }
  else {document.postform.submit(); }
  }

</script>


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
						<td height="25" width="709" colspan="3">
						<p align="center"><font color="#6699CC">目前位置：修改密碼</font></td>
					</tr>
					<tr>
						<td width="167" rowspan="2">&nbsp;</td>
						<td width="350" height="121" background="images/usebk.jpg" style="border-left-width: 1px; border-right: 1px solid #2D2D2D; border-top-width: 1px; border-bottom-width: 1px">
			<form action="modpws.asp" name="postform" method="POST" >
						<table border="0" width="326" cellspacing="0" cellpadding="0" id="table7" height="101">
							<tr>
								<td width="132">
								<p align="right">
								<font color="#7E7E7E">請輸入原密碼：</font></td>
								<td width="194">
								<p align="center"><input name="name1" type="password" id="id" size="20" maxlength="10"   /></td>
							</tr>
							<tr>
								<td width="132">
								<p align="right">
								<font color="#7E7E7E">請輸入新密碼：</font></td>
								<td width="194">
								<p align="center">
								<input name="name2" type="password" size="20" maxlength="10"   /></td>
							</tr>
							<tr>
								<td width="132">
								<p align="right">
								<font color="#7E7E7E">再一次新密碼：</font></td>
								<td width="194">
								<p align="center">
								<input name="name3" type="password" size="20" maxlength="10"   />
					            <input name="name4" type="hidden" id="name4" size="14" maxlength="10" value="<%=session("pw")%>"/>
								</td>
							</tr>
							</table>
						</td>
						<td width="176" rowspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="351" valign="top">
								<table border="0" width="351" cellspacing="0" cellpadding="0" id="table8" height="57">
									<tr>
										<td width="175">
										<p align="right">
								<img border="0"  alt="確定修改" src="images/modok.jpg" width="70" height="30" onclick="check()" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
										<td width="176">
										<p align="left">
								&nbsp;&nbsp;&nbsp;
								<a href="<%=linkcls%>">
								<img border="0"  alt="取消修改" src="images/modcls.jpg" width="70" height="30" ></a></td>
									</tr>
								</table>
</td>
					</tr>
				</table>
				</form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>


</body>

</html>