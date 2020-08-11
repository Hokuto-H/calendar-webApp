<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
String[] schedule = (String[]) session.getAttribute("schedule");
String[][] event = (String[][]) session.getAttribute("event");
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date eventDate = new java.util.Date();
java.util.Date eventDueDate = new java.util.Date();
java.util.Date compareDate = new java.util.Date();
Calendar eventWeekday = Calendar.getInstance();
Date startDate = (Date) session.getAttribute("startDate");
Date endDate = (Date) session.getAttribute("endDate");
Date date = new Date();
Calendar cal = Calendar.getInstance();
cal.setTime(date);
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
cal.set(year, month - 1, 1);
%>

<html>
  <head>
    <meta charset="utf-8" />
    <title>カレンダー</title>
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" href="./css/reset.css" />
    <link rel="stylesheet" href="./css/common.css" />
    <link rel="stylesheet" href="./css/monthCalendar.css" />
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
          <li class="nav-link"><a href="./reRegist.jsp"></a>再登録</li>
        </ul>
      </nav>
    </header>
    <main>
      <section class="calendar-container">
        <table class="calendar">
          <caption class="date">
            <%= month %>月
          </caption>
          <thead>
            <tr>
              <th class="sunday">
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
              <th class="saturday">
                土
              </th>
            </tr>
          </thead>
          <tbody>
            <% String today; %>
            <% while(cal.get(Calendar.MONTH) == month - 1) { %>
                <tr>
                    <%
                        for(int i = 1;i <= 7;i++) {
                            if (cal.get(Calendar.DAY_OF_WEEK) == i) {
                              switch (i) {
                                case 1 : {
                    %>
                                    <td class="sunday cell">
                    <%
                                break;
                                }
                                case 7 : {
                    %>
                                  <td class="saturday cell">
                    <%
                                break;
                                }
                                default : {
                    %>
                                  <td class="cell">
                    <%
                                break;
                                }
                                }
                    %>
                                    <p><%= cal.get(Calendar.DAY_OF_MONTH) %></p>
                                    <%
                                    int co = 0;
                                    int[] count = new int[5];
                                    for (int j = 0; j < 6; j++) {
                                      if (startDate.compareTo(cal.getTime()) <= 0 && endDate.compareTo(cal.getTime()) > 0) {
                                        if (schedule[j + ((i - 1) * 6)] != null && co == 0) {
                                          co++;
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
                    <input type="hidden" name="lesson" value="<%= schedule[j + ((i - 1) * 6)] %>">
                    <select class="form-input change-type" name="change-type">
                      <option value="">選択</option>
                      <option value="休講">休講</option>
                      <option value="宿題">宿題</option>
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
                    if (event[0][0] != null) {
                      for (int k = 0; k < event[0].length; k++) {
                        eventDate = dateFormat.parse(event[0][k]);
                        eventDueDate = dateFormat.parse(event[3][k]);
                        compareDate = dateFormat.parse(dateFormat.format(cal.getTime()));
                        if (eventDate.equals(compareDate) || eventDueDate.equals(compareDate)) {
                          switch(event[2][k]) {
                            case "宿題": {
                              if (eventDueDate.equals(compareDate) && count[0] == 0) {
                                count[0]++;
                    %>
                                <p>宿題</p>
                    <%
                              }
                            break;
                            }
                            case "休講": {
                              if (eventDate.equals(compareDate) && count[1] == 0) {
                                count[1]++;
                    %>
                                <p>休講</p>
                    <%
                              } else if (eventDueDate.equals(compareDate) && count[2] == 0){
                                count[2]++;
                    %>
                                  <p>補講</p>
                    <%
                              }
                            break;
                            }
                            case "試験": {
                              if (eventDueDate.equals(compareDate) && count[3] == 0) {
                                count[3]++;
                    %>
                              <p>試験</p>
                    <%
                              }
                            break;
                            }
                            case "振替": {
                              if (eventDueDate.equals(compareDate) && count[4] == 0) {
                                count[4]++;
                    %>
                                <p>振替</p>
                    <%
                              }
                            break;
                            }
                          }
                        }
                      }
                    }
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
                            if (cal.get(Calendar.DAY_OF_MONTH) == 1 && cal.get(Calendar.MONTH) != month - 1){
                    %>
                              
                    <%
                                break;
                            }
                        }
                    %>
                </tr>
            <%
            }
            %>
            </tbody>
        </table>
      </section>
    </main>
  </body>
</html>