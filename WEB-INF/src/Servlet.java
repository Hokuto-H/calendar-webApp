import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.*;

public class Servlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        DataBase db = new DataBase();
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

        // *id・passのリクエストパラメータ取得
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        switch (request.getParameter("page")) {
            case "login":
                // *セッション新規作成
                HttpSession session = request.getSession(true);
                if (db.loginCheck(id, password)) {
                    // *フォワード(ログイン成功)、セッション設定
                    session.setAttribute("id", id);
                    //RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/dayCalendar.jsp");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/cal/dayCalendar.html");
                    dispatcher.forward(request, response);
                } else {
                    // *フォワード(ログイン失敗)、セッション破棄
                    session.invalidate();
                    //RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/loginFailed.jsp");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/cal/loginFailed.html");
                    dispatcher.forward(request, response);
                }
                break;
            case "regist":
                // * アカウント登録
                db.setAccount(id, password);
                // *name毎のリクエストパラメータ全取得
                String[] x = request.getParameterValues("previousterm-lesson-weekday");
                String[] y = request.getParameterValues("previousterm-lesson-time");
                String[] z = request.getParameterValues("previousterm-lesson-subjects");
                Schedule schedule = new Schedule();
                schedule.setSchedule(x, y, z);
                db.setSchedule(id, schedule.getSchedule());
                // *リクエストスコープに保存
                request.setAttribute("schedule", db.getSchedule(id));
                // *フォワード
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/task6.jsp");
                dispatcher.forward(request, response);
                break;
        }
    }
}