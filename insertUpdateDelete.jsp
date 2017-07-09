<%@ page import = "java.sql.*" %>
<% Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.0.109:1521:orcl","hrd","hrd");
String dml_type = request.getParameter("dmlType");
String emp_code = request.getParameter("empCode");
String emp_name = request.getParameter("empName");
String sql="";
if("Ins".equals(dml_type))
  sql = "insert into emp values(" + emp_code + ",'" + emp_name + "')";
else if("Del".equals(dml_type))
  sql = "delete from emp where emp_code = " + emp_code + " and emp_name = '" + emp_name + "'";
else if("Upd".equals(dml_type))
  sql = "update emp set emp_name = '" + emp_name + "' where emp_code = " + emp_code;
try
{
 Statement stmt = con.createStatement();
 stmt.executeQuery(sql);
}
catch(SQLException e)
{
 //e.printStackTrace();
   out.print("SQL Error encountered " + dml_type  + "," + e.getMessage());
}
con.close();
con=null;
%>