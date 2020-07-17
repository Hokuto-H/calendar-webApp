<%@ page contentType="text/html; charset=UTF-8"
    import ="java.sql.*, javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>データベースへの接続</title>
    </head>
    <body>
        <%
        Connection db = DriverManager.getConnection("jdbc:mysql://localhost/db_u306161", "u306161", "p306161");
        db.close();
        %>
        データベースへの接続に成功しました
    </body>
</html>