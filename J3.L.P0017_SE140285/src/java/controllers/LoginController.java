/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import daos.RoleDAO;
import daos.UserDAO;
import dtos.RoleDTO;
import dtos.UserDTO;
import utils.DBConnection;

/**
 *
 * @author HoaiHao
 */
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
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
            String userID = request.getParameter("txtUserID");
            String password = request.getParameter("txtPassword");
            String passwordSHA256 = DBConnection.makeEncryptPassword(password);
            UserDAO dao = new UserDAO();
            boolean result = dao.checkLogin(userID, passwordSHA256);
            if (result) {
                HttpSession session = request.getSession(true);
                String user = dao.getUserName(userID);
                UserDTO userInfor = dao.getUserById(userID);
                session.setAttribute("USER", user);
                session.setAttribute("USERINFOR", userInfor);
                session.setAttribute("USERID", userID);
                RoleDAO roleDao = new RoleDAO();
                roleDao.getAllRole();
                List<RoleDTO> roles = roleDao.getListRole();
                session.setAttribute("ROLES", roles);
                boolean isAdmin = dao.isAdmin(userID);
                session.setAttribute("ADMIN", isAdmin);

                if (isAdmin) {
                    url = INIT_SEARCH_CONTROLLER;
                } else {
                    url = USER_PAGE;
                }

            } else {
                request.setAttribute("LOGINERROR", "Invalid email or password");
            }

        } catch (Exception e) {
            log("Error at LoginController:" + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
