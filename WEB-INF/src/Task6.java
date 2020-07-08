import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import model.Schedule;

public class Task6 extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=UTF-8");
        //*name毎のリクエストパラメータ全取得
        String[] x = request.getParameterValues("previousterm-lesson-weekday");
        String[] y = request.getParameterValues("previousterm-lesson-time");
        String[] z = request.getParameterValues("previousterm-lesson-subjects");
        Schedule schedule = new Schedule();
        schedule.setSchedule(x, y, z);
        //*リクエストスコープに保存
        request.setAttribute("schedule", schedule);
        //*フォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/task6.jsp");
        dispatcher.forward(request, response);
    }
}