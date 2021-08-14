/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author HoaiHao
 */
public class DBConnection {
    public static Connection getConnection() throws  SQLException, NamingException{
        Connection conn=null;
        Context context= new InitialContext();
        Context end= (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource)end.lookup("DBCon");
        conn= ds.getConnection();
        return conn;
    }
    
    
    public static String makeEncryptPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return new BigInteger(1, md.digest(password.getBytes())).toString();
    }
}
