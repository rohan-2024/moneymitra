/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.expense.servlet;

import com.expense.dao.ExpenseDao;
import com.expense.entity.Expense;
import com.expense.helper.FactoryProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name="ExpenseServlet", urlPatterns = {"/ExpenseServlet"})
public class ExpenseServlet extends HttpServlet {

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
             String title = request.getParameter("title");
            String expenseDate = request.getParameter("expenseDate");
            double amount = Double.parseDouble(request.getParameter("amount"));
           int catId = Integer.parseInt(request.getParameter("category"));
            int admin = Integer.parseInt(request.getParameter("admin"));
            
           SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
           Date date;
           SimpleDateFormat outputFormat;
           String formattedDate="";
       if(expenseDate!=null && !(expenseDate.equals(""))){
            date=inputFormat.parse(expenseDate);

            // Format the date to the desired output format
            outputFormat = new SimpleDateFormat("dd-MM-yyyy");
             formattedDate = outputFormat.format(date);
       }
            HttpSession h=request.getSession();
            ExpenseDao ed = new ExpenseDao(FactoryProduct.getFactory());
            Expense ex = new Expense();
            
            if(action.equals("add")){
           
             ex.setTitle(title);
             ex.setExpenseDate(formattedDate);
             ex.setAmount(amount);
             ex.setAdmin(admin);
             ex.setCategory(catId);
             
             ed.saveExpense(ex);
             
         h.setAttribute("message", "Expense added successfully");
         response.sendRedirect("Admin/expense.jsp");  
           
}else if(action.equals("edit")){
    int expense=Integer.parseInt(request.getParameter("expense"));
    Expense e=ed.getExpenseById(expense);
    if(e!=null){
        if(title!=null){
            e.setTitle(title);
        }
        if(expenseDate==null || (expenseDate.equals(""))){
            e.setExpenseDate(e.getExpenseDate());
        }
        if(amount!=e.getAmount()){
            e.setAmount(amount);
        }
        if(catId!=e.getCategory()){
            e.setCategory(catId);
        }
    }
    ed.updateExpense(e);
     h.setAttribute("message", "Expense updated successfully");
         response.sendRedirect("Admin/expense.jsp");  
    
}
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
