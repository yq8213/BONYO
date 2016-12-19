<%@ Language=VBScript CodePage=65001%>

<%Session.CodePage=65001%>
<!--#include virtual="database/db_connect_string.asp"-->

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
<title> 完整消息 </title>
<LINK href="word.css" type=text/css rel=stylesheet>
<style type="text/css">
.font{
letter-spacing : 1pt;/*字間距離*/
line-height : 150%; /*設定行高*/


}
input
{
background:transparent; 
color: #C49A82;
border: 1px solid #7E7E7E;
}

textarea
{
background:transparent; 
color: #C49A82;
border: 1px solid #7E7E7E;
}
A:link {
	COLOR: #AAAAAA; TEXT-DECORATION: none
}
A:visited {
	COLOR: #AAAAAA; TEXT-DECORATION: none
}
}
A:hover {
	COLOR: #C2D896; TEXT-DECORATION: underline
}
</style> 


</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">

<table border="0" width="709" height="420" id="table1" cellspacing="0" cellpadding="0" background="images/newsbk1.jpg">
	<tr>
		<td>
		<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table2" height="420">
			<tr>
				<td>
							<div style="position: absolute; width: 705px; height: 19px; z-index: 1; left: 0px; top: 393px" id="layer1">
									<p align="right">
			
				<font color="#AAAAAA">
				<a href="newshow.asp?page=<%=request("page")%>">回主題列表</a> </font><img border="0" src="images/line2.jpg" width="60" height="2">				
							<div style="position: absolute; width: 677px; height: 19px; z-index: 1; left: 25px; top: -358px; bottom:35" id="layer2">
									<font color="#9D1406"><%=objrs("nowdate")%></font>&nbsp;&nbsp;&nbsp;<font color="#AAAAAA"><%=objrs("title")%></font>&nbsp;&nbsp;
									
									<%if request("image")<>0 then%>
									<img src="images/new.jpg">
									<%end if%>
									</div>
							<div style="position: absolute; width: 496px; height: 19px; z-index: 1; left: 99px; top: -308px; bottom:35" id="layer3">
									<span class="font"><font color="#AAAAAA"><%=objrs("content")%></font></span>
									</tr>
		</table>
		</td>
	</tr>
</table>


</body>

</html>