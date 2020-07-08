<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
String year = request.getParameter("year"); 
String month = request.getParameter("month");
%>
<%!
private boolean check(String year, String month) {
    try {
        Integer.parseInt(year);
        Integer.parseInt(month);
        return true;
    }catch (NumberFormatException e){
        return false;
    }
}
%>

<!DOCTYPE html>
<html>
  <head>
    <title>初めてのjsp</title>
    <meta charset="utf-8" />
    <style type="text/css"></style>
  </head>
  <body>
    <%
    Calendar cal = Calendar.getInstance();
    if (check(year, month) == false){
    %>
        <section>
            年月の指定に誤りがあります 
        </section>
    <%
    }else {
    int intYear = Integer.parseInt(year);
    int intMonth = Integer.parseInt(month);
    cal.set(intYear, intMonth - 1, 1);
    %>
    <section>
        <p><%= intYear %>年<%= intMonth %>月</p>
        <table>
            <tr>
                <th>日</th>
                <th>月</th>
                <th>火</th>
                <th>水</th>
                <th>木</th>
                <th>金</th>
                <th>土</th>
            </tr>
            <% while(cal.get(Calendar.MONTH) == intMonth - 1) { %>
            <tr>
                <%
                    for(int i = 1;i <= 7;i++) {
                        if (cal.get(Calendar.DAY_OF_WEEK) == i) { 
                %>
                            <td><%= cal.get(Calendar.DAY_OF_MONTH) %></td>
                <%
                            cal.add(Calendar.DAY_OF_MONTH, 1);
                        } else {
                %>
                            <td></td>
                <%
                        }
                    if (cal.get(Calendar.DAY_OF_MONTH) == 1 && cal.get(Calendar.MONTH) != intMonth - 1){
                        break;
                    }
                    }
                %>
            </tr>
            <%  } %>
        </table>

    </section>
    <%}%>
  </body>
</html>
