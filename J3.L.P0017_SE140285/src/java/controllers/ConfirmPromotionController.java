/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import daos.PromotionDAO;
import promotions.Promotion;

/**
 *
 * @author HoaiHao
 */
public class ConfirmPromotionController extends HttpServlet {
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String PROMOTION_LIST_PAGE = "promotionList.jsp";
    private static final String INIT_SEARCH_CONTORLLER = "InitSearchController";

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
                    
                    if (isAdmin) {
                        url = PROMOTION_LIST_PAGE;
                        Promotion promoList = (Promotion) session.getAttribute("PROMOTIONLIST");
                        
                        if (promoList != null) {
                            PromotionDAO pDao = new PromotionDAO();
                            
                            for (HashMap.Entry<String, Float> item : promoList.getItems().entrySet()) {
                                pDao.insertToPromotion(item.getKey(), item.getValue());
                            }
                            
                            promoList = null;
                            
                            session.setAttribute("PROMOTIONLIST", promoList);
                            url = INIT_SEARCH_CONTORLLER;
                        }
                    }
                }
            }
        } catch(Exception e){
            log("Error at ConfirmPromotionController: " +e.toString());
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
