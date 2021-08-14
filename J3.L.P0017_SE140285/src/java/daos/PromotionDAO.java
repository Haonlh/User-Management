/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import dtos.PromotionDTO;
import utils.DBConnection;

/**
 *
 * @author HoaiHao
 */
public class PromotionDAO implements Serializable{
    public boolean insertToPromotion(String userID, float userRank) throws SQLException, NamingException{
        Connection conn = null ;
        PreparedStatement stm = null;
        
        try{
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = " INSERT tblPromotions(userID, userRank,createDate)"
                        + " VALUES(?,?,?)";
                stm= conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setFloat(2, userRank);
                long millis=System.currentTimeMillis();   
                java.sql.Date date=new java.sql.Date(millis); 
                stm.setDate(3, date);
                int row = stm.executeUpdate();            
                if(row > 0){
                    return true;
                }
            }
            
        }finally{
            if(stm != null){
                stm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
        return false;
    }
    
    List<PromotionDTO> listPromo;

    public List<PromotionDTO> getListPromo() {
        return listPromo;
    }
    
    public void getPromotionList(String order) throws SQLException, NamingException {
        Connection conn = null ;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try{
            conn = DBConnection.getConnection();
            if ( conn != null) {
                String sql;
                if (order.equals("h")) {
                    sql = "SELECT p.promotionID, p.userID, p.userRank, p.createDate, u.photo, u.userName "
                        + "FROM tblPromotions p, tblUsers u "
                        + "WHERE p.userID = u.userID "
                        + "ORDER BY p.createDate DESC";
                } else {
                    sql = "SELECT p.promotionID, p.userID, p.userRank, p.createDate, u.photo, u.userName "
                        + "FROM tblPromotions p, tblUsers u "
                        + "WHERE p.userID = u.userID "
                        + "ORDER BY p.createDate ASC";
                }
                stm= conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int promotionID = rs.getInt("promotionID");
                    String userID = rs.getString("userID");
                    float userRank = rs.getFloat("userRank");
                    String createDate = rs.getString("createDate");
                    String photo = rs.getString("photo");
                    String userName = rs.getString("userName");
                    if (listPromo == null) {
                        listPromo = new ArrayList<>();
                    }
                    
                    listPromo.add(new PromotionDTO(promotionID, userID, photo, userName, userRank, createDate));
                }
            }
            
        }finally{
            if(rs != null) {
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(conn != null){
                conn.close();
            }
        }
    }
    
}
