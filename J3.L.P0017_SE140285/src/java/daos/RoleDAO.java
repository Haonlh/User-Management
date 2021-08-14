/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dtos.RoleDTO;
import utils.DBConnection;

/**
 *
 * @author HoaiHao
 */
public class RoleDAO {

    List<RoleDTO> listRole;

    public List<RoleDTO> getListRole() {
        return listRole;
    }
    
    
    
    public void getAllRole() throws SQLException {
      
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null){
                String sql = " SELECT roleID , roleName " 
                        + " FROM tblRoles";
                        
                     
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    int roleID = rs.getInt("roleID");
                    String roleName = rs.getString("roleName");
                    if (listRole == null) {
                        listRole = new ArrayList<>();
                    }
                    listRole.add(new RoleDTO(roleID, roleName));
                }
            }

        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

}
