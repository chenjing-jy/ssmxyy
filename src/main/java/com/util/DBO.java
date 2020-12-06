package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.activation.DataSource;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.datasource.DriverManagerDataSource;


public class DBO {
    private Connection conn;
    private Statement stmt;
    private DataSource ds;

    public DBO() {
        open();
    }

    /**
     * 打开数据库
     */
    public void open() {

        String url = "";

        // MySQL配置时的用户名
        String user = "";

        // MySQL配置时的密码
        String password = "";
        //获得Spring中定义的Bean实例
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        try {
            //获得dataSource的用户名、密码、配置文件、URL属性
            DriverManagerDataSource ds = (DriverManagerDataSource) ac.getBean("dataSource");

            conn = ds.getConnection();

            stmt = conn.createStatement();
        } catch (Exception ex) {
            System.err.println("打开数据库时出错: " + ex.getMessage());
        }
    }

    /**
     * 关闭数据库，将连接返还给连接池
     */
    public void close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            System.err.println("返还连接池出错: " + ex.getMessage());
        }
    }

    /**
     * 执行查询
     */
    public ResultSet executeQuery(String sql) throws SQLException {
        ResultSet rs = null;
        rs = stmt.executeQuery(sql);
        return rs;
    }

    public ResultSet query(String sql) throws SQLException {
        ResultSet rs = null;
        rs = stmt.executeQuery(sql);
        return rs;
    }

    /**
     * 执行增删改
     */

    public int executeUpdate(String sql) throws SQLException {
        int ret = 0;
        ret = stmt.executeUpdate(sql);
        return ret;
    }

    public int update(String sql) throws SQLException {
        int ret = 0;
        ret = stmt.executeUpdate(sql);
        return ret;
    }

    /**
     * 将SQL语句加入到批处理
     */
    public void addBatch(String sql) throws SQLException {
        stmt.addBatch(sql);
    }

    /**
     * 执行批处理
     */
    public int[] executeBatch() throws SQLException {
        boolean isAuto = conn.getAutoCommit();
        conn.setAutoCommit(false);
        int[] updateCounts = stmt.executeBatch();
        return updateCounts;
    }

    public boolean getAutoCommit() throws SQLException {
        return conn.getAutoCommit();
    }

    public void setAutoCommit(boolean auto) throws SQLException {
        conn.setAutoCommit(auto);
    }

    public void commit() throws SQLException {
        conn.commit();
    }

    public void rollBack() throws SQLException {
        conn.rollback();
    }

    public static void main(String[] args) {
        DBO con = new DBO();
        con.close();
    }
}
