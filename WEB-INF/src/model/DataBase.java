package model;

import java.sql.*;
import javax.naming.*;
import java.text.*;
import java.util.*;

public class DataBase {
    private Connection db = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private void sqlConnect() {
        try {
            this.db = DriverManager.getConnection(
                    "jdbc:mysql://localhost/db_u306161?useUnicode=true&characterEncoding=utf8", "u306161", "p306161");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public void setAccount(String id, String password) {
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement("INSERT INTO user (id, password) VALUES(?, ?)");
            this.ps.setString(1, id);
            this.ps.setString(2, password);
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public void setEvent(String id, String date, String lesson, String changeType, String calendar,
            String changePeriod) {
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement(
                    "INSERT INTO event (id, date, lesson, changeType, dueDate, period) VALUES(?, ?, ?, ?, ?, ?)");
            this.ps.setString(1, id);
            this.ps.setDate(2, java.sql.Date.valueOf(date));
            this.ps.setString(3, lesson);
            this.ps.setString(4, changeType);
            if (changeType == "宿題") {
                this.ps.setDate(5, java.sql.Date.valueOf(date));
            } else {
                this.ps.setDate(5, java.sql.Date.valueOf(calendar));
            }
            this.ps.setString(6, changePeriod);
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public void setPreviousSchedule(String id, String[] date, String[] schedule) {
        int i = 0;
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement(
                    "INSERT INTO previousSchedule VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            this.ps.setString(1, id);
            this.ps.setDate(2, java.sql.Date.valueOf(date[0]));
            this.ps.setDate(3, java.sql.Date.valueOf(date[1]));
            while (i < 42) {
                this.ps.setString(i + 4, schedule[i]);
                i++;
            }
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public void setRePreviousSchedule(String id, String[] date, String[] schedule) {
        int i = 0;
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement(
                "UPDATE previousSchedule SET startDate = ?, endDate = ?, `0` = ?, `1` = ?, `2` = ?, `3` = ?, `4` = ?, `5` = ?, `6` = ?, `7` = ?, `8` = ?, `9` = ?, `10` = ?, `11` = ?, `12` = ?, `13` = ?, `14` = ?, `15` = ?, `16` = ?, `17` = ?, `18` = ?, `19` = ?, `20` = ?, `21` = ?, `22` = ?, `23` = ?, `24` = ?, `25` = ?, `26` = ?, `27` = ?, `28` = ?, `29` = ?, `30` = ?, `31` = ?, `32` = ?, `33` = ?, `34` = ?, `35` = ?, `36` = ?, `37` = ?, `38` = ?, `39` = ?, `40` = ?, `41` = ? WHERE id = ?");
            this.ps.setDate(1, java.sql.Date.valueOf(date[0]));
            this.ps.setDate(2, java.sql.Date.valueOf(date[1]));
            while (i < 42) {
                this.ps.setString(i + 3, schedule[i]);
                i++;
            }
            this.ps.setString(45, id);
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public void setAfterSchedule(String id, String[] date, String[] schedule) {
        int i = 0;
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement(
                    "INSERT INTO afterSchedule VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            this.ps.setString(1, id);
            this.ps.setDate(2, java.sql.Date.valueOf(date[2]));
            this.ps.setDate(3, java.sql.Date.valueOf(date[3]));
            while (i < 42) {
                this.ps.setString(i + 4, schedule[i]);
                i++;
            }
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public void setReAfterSchedule(String id, String[] date, String[] schedule) {
        int i = 0;
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement(
                    "UPDATE afterSchedule SET startDate = ?, endDate = ?, `0` = ?, `1` = ?, `2` = ?, `3` = ?, `4` = ?, `5` = ?, `6` = ?, `7` = ?, `8` = ?, `9` = ?, `10` = ?, `11` = ?, `12` = ?, `13` = ?, `14` = ?, `15` = ?, `16` = ?, `17` = ?, `18` = ?, `19` = ?, `20` = ?, `21` = ?, `22` = ?, `23` = ?, `24` = ?, `25` = ?, `26` = ?, `27` = ?, `28` = ?, `29` = ?, `30` = ?, `31` = ?, `32` = ?, `33` = ?, `34` = ?, `35` = ?, `36` = ?, `37` = ?, `38` = ?, `39` = ?, `40` = ?, `41` = ? WHERE id = ?");
            this.ps.setDate(1, java.sql.Date.valueOf(date[2]));
            this.ps.setDate(2, java.sql.Date.valueOf(date[3]));
            while (i < 42) {
                this.ps.setString(i + 3, schedule[i]);
                i++;
            }
            this.ps.setString(45, id);
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public String[][] getEvent(String id) {
        String[][] dummy = new String[2][2];
        List<String> date = new ArrayList<String>();
        List<String> lesson = new ArrayList<String>();
        List<String> changeType = new ArrayList<String>();
        List<String> calendar = new ArrayList<String>();
        List<String> changePeriod = new ArrayList<String>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement("SELECT * FROM event WHERE id = ?");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                date.add(dateFormat.format(this.rs.getDate(3)));
                lesson.add(this.rs.getString(4));
                changeType.add(this.rs.getString(5));
                calendar.add(dateFormat.format(this.rs.getDate(6)));
                changePeriod.add(this.rs.getString(7));
            }
            if (date.size() == 0) {
                return dummy;
            }
            String[][] event = new String[5][date.size()];
            event[0] = date.toArray(new String[date.size()]);
            event[1] = lesson.toArray(new String[lesson.size()]);
            event[2] = changeType.toArray(new String[changeType.size()]);
            event[3] = calendar.toArray(new String[calendar.size()]);
            event[4] = changePeriod.toArray(new String[changePeriod.size()]);
            return event;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
        return dummy;
    }

    public String[] getSchedule(String id, Boolean bool) {
        String[] schedule = new String[42];
        try {
            this.sqlConnect();
            // *前期ならtrue,後期ならfalse
            if (bool) {
                this.ps = this.db.prepareStatement("SELECT * FROM previousSchedule WHERE id = ?");
            } else {
                this.ps = this.db.prepareStatement("SELECT * FROM afterSchedule WHERE id = ?");
            }
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                for (int i = 0; i < 42; i++) {
                    schedule[i] = this.rs.getString(i + 4);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
        return schedule;
    }

    public java.util.Date[] getTermPeriod(String id, Boolean bool) {
        java.util.Date[] termPeriod = new java.util.Date[2];
        try {
            this.sqlConnect();
            // *前期ならtrue,後期ならfalse
            if (bool) {
                this.ps = this.db.prepareStatement("SELECT * FROM previousSchedule WHERE id = ?");
            } else {
                this.ps = this.db.prepareStatement("SELECT * FROM afterSchedule WHERE id = ?");
            }
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            this.rs.next();
            termPeriod[0] = this.rs.getDate(2);
            termPeriod[1] = this.rs.getDate(3);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
        return termPeriod;
    }

    public void deleteEvent(String id) {
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement("DELETE FROM event WHERE id = ?");
            this.ps.setString(1, id);
            this.ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
    }

    public Boolean termCheck(String id) {
        // *前期なら戻り値true、後期なら戻り値false
        java.util.Date date = new java.util.Date();
        try {
            this.sqlConnect();
            // *前期の開始日取得
            this.ps = this.db.prepareStatement("SELECT * FROM previousSchedule WHERE id = ?");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            this.rs.next();
            java.util.Date date1 = this.rs.getDate(2);
            // *後期の開始日取得
            this.ps = this.db.prepareStatement("SELECT * FROM afterSchedule WHERE id = ?");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            this.rs.next();
            java.util.Date date2 = this.rs.getDate(2);
            // *今日が開始日より後で終了日より前になる条件
            if (date1.compareTo(date) <= 0 && date2.compareTo(date) > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
        return false;
    }

    public Boolean loginCheck(String id, String password) {
        try {
            this.sqlConnect();
            // *id検索
            this.ps = this.db.prepareStatement("SELECT id FROM user WHERE id = ?");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            if (this.rs.next() != false) {
                // *password検索
                this.ps = this.db.prepareStatement("SELECT password FROM user WHERE password = ?");
                this.ps.setString(1, password);
                this.rs = this.ps.executeQuery();
            }
            if (this.rs.next() != false) {
                // *成功
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
        // *失敗
        return false;
    }

    public Boolean idCheck(String id) {
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement("SELECT id FROM user WHERE id = ?");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            if (this.rs.next() == false) {
                // *成功
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                this.db.close();
            } catch (Exception er) {
                er.printStackTrace();
            }
        }
        // *失敗
        return false;
    }
}