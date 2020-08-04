import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.*;

public class Servlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DataBase db = new DataBase();
        Schedule schedule = new Schedule();

        // *ajax通信、idバリデーション
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            String data = request.getParameter("data");
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            if (db.idCheck(data)) {
                response.getWriter().print("true");
            } else {
                response.getWriter().print("false");
            }
            response.getWriter().close();
        }

        switch (request.getParameter("page")) {
            case "login": {
                // *id・passのリクエストパラメータ取得
                String id = request.getParameter("id");
                String password = request.getParameter("password");
                // *セッション新規作成
                HttpSession session = request.getSession(true);
                if (db.loginCheck(id, password)) {
                    // *フォワード(ログイン成功)、セッション設定
                    session.setAttribute("id", id);
                    Date[] termPeriod = db.getTermPeriod(id, db.termCheck(id));
                    session.setAttribute("startDate", termPeriod[0]);
                    session.setAttribute("endDate", termPeriod[1]);
                    session.setAttribute("schedule", db.getSchedule(id, db.termCheck(id)));
                    // *フォワードだとurl変更できない為リダイレクト
                    response.sendRedirect("./jsp/dayCalendar.jsp");
                } else {
                    // *フォワード(ログイン失敗)、セッション破棄
                    session.invalidate();
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/loginFailed.html");
                    dispatcher.forward(request, response);
                }
                break;
            }
            case "regist": {
                // *id・passのリクエストパラメータ取得
                String id = request.getParameter("id");
                String password = request.getParameter("password");
                // * アカウント登録
                db.setAccount(id, password);
                // *スケジュール配列初期化
                String[] x = new String[42];
                String[] y = new String[42];
                String[] z = new String[42];
                String[] date = new String[8];
                // *前期と後期の日付取得
                date[0] = request.getParameter("previousterm-start-month");
                date[1] = request.getParameter("previousterm-start-day");
                date[2] = request.getParameter("previousterm-end-month");
                date[3] = request.getParameter("previousterm-end-day");
                date[4] = request.getParameter("afterterm-start-month");
                date[5] = request.getParameter("afterterm-start-day");
                date[6] = request.getParameter("afterterm-end-month");
                date[7] = request.getParameter("afterterm-end-day");
                schedule.setDate(date);
                // *前期のスケジュール
                x = request.getParameterValues("previousterm-lesson-weekday");
                y = request.getParameterValues("previousterm-lesson-time");
                z = request.getParameterValues("previousterm-lesson-subjects");
                schedule.setSchedule(x, y, z);
                db.setPreviousSchedule(id, schedule.getDate(), schedule.getSchedule());
                // *後期のスケジュール
                x = request.getParameterValues("afterterm-lesson-weekday");
                y = request.getParameterValues("afterterm-lesson-time");
                z = request.getParameterValues("afterterm-lesson-subjects");
                schedule.setSchedule(x, y, z);
                db.setAfterSchedule(id, schedule.getDate(), schedule.getSchedule());
                // *セッション新規作成
                HttpSession session = request.getSession(true);
                // *フォワード(ログイン成功)、セッション設定
                session.setAttribute("id", id);
                Date[] termPeriod = db.getTermPeriod(id, db.termCheck(id));
                session.setAttribute("startDate", termPeriod[0]);
                session.setAttribute("endDate", termPeriod[1]);
                session.setAttribute("schedule", db.getSchedule(id, db.termCheck(id)));
                // *フォワードだとurl変更できない為リダイレクト
                response.sendRedirect("./jsp/dayCalendar.jsp");
                break;
            }
            case "update": {
                // *セッション取得ないならnull
                HttpSession session = request.getSession(false);
                String id = (String) session.getAttribute("id");
                // *ここでsqlとかいろいろやってスケジュール更新
                //session.setAttribute("schedule", db.getSchedule(id, db.termCheck(id)));
                break;
            }
            default:
                break;
        }
    }
}