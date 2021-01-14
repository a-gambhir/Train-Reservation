package com.cs336.pkg;





import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ApplicationDB {
  public Connection getConnection() {
    String connectionUrl = "jdbc:mysql://192.168.1.27:3306/testDB";
    Connection connection = null;
    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (InstantiationException e) {
      e.printStackTrace();
    } catch (IllegalAccessException e) {
      e.printStackTrace();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } 
    try {
      connection = DriverManager.getConnection(connectionUrl, "root", "root");
    } catch (SQLException e) {
      e.printStackTrace();
    } 
    return connection;
  }
  
  public void closeConnection(Connection connection) {
    try {
      connection.close();
    } catch (SQLException e) {
      e.printStackTrace();
    } 
  }
  
  public static void main(String[] args) {
    ApplicationDB dao = new ApplicationDB();
    Connection connection = dao.getConnection();
    System.out.println(connection);
    dao.closeConnection(connection);
  }
}