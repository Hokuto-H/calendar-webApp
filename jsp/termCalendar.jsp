<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
String[] schedule = (String[]) session.getAttribute("schedule");
Calendar cal = Calendar.getInstance();
Boolean bool = (Boolean) session.getAttribute("bool");
Date startDate = (Date) session.getAttribute("startDate");
Date endDate = (Date) session.getAttribute("endDate");
cal.setTime(startDate);
int startMonth = cal.get(Calendar.MONTH) - 1;
cal.setTime(endDate);
int endMonth = cal.get(Calendar.MONTH);
Date date = new Date();
cal.setTime(date);
int year = cal.get(Calendar.YEAR);
cal.set(year, startMonth + 1, 1);
int month = cal.get(Calendar.MONTH);
%>

<html>
  <head>
    <meta charset="utf-8" />
    <title>カレンダー</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/termCalendar.css" />
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
            <%
            if (bool) {
            %>
              前期
            <%
            } else {
            %>
            後期
            <%
            }
            %>
          </caption>
          <thead>
            <tr>
              <th></th>
              <th>
                日
              </th>
              <th>
                月
              </th>
              <th>
                火
              </th>
              <th>
                水
              </th>
              <th>
                木
              </th>
              <th>
                金
              </th>
              <th>
                土
              </th>
            </tr>
          </thead>
          <tbody>
            <% String today; %>
            <%
            for (int count = cal.get(Calendar.MONTH); count <= endMonth; count++) {
                if (count == 12 && endMonth != 12) {
                    count = 0;
                }
            %>
                <%
                while(cal.get(Calendar.MONTH) == month) {
                    //*1ヶ月何週あるか取得
                    int rowspan = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
                %>
                    <tr>
                        <%
                        if (cal.get(Calendar.DAY_OF_MONTH) == 1) {
                        %>
                            <td rowspan="<%= rowspan %>"><%= cal.get(Calendar.MONTH) + 1 %></td>
                        <%
                            }
                        %>
                        <%
                            for(int i = 1;i <= 7;i++) {
                                if (cal.get(Calendar.DAY_OF_WEEK) == i) { 
                        %>
                                    <td class="cell">
                                        <p><%= cal.get(Calendar.DAY_OF_MONTH) %></p>
                                        <% for (int j = 0; j < 6; j++) {
                                            if (schedule[j + ((i - 1 ) * 6)] != null && startDate.compareTo(cal.getTime()) <= 0 && endDate.compareTo(cal.getTime()) > 0) {
                                        %>
                                                <p>授業</p>
                                                <form
                                                class="change inactive"
                                                action="../Servlet"
                                                method="GET"
                                              >
                                                <% today = String.valueOf(cal.get(Calendar.YEAR)) + "-" + String.valueOf(cal.get(Calendar.MONTH) + 1) + "-" + String.valueOf(cal.get(Calendar.DAY_OF_MONTH)); %>
                                                <input type="hidden" name="date" value="<%= today %>">
                                                <input type="hidden" name="page" value="update">
                                                <input type="hidden" name="lesson" value="All">
                                                <input type="hidden" name="change-period" value="0">
                                                <select class="form-input change-type" name="change-type">
                                                  <option value="">選択</option>
                                                  <option value="振替">振替</option>
                                                </select>
                                                <input
                                                  class="change-calendar inactive"
                                                  type="date"
                                                  name="calendar"
                                                  max="9999-12-31"
                                                  required
                                                />
                                                <input class="btn go" type="submit" value="送信" />
                                              </form>
                                        <%
                                                break;
                                            }
                                        }
                                        %>
                                    </td>
                        <%
                                    cal.add(Calendar.DAY_OF_MONTH, 1);
                                } else {
                        %>
                                    <td></td>
                        <%
                                }
                                if (cal.get(Calendar.DAY_OF_MONTH) == 1 && cal.get(Calendar.MONTH) != month){
                                    for (int j = i; j < 7; j++) {
                        %>
                                    <td></td>
                        <%
                                    }
                                    break;
                                }
                            }
                        %>
                    </tr>
            <%
                }
                month = cal.get(Calendar.MONTH);
            }
            %>
        </tbody>
    </table>
</body>
</html>