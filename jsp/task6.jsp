<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Schedule" %>
<%
Schedule schedule = (Schedule) request.getAttribute("schedule");
String[] sche = schedule.getSchedule();
String weekday[] = {"月","火","水","木","金","土","日"};
%>

<html>
    <head>
        <title>課題6</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                  <th></th>
                  <th>
                    <p>1</p>
                    <p>9:00 ～</p>
                  </th>
                  <th>
                    <p>2</p>
                    <p>10:40 ～</p>
                  </th>
                  <th>
                    <p>3</p>
                    <p>13:00 ～</p>
                  </th>
                  <th>
                    <p>4</p>
                    <p>14:40 ～</p>
                  </th>
                  <th>
                    <p>5</p>
                    <p>16:20 ～</p>
                  </th>
                  <th>
                    <p>6</p>
                    <p>18:00 ～</p>
                  </th>
                  <th>
                    <p>放課後</p>
                  </th>
                </tr>
              </thead>
              <tbody>
                  <%
                  for (int i = 0; i < 7; i++) {
                  %>
                    <tr>
                        <th><%= weekday[i] %></th>
                        <%
                        for (int j = 0; j < 6; j++) {
                            if (sche[j + (i * 6)] != null) {
                        %>
                        <td><%= sche[j + (i * 6)] %></td>
                        <%
                            }else {
                        %>
                        <td></td>
                        <%
                            }
                        }
                        %>
                    </tr>
                  <%
                  }
                  %>
              </tbody>
        </table>
    </body>
</html>