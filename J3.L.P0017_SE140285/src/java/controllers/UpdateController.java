/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import daos.UserDAO;
import dtos.RoleDTO;
import dtos.UserDTO;
import dtos.UserErrorDTO;
import utils.DBConnection;

/**
 *
 * @author HoaiHao
 */
public class UpdateController extends HttpServlet {
        private static final String LOGIN_PAGE = "login.jsp";
        private static final String UPDATE_PAGE = "updatePage.jsp";
        private static final String INIT_SEARCH_CONTROLLER = "InitSearchController";
        private static final String USER_PAGE = "userPage.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = LOGIN_PAGE;
        try {
            HttpSession session = request.getSession(false);

            if (session != null) {
                String user = (String) session.getAttribute("USER");
                if (user != null) {
                    boolean isAdmin = (boolean) session.getAttribute("ADMIN");
                    boolean flag = true;
                    UserErrorDTO error = new UserErrorDTO();
                    UserDAO dao = new UserDAO();

                    String userID = request.getParameter("txtUserID");
                    String password = request.getParameter("txtUpdatePassword");
                    String confirmPassword = request.getParameter("txtUpdateConfirmPassword");
                    String userName = request.getParameter("txtUpdateUserName");
                    String roleName = request.getParameter("txtUpdateRole");
                    String email = request.getParameter("txtUpdateEmail");
                    String phone = request.getParameter("txtUpdatePhone");
                    if (!password.isEmpty() || !confirmPassword.isEmpty()) {
                        if (password.length() < 2 || password.length() > 30) {
                            flag = false;
                            error.setPasswordError("Password length is 2 - 30 characters");
                        }
                        if (!confirmPassword.equals(password)) {
                            flag = false;
                            error.setConfirmError("Confirm password is not match !");
                        }

                    }
                    if (userName.length() < 4 || userName.length() > 20) {
                        flag = false;
                        error.setUserNameError("UserName length is 4 - 20 characters ");
                    }

                    if (!phone.matches("[0-9]{10}")) {
                        flag = false;
                        error.setPhoneError("Phone length is 10 character and must be all number");
                    }
                    if (!email.matches("[A-Za-z0-9]+@\\w+[.][\\w.]+")) {
                        flag = false;
                        error.setEmailError("Email illegal !");
                    }
                    String imageAddress = request.getParameter("updateImageSource");
                    String imageName = "";
                    String imageType = "";
                    String savePath = "";
                    String saveDbPath = "";
                    BufferedImage bi = null;
                    if (!imageAddress.isEmpty()) {
                        imageName = imageAddress;
                        int lastIndexImage = imageName.lastIndexOf("\\");
                        imageName = imageName.substring(lastIndexImage + 1);
                        int lastIndexType = imageName.lastIndexOf(".");
                        imageType = imageName.substring(lastIndexType + 1);
                        savePath = request.getServletContext().getRealPath("");
                        File inputFile = new File(imageAddress);
                        InputStream is = new FileInputStream(inputFile);
                        bi = ImageIO.read(is);

                        if (!imageType.equals("jpg")
                                && !imageType.equals("png")
                                && !imageType.equals("jpeg")) {
                            flag = false;
                            error.setPhotoError("The file is not image file");
                        }
                    } else {
                        saveDbPath = request.getParameter("defaultPhoto");
                    }
                    if (flag) {
                        if (!imageName.isEmpty()) {
                            saveDbPath = ".\\IMG\\" + imageName;
                            ImageIO.write(bi, imageType, new File(savePath + "\\IMG" + imageName));
                            File file = new File(savePath).getParentFile().getParentFile();
                            ImageIO.write(bi, imageType, new File(file.getAbsoluteFile() + "\\web\\IMG\\" + imageName));
                            Thread.sleep(2000);
                        }

                        int roleID = 0;
                        List<RoleDTO> listRole = (List<RoleDTO>) session.getAttribute("ROLES");

                        for (int i = 0; i < listRole.size(); i++) {
                            if (listRole.get(i).getRoleName().equals(roleName)) {
                                roleID = listRole.get(i).getRoleID();
                            }
                        }
                        
                        String savePassword = "";

                        if (!password.isEmpty() && !confirmPassword.isEmpty()) {
                            savePassword = DBConnection.makeEncryptPassword(password);
                        }

                        boolean result = dao.updateUser(userID, savePassword, userName, email, phone, saveDbPath, roleID);

                        if (result) {
                            session.removeAttribute("UPDATEUSER");
                            String currentUserID = (String) session.getAttribute("USERID");
                            if (currentUserID.equals(userID)) {
                                UserDTO userInfor = dao.getUserById(userID);
                                session.setAttribute("USER", userInfor.getUserName());
                                session.setAttribute("USERINFOR", userInfor);
                            }

                            if (isAdmin) {
                                url = INIT_SEARCH_CONTROLLER;
                            } else {
                                url = USER_PAGE;
                            }
                        }
                    } else {
                        if (isAdmin) {
                            url = UPDATE_PAGE;
                        } else {
                            url = USER_PAGE;
                        }
                        request.setAttribute("UPDATEERROR", error);
                    }
                }
            }

        } catch (Exception e) {
            log("Error at UpdateController:" + e.toString());
        } finally {
            response.sendRedirect(url);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
