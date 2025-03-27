/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.expense.servlet;

import com.expense.dao.CategoryDao;
import com.expense.entity.Category;
import com.expense.helper.FactoryProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Swastik Computer
 */
@WebServlet(name="CategoryServlet", urlPatterns = {"/CategoryServlet"})
public class CategoryServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
          String action=request.getParameter("action");
          String name=request.getParameter("name");
          String type=request.getParameter("type");
          int admin = Integer.parseInt(request.getParameter("admin"));
           
          CategoryDao cd=new CategoryDao(FactoryProduct.getFactory());
          Category c=new Category();
          HttpSession h=request.getSession();
         
           if(action.equals("add")){
         c.setName(name);
         c.setCatType(type);
         c.setAdmin(admin);
        
         cd.saveCategory(c);
          h.setAttribute("message", "Category added successfully");
          
           }else if(action.equals("edit")){
               Category c1=cd.getCategoryById(admin);
               if(c1!=null){
               if(type!=null){
               c1.setCatType(type);
               }
               if(name!=null){
               c1.setName(name);
               }
               cd.updateCategory(c1);
              h.setAttribute("message", "Category updated successfully"); 
               }
           }
         
        
         response.sendRedirect("Admin/categories.jsp");
            
        }catch(Exception e){
            e.printStackTrace();
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
