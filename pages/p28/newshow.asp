<%@ Language=VBScript CodePage=65001%>

<%Session.CodePage=65001%>
<!--#include virtual="database/db_connect_string.asp"-->

<%
page=request("page")
Page=cint(Request("Page"))
If Page = 0 Then
   Page = 1
End If 
newimage=0
%>
<%
 objDBconn.Open param & ";dbq=" & Server.MapPath(mm_company_string)  
 sql="select * from news order by no desc"
objRs.Open sql,objDBconn,1,3 
objRS.PageSize = 3            ' 設定每頁顯示20筆      
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
wordstrlen=40       
wordstrlen2=15 
  
%>   

 <html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
<title> 最新消息 </title>
<LINK href="word.css" type=text/css rel=stylesheet>
<style type="text/css">
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
	COLOR: #888888; TEXT-DECORATION: none
}
A:visited {
	COLOR: #888888; TEXT-DECORATION: none
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
				<td height="137">
				<table border="0" width="100%" cellspacing="0" cellpadding="0" id="table3">
					<tr>
						<td width="261" height="137" background="images/newsindex.jpg">&nbsp;</td>
						<td>&nbsp;<p>&nbsp;</p>
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
						<td height="3" width="709">
						&nbsp;</td>
					</tr>
					<tr>
						<td width="693" valign="top">
						<table border="0" width="709" cellspacing="0" cellpadding="0" id="table7" height="73">
<%  if objrs.eof then %>						
							<tr>
								<td height="28" width="709" align="center">
								<font color="#CC3300">目前無任何消息</font></td>
							</tr>
<%end if%>							
<%  if not objrs.eof then
I=1
do until objrs.EOF or i>objRS.PageSize
%>								
							<tr>
								<td width="668">
								<table border="0" width="708" cellspacing="0" cellpadding="0" id="table8" height="69">
									<!-- MSTableType="nolayout" -->
									<tr>
										<td></td>
										<td height="14" valign="top" width="91">
										<p align="left"><font color="#9D1406"><%=objrs("nowdate")%><img border="0" src="images/notnew.jpg" width="18" height="20"></td>
										<td height="14" valign="top" width="504" >
										
										<font color="#CCCCCC"><%=objrs("title")%>&nbsp; </font> 
										<% If cint(Page) = 1 then 
										newimage=1
										%>
										<img border="0" src="images/new.jpg" width="24" height="20">
										<%else
										newimage=0
										%>
										<img border="0" src="images/notnew.jpg" width="24" height="20">
										<%end if%>
										</td>
									</tr>
									<tr>
										<td width="113">&nbsp;</td>
										<td height="33" width="595" colspan="2">
								<%  content= objrs("content")
                                  content=Replace(content, "<br>" ,chr(10)&chr(13))
                                  content=Replace(content, "<br>",chr(13)) %>
										<font color="#888888"><a href ="showcontent.asp?no=<%=objrs("postid")%>&page=<%=page%>&image=<%=newimage%>"><%=TrueWord(content,wordstrlen,"...") & "</A>"%></font></td>
									</tr>
									<tr>
										<td width="708" colspan="3">
										<table border="0" width="708" id="table9" cellspacing="0" cellpadding="0">
											<!-- MSTableType="nolayout" -->
											<tr>
												<td width="113">&nbsp;</td>
												<td width="482">
												<img border="0" src="images/line4.jpg" width="482" height="8"></td>
												<td width="113">&nbsp;</td>
											</tr>
										</table>
										</td>
									</tr>
								</table>
								</td>
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
									<p align="right">
			
				<img border="0" src="images/line2.jpg" width="60" height="2">				
 <% If cint(Page) <> 1 then %>	
 				<a href="newshow.asp?page=<%=cint(Page)-1%>"><font color="#868686">
				上一頁</font></a>&nbsp;
<%else%>
<font color="#868686">上一頁</font>&nbsp;			 
<%end if%>
<%            
           
for j=1 to pagecount            
   IF J <> page THEN            
     response.write " <a href=newshow.asp?page=" & j & "><font size=2 color=#868686>" & j & "</font></a> "            
   Else            
     response.write " " & j & " "            
   End If            
next            
            
%>&nbsp;
 <% If cint(Page) <> pagecount then %>	
<a href="newshow.asp?page=<%=cint(Page)+1%>"><font color="#868686">下一頁</font></a>									
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