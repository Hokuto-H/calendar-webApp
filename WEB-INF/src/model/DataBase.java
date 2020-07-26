package model;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;
import java.text.*;

public class DataBase {
    private Connection db = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    private void sqlConnect() {
        try {
            this.db = DriverManager.getConnection("jdbc:mysql://localhost/db_u306161?useUnicode=true&characterEncoding=utf8", "u306161", "p306161");
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

    public void setSchedule(String id, String[] schedule) {
        int i = 0;
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement(
                    "INSERT INTO schedule VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            this.ps.setString(1, id);
            while (i < 42) {
                this.ps.setString(i + 2, schedule[i]);
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

    public String[] getSchedule(String id) {
        String[] schedule = new String[42];
        try {
            this.sqlConnect();
            this.ps = this.db.prepareStatement("SELECT * FROM schedule WHERE id = ?");
            this.ps.setString(1, id);
            this.rs = this.ps.executeQuery();
            while (this.rs.next()) {
                for (int i = 0; i < 42; i++) {
                    schedule[i] = this.rs.getString(i + 2);
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
    /*
     * public String[] getSchedule() { String[] schedule = new String[42]; try {
     * this.sqlConnect(); this.ps = this.db.prepareStatement(""); this.rs =
     * this.ps.executeQuery(); return schedule; } catch (Exception e) {
     * e.printStackTrace(); } finally { try { this.db.close(); } catch (Exception
     * er) { er.printStackTrace(); } } }
     */
}