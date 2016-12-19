<%@ Language=VBScript CodePage=65001%>

<%Session.CodePage=65001%>
<!--#include virtual="database/db_connect_string.asp"-->

<%
page=request("page")
Page=cint(Request("Page"))
If Page = 0 Then
   Page = 1
End If 

aa=session("type")
if aa = "" then 
   response.write   "<script   language='javascript'>parent.window.location='news.asp';</script>"
end if 

%>
<%
 objDBconn.Open param & ";dbq=" & Server.MapPath(mm_company_string)  
 if request("mod")="del" then
   objDBconn.Execute "delete FROM news WHERE  postid="& Cint(Request("no"))
   response.redirect "modnews.asp"
 end if
 
 sql="select * from news order by no desc"
objRs.Open sql,objDBconn,1,3 
objRS.PageSize = 5            ' 設定每頁顯示20筆      
If Not objrs.eof Then          ' 有資料才執行        
   objRS.AbsolutePage = PAGE   ' 將資料錄移至page頁     
   End if       
pagecount=objrs.pagecount 

function TrueWord(strChinese, lenMaxWord, strTail)
dim i, lenTotal, lenWord
dim strWord, bOverFlow, RetString
if strChinese = "" or vartype(strChinese) = vbNull or CLng(lenMaxWord) <= 0 then
TrueWord = ""
exit function
end if
bOverFlow = False
lenTotal = 0
strTest = " "
for i=1 to Len(strChinese)
strWord = mid(strChinese, i, 1)
ascWord = Asc(strWord)
if ascWord < 0 or ascWord > 127 then
lenTotal = lenTotal + 2
elseif ascWord = 63 And strWord <> "?" then
lenTotal = lenTotal + 2
elseif ascWord = 44 And strWord <> "," then
lenTotal = lenTotal + 2
elseif ascWord = 33 And strWord <> "!" then
lenTotal = lenTotal + 2
else
lenTotal = lenTotal + 1
end if
next
if lenTotal > lenMaxWord then bOverFlow = True
if bOverFlow = True then
lenWord = 0
RetString = ""
for i=1 to Len(strChinese)
strWord = mid(strChinese, i, 1)
ascWord = Asc(strWord)
if ascWord < 0 or ascWord > 127 then
lenWord = lenWord + 2
elseif ascWord = 63 And strWord <> "?" then
lenWord = lenWord + 2
elseif ascWord = 44 And strWord <> "," then
lenWord = lenWord + 2
elseif ascWord = 33 And strWord <> "!" then
lenWord = lenWord + 2
else
lenWord = lenWord + 1
end if
if lenWord <= (lenMaxWord - Len(strTail)) then
RetString = RetString + strWord
else
TrueWord = RetString + strTail
exit for
end if
next
else
TrueWord = strChinese
end if
end function
wordstrlen=30       
wordstrlen2=15 
  
%>   

 <html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title> 管理消息 </title>
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
function del(no) {
 var r=confirm("確定要刪除這筆消息嗎?")
 if (r==true) {
    var x=document.getElementById('postform');
    x.action='modnews.asp?mod=del&no='+no;
    x.submit();}
	}
 function edit(no,page) {
    var x=document.getElementById('postform');
    x.action='editnews.asp?no='+no+'&page='+page;
    x.submit();
	}	
</script>


</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<table border="0" width="709" height="420" id="table1" cellspacing="0" cellpadding="0" background="images/newsbk.jpg">

<%  if request("add") = "ok" then 
		Response.write "<script language=javascript>alert(' 新增消息成功 ');</script>"
    end if		
%>
<%  if request("edit") = "ok" then 
		Response.write "<script language=javascript>alert(' 修改消息成功 ');</script>"
    end if		
%>
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
							<form action="" name="postform" method="POST" >		
				<table border="0" width="709" cellspacing="0" cellpadding="0" id="table4" height="100%">
					<tr>
						<td height="25" width="709">
						<p align="center"><font color="#6699CC">目前位置：管理消息</font></td>
					</tr>
					<tr>
						<td width="693" valign="top">
						<table border="0" width="693" cellspacing="0" cellpadding="0" id="table7" height="108">
							<tr>
								<td height="28" width="13" align="center">　　</td>
								<td height="28" width="171" align="center" style="border-bottom:1px solid #666666; padding:1px; border-left-width:1px; border-right-width:1px; border-top-width:1px" colspan="2">
								<font color="#6699CC">標　題</font></td>
								<td height="28" width="101" align="center" style="border-bottom:1px solid #666666; padding:1px; border-left-width:1px; border-right-width:1px; border-top-width:1px">
								<font color="#6699CC">發表日期</font></td>
								<td height="28" width="242" align="center" style="border-bottom:1px solid #666666; padding:1px; border-left-width:1px; border-right-width:1px; border-top-width:1px">
								<font color="#6699CC">內　容</font></td>
								<td height="28" align="center" width="159" style="border-bottom:1px solid #666666; padding:1px; border-left-width:1px; border-right-width:1px; border-top-width:1px">
								<font color="#6699CC">管　理</font></td>
							</tr>
<%  if objrs.eof then %>						
							<tr>
								<td height="28" width="686" align="center" colspan="6">
								<font color="#CC3300">目前無任何消息</font></td>
							</tr>
<%end if%>							
<%  if not objrs.eof then
I=1
do until objrs.EOF or i>objRS.PageSize
%>								
							<tr>
								<td width="13">&nbsp;</td>
								<td width="10" style="border-bottom: 1px dotted #666666; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<p align="left">&nbsp;</td>
								<td width="148" style="border-bottom: 1px dotted #666666; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<font color="#AAAAAA"><%=TrueWord(objrs("title"),wordstrlen2,"...") & "</A>"%></font></td>
								<td width="95" style="border-bottom: 1px dotted #666666; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<p align="center"><font color="#AAAAAA"><%=objrs("nowdate")%></font></td>
								<td width="236" style="border-bottom: 1px dotted #666666; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<%  content= objrs("content")
                                  content=Replace(content, "<br>" ,chr(10)&chr(13))
                                  content=Replace(content, "<br>",chr(13)) %>
								<p align="left"><font color="#AAAAAA"><%=TrueWord(content,wordstrlen,"...") & "</A>"%></font></td>
								<td width="153" style="border-bottom: 1px dotted #666666; padding-left: 4px; padding-right: 4px; padding-top: 1px; padding-bottom: 1px">
								<img border="0" src="images/mod.jpg" width="25" height="25" alt="編輯消息" onclick="edit('<%=objrs("postid")%>','<%=page%>')" ><font color="#868686">編輯</font>　 <img border="0" src="images/delete.jpg" width="25" height="25" alt="刪除資料" onclick="del('<%=objrs("postid")%>')"><font color="#868686">刪除</font></td>
							</tr>
<%
     objrs.movenext
        I=I+1
     loop

%>							
						</table>
						&nbsp;</br>
						<div align="right">
							<div style="position: absolute; width: 705px; height: 19px; z-index: 1; left: 0px; top: 396px" id="layer1">
									<p align="center">
			
				<img border="0" src="images/line2.jpg" width="60" height="2">				
 <% If cint(Page) <> 1 then %>	
 				<a href="modnews.asp?page=<%=cint(Page)-1%>"><font color="#868686">
				上一頁</font></a>&nbsp;
<%else%>
<font color="#868686">上一頁</font>&nbsp;			 
<%end if%>
<%            
           
for j=1 to pagecount            
   IF J <> page THEN            
     response.write " <a href=modnews.asp?page=" & j & "><font size=2 color=#868686>" & j & "</font></a> "            
   Else            
     response.write " " & j & " "            
   End If            
next            
            
%>&nbsp;
 <% If cint(Page) <> pagecount then %>	
<a href="modnews.asp?page=<%=cint(Page)+1%>"><font color="#868686">下一頁</font></a>									
<%else%>
<font color="#868686">下一頁</font><%end if%>	
								
									<img border="0" src="images/line3.jpg" width="23" height="2"></div>
<%   end if
     objrs.close         
     objDBconn.close%>							
						</div>
					
						
						
						
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