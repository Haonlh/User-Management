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
import dtos.UserDTO;
import utils.DBConnection;

/**
 *
 * @author HoaiHao
 */
public class UserDAO implements Serializable {

    public boolean checkLogin(String userID, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT  userName  "
                        + " FROM tblUsers"
                        + " WHERE userID = ? AND password = ? AND status ='Active'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
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

        return false;
    }

    public boolean isAdmin(String userID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = " SELECT roleID"
                        + " FROM tblUsers"
                        + " WHERE userID = ? AND status = 'Active'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    int roleID = rs.getInt("roleID");
                    if (roleID == 1) {
                        return true;
                    }
                }
            }

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
        return false;
    }

    public String getUserName(String userID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String name = "";
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = " SELECT userName"
                        + " FROM tblUsers"
                        + " WHERE userID = ? AND status = 'Active'";

                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    name = rs.getString("userName");
                }
            }
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
        return name;
    }
    List<UserDTO> listUser;

    public List<UserDTO> getList() {
        return listUser;
    }

    public void getAllUser() throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT u.userID , password , userName , email , phone , photo , u.roleID, r.roleName , status "
                        + " FROM tblUsers u, tblRoles r"
                        + " WHERE u.roleID = r.roleID AND u.status ='Active'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = rs.getString("password");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String photo = rs.getString("photo");
                    int roleID = rs.getInt("roleID");
                    String roleName = rs.getString("roleName");
                    String status = rs.getString("status");
                    if (listUser == null) {
                        listUser = new ArrayList<>();
                    }
                    listUser.add(new UserDTO(userID, password, userName, email, phone, photo, roleName, roleID, status));
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

    public void searchByName(String searchValue) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT u.userID , password , userName , email , phone , photo , u.roleID ,r.roleName , status "
                        + " FROM tblUsers u, tblRoles r"
                        + " WHERE u.roleID = r.roleID AND userName LIKE ? AND status = 'Active'  ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = rs.getString("password");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String photo = rs.getString("photo");
                    int roleID = rs.getInt("roleID");
                    String roleName = rs.getString("roleName");
                    String status = rs.getString("status");
                    if (listUser == null) {
                        listUser = new ArrayList<>();
                    }
                    listUser.add(new UserDTO(userID, password, userName, email, phone, photo, roleName, roleID, status));
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

    public void searchByRole(String roleValue) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT u.userID , password , userName , email , phone , photo , u.roleID, r.roleName , status "
                        + " FROM tblUsers u, tblRoles r"
                        + " WHERE u.roleID = r.roleID AND r.roleName = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, roleValue);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = rs.getString("password");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String photo = rs.getString("photo");
                    int roleID = rs.getInt("roleID");
                    String roleName = rs.getString("roleName");
                    String status = rs.getString("status");
                    if (listUser == null) {
                        listUser = new ArrayList<>();
                    }
                    listUser.add(new UserDTO(userID, password, userName, email, phone, photo, roleName, roleID, status));
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
    
    public boolean checkUserIdExist(String userID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            
            if( conn != null) {
                String sql = " SELECT userID"
                        + " FROM tblUsers"
                        + " WHERE userID = ?";
                
                stm= conn.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if(rs.next()) {
                    return true;
                }
            }
        }finally {
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
        return false;
    }
    
    public boolean insertUser(String userID, String password , String userName, int roleID , String email, String phone, String photo) throws SQLException, NamingException{
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if( conn != null) {
                String sql = " INSERT tblUsers(userID , password , userName , email , phone , photo , roleID, status)"
                        + " VALUES(?,?,?,?,?,?,?,'Active')";
                stm= conn.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                stm.setString(3, userName);
                stm.setString(4, email);
                stm.setString(5, phone);
                stm.setString(6, photo);
                stm.setInt(7, roleID);
                
                int row = stm.executeUpdate();
                if(row > 0 ){
                    return true;
                }
            
        }
        }finally {
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
        return false;
    }

    public boolean deleteUserByID(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = "UPDATE tblUsers"
                        + " SET status ='InActive'"
                        + " WHERE userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);
                check = stm.executeUpdate() > 0 ? true : check;
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
        return check;
    }

    public UserDTO getUserById(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                String sql = " SELECT u.userID , password , userName, email , phone , photo , u.roleID,r.roleName  , status"
                        + " FROM tblUsers u, tblRoles r"
                        + " WHERE u.roleID= r.roleID AND u.userID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String userName = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String photo = rs.getString("photo");
                    int roleID = rs.getInt("roleID");
                    String roleName = rs.getString("roleName");
                    String status = rs.getString("status");
                    user = new UserDTO(userID, null, userName, email, phone, photo, roleName, roleID, status);
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
        return user;
    }

    public boolean updateUser(String userID, String password, String userName, String email, String phone, String photo, int roleID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBConnection.getConnection();
            if (conn != null) {
                if (!password.isEmpty()) {
                    String sql = "UPDATE tblUsers"
                            + " SET password = ?, userName = ?, email = ?, phone = ?, photo = ?, roleID = ?"
                            + " WHERE userID = ?";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, password);
                    stm.setString(2, userName);
                    stm.setString(3, email);
                    stm.setString(4, phone);
                    stm.setString(5, photo);
                    stm.setInt(6, roleID);
                    stm.setString(7, userID);

                } else {
                    String sql = "UPDATE tblUsers"
                            + " SET userName = ?, email = ?, phone = ?, photo = ?, roleID = ?"
                            + " WHERE userID = ?";
                    stm = conn.prepareStatement(sql);
                    stm.setString(1, userName);
                    stm.setString(2, email);
                    stm.setString(3, phone);
                    stm.setString(4, photo);
                    stm.setInt(5, roleID);
                    stm.setString(6, userID);
                }
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

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
        return false;

    }
    
    
}
