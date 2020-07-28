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
                    session.setAttribute("schedule", db.getSchedule(id));
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
                // *name毎のリクエストパラメータ全取得
                String[] x = request.getParameterValues("previousterm-lesson-weekday");
                String[] y = request.getParameterValues("previousterm-lesson-time");
                String[] z = request.getParameterValues("previousterm-lesson-subjects");
                schedule.setSchedule(x, y, z);
                db.setSchedule(id, schedule.getSchedule());
                // *セッション新規作成
                HttpSession session = request.getSession(true);
                // *フォワード(ログイン成功)、セッション設定
                session.setAttribute("id", id);
                session.setAttribute("schedule", db.getSchedule(id));
                // *フォワードだとurl変更できない為リダイレクト
                response.sendRedirect("./jsp/dayCalendar.jsp");
                break;
            }
            case "update": {
                // *セッション取得ないならnull
                HttpSession session = request.getSession(false);
                String id = (String) session.getAttribute("id");
                // *ここでsqlとかいろいろやってスケジュール更新
                session.setAttribute("schedule", db.getSchedule(id));
                break;
            }
            default:
                break;
        }
    }
}