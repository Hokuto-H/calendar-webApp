package model;
import java.lang.*;

public class Schedule {
    // *6限×7日の42個の要素
    private String schedule[] = new String[42];

    public void setSchedule(String weekday[], String time[], String subjects[]) {
        // * 曜日を代入
        /*
         * 月曜日の1限～6限を配列の0～5に代入 火曜日の1限～6限を配列の6～11に代入 水曜日の1限～6限を配列の12～17に代入
         * 木曜日の1限～6限を配列の18～23に代入 金曜日の1限～6限を配列の24～29に代入 土曜日の1限～6限を配列の30～35に代入
         * 日曜日の1限～6限を配列の36～41に代入
         */
        for (int i = 0; i < weekday.length; i++) {
            switch (weekday[i]) {
                case "月":
                    this.schedule[Integer.parseInt(time[i]) - 1] = subjects[i];
                    break;
                case "火":
                    this.schedule[Integer.parseInt(time[i]) - 1 + 6] = subjects[i];
                    break;
                case "水":
                    this.schedule[Integer.parseInt(time[i]) - 1 + 12] = subjects[i];
                    break;
                case "木":
                    this.schedule[Integer.parseInt(time[i]) - 1 + 18] = subjects[i];
                    break;
                case "金":
                    this.schedule[Integer.parseInt(time[i]) - 1 + 24] = subjects[i];
                    break;
                case "土":
                    this.schedule[Integer.parseInt(time[i]) - 1 + 30] = subjects[i];
                    break;
                case "日":
                    this.schedule[Integer.parseInt(time[i]) - 1 + 36] = subjects[i];
                    break;
                default:
                    break;
            }
        }
    }

    public String[] getSchedule() {
        return this.schedule;
    }
}