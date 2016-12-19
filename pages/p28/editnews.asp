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
linkedit="editnews.asp?edit=do&no="&request("no")&"&page="&request("page")
editcls="modnews.asp?page="&request("page")
objDBconn.Open param & ";dbq=" & Server.MapPath(mm_company_string)
if request("edit")="do" then
  content= request("content")
  content=Replace(content, chr(10)&chr(13), "<br>")
  content=Replace(content, chr(13), "<br>")
  sql="update news set "
  sql=sql&"title='"&request("title")&"', "  
  sql=sql&"nowdate='"&request("dateok")&"', "
  sql=sql&"content='"&content&"' "
  sql=sql&"WHERE  postid="& Cint(Request("no"))
  objRs.Open sql,objDBconn,1,3
  response.redirect "modnews.asp?edit=ok"
end if
sql="Select * FROM news WHERE  postid="& Cint(Request("no"))
objRs.Open sql,objDBconn,1,3 
%>   

 <html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title> 編輯消息 </title>
<LINK href="word.css" type=text/css rel=stylesheet>
<style type="text/css">
input
{
background:transparent; 
color: #C49A82;
border: 1px solid #7E7E7E;
}
img
{
cursor:pointer;
}
textarea
{
background:transparent; 
color: #C49A82;
border: 1px solid #7E7E7E;
}
</style> 
<script type="text/javascript">
function check()
  {
  var aname1=document.postform.title.value;
  var aname2=document.postform.dateok.value;
  var aname3=document.postform.content.value;
  if ((aname1.length)==0)   {  alert(" 請輸入標題 ")  }
  else if ((aname2.length)==0)   {  alert(" 請輸入日期 ")  }
  else if ((aname3.length)==0)   {  alert(" 請輸入內容")  }
  else {document.postform.submit(); }
  }
function retu() {
  window.history.back(); 
  
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
							<form action="<%=linkedit%>" name="postform" method="POST" >		
				<table border="0" width="709" cellspacing="0" cellpadding="0" id="table4" height="100%">
					<tr>
						<td height="25" width="709" colspan="3">
						<p align="center"><font color="#6699CC">目前位置：編輯消息</font></td>
					</tr>
					<tr>
						<td width="167">&nbsp;</td>
						<td width="350" background="images/area.jpg" style="border-left-width: 1px; border-right: 1px solid #2D2D2D; border-top-width: 1px; border-bottom-width: 1px">
	
			<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table7" height="229">
				<tr>
					<td height="20" width="26%">
					<p align="right"><font color="#AAAAAA">標　題：&nbsp;&nbsp;&nbsp; 
					</font> </td>
					<td height="20" width="74%">
					<input name="title" type="text" id="id" size="30" maxlength="20" value="<%=objrs("title")%>"   /></td>
				</tr>
				<tr>
					<td width="26%" height="22">
					<p align="right"><font color="#AAAAAA">時　間：&nbsp;&nbsp;&nbsp; 
					</font> </td>
					<td height="22" width="74%">
					<input name="dateok" type="text" id="id0" size="15" maxlength="10" value="<%=objrs("nowdate")%>"   />&nbsp;<font color="#AAAAAA"> 
					(格式：xxxx.xx.xx)</font></td>
				</tr>
				<tr>
					<td width="26%" height="146">
					<p align="right"><font color="#AAAAAA">內　容：&nbsp;&nbsp;&nbsp; 
					</font> </td>
					<td height="146" width="74%">
													<%  content= objrs("content")
                                  content=Replace(content, "<br>" ,chr(13))%>
					<textarea name="content" cols="39" rows="10"><%=content%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
					<p align="center">
					<img border="0" src="images/editok.jpg" width="70" height="29" onclick="check()" alt="確定新增">　　<a href="<%=editcls%>"><img border="0" src="images/editcls.jpg" width="70" height="29" alt="全部清空"></a></td>
				</tr>
			</table>
						</td>
						<td width="176">&nbsp;</td>
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