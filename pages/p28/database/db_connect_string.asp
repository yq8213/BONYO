<%
mm_company_string = "database/database.mdb"
param = "driver={Microsoft Access Driver (*.mdb)}"
Set objDBconn = Server.CreateObject("ADODB.Connection")
Set objRs = Server.CreateObject("ADODB.Recordset")
%>
