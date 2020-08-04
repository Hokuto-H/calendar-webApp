<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
String[] schedule = (String[]) session.getAttribute("schedule");
Date startDate = (Date) session.getAttribute("startDate");
Date endDate = (Date) session.getAttribute("endDate");
String weekday[] = {"日","月","火","水","木","金","土"};
Date date = new Date();
Calendar cal = Calendar.getInstance();
cal.setTime(date);
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>カレンダー</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/weekCalendar.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./src/script.js"></script>
  </head>
  <body>
    <header>
      <nav class="nav-header">
        <p class="nav-title"><a href="../index.html"></a>カレンダー</p>
        <ul class="nav-list">
          <li class="nav-link"><a href="./dayCalendar.jsp"></a>校時単位</li>
          <li class="nav-link"><a href="./weekCalendar.jsp"></a>週単位</li>
          <li class="nav-link"><a href="./monthCalendar.jsp"></a>月単位</li>
          <li class="nav-link"><a href="./termCalendar.jsp"></a>学期単位</li>
        </ul>
      </nav>
    </header>
    <main>
        <section class="calendar-container">
            <table class="calendar">
              <caption class="date">
                <%= cal.get(Calendar.MONTH) + 1 %>/<%= cal.get(Calendar.DAY_OF_MONTH) %> ～ <% cal.add(Calendar.DAY_OF_MONTH, 7); %> <%= cal.get(Calendar.MONTH) + 1 %>/<%= cal.get(Calendar.DAY_OF_MONTH) %>
              </caption>
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
              <input type="hidden" name="page" value="update">
              <% String today; %>
                <%
                  for (int i = 0; i < 7; i++) {
                  %>
                  <tr>
                    <th><%= weekday[i] %></th>
                    <%
                    for (int j = 0; j < 6; j++) {
                    %>
                    <td class="cell">
                    <%
                        if (schedule[j + (i * 6)] != null && startDate.compareTo(cal.getTime()) <= 0 && endDate.compareTo(cal.getTime()) > 0) {
                    %>
                    <%= schedule[j + (i * 6)] %>
                    <form
                  class="change inactive"
                  action="./weekCalendarSuccess.html"
                  method="post"
                >
                <% today = String.valueOf(cal.get(Calendar.YEAR)) + "-" + String.valueOf(cal.get(Calendar.MONTH) + 1) + "-" + String.valueOf(cal.get(Calendar.DAY_OF_MONTH)); %>
                <input type="hidden" name="date" value="<%= today %>">
                  <select class="form-input change-type" name="change-type">
                    <option value="">選択</option>
                    <option value="休講">休講</option>
                    <option value="宿題">宿題</option>
                    <option value="振替">振替</option>
                    <option value="試験">試験</option>
                  </select>
                  <input
                    class="change-calendar inactive"
                    type="date"
                    name="calendar"
                    max="9999-12-31"
                    required
                  />
                  <select class="form-input change-period inactive" name="change-period" required>
                    <option value="">時限</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                  </select>
                  <input class="btn go" type="submit" value="送信" />
                </form>
                    <%
                        }
                    }
                    %>
                    </td>
                    <td></td>
                  </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </body>
</html>