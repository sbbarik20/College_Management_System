<!-- ${name}
${id} -->


<%@page import="java.util.*"%>
<%
    String name =(String) request.getAttribute("name");
    Integer id=(Integer)   request.getAttribute("id");
%>

<hr>
Name is : <%=name %> <br/>
id  is :<%=id %> <br/>
<% 
  List<String> list=(ArrayList<String>)request.getAttribute("f");
  for(String s:list)
    out.println(s+"<br>");
%></br>