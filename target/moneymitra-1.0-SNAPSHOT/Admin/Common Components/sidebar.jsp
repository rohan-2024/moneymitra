<%@page import="com.expense.entity.Admin" %>
<%@page import="com.expense.entity.Category" %>
<%@page import="com.expense.entity.Expense" %>
<%@page import="com.expense.dao.ExpenseDao" %>
<%@page import="com.expense.dao.CategoryDao" %>
<%@page import="com.expense.helper.FactoryProduct" %>


<%@page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MoneyMitra - Expense History</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body class="bg-light">
<%
    Admin admin=(Admin)session.getAttribute("current-user");
    if(admin==null){
     session.setAttribute("message", "Session out ! Please Login");
    response.sendRedirect("../login.jsp");
    return;
    }
       CategoryDao cd=new CategoryDao(FactoryProduct.getFactory());
          ExpenseDao ed=new ExpenseDao(FactoryProduct.getFactory());
          
          List<Expense> expenseList=ed.getAllExpenseById(admin.getId());
          List<Category> categoryList=cd.getAllCategoryById(admin.getId());
%>
<!-- Sidebar -->
    <div class="d-flex">
        <div class="bg-dark text-white p-3 vh-100 collapse d-md-block" id="sidebar" style="width: 250px;">
            <div class="text-center mb-4">
                <img src="../images/rohanaxis.jpg" alt="Rohan Axis Logo" height="60">
            </div>
            <ul class="nav flex-column">
                <li class="nav-item"><a href="dashboard.jsp" class="nav-link text-white"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a></li>
                <li class="nav-item"><a href="categories.jsp" class="nav-link text-white active"><i class="fas fa-list-ul me-2"></i> Categories</a></li>
                <li class="nav-item"><a href="expense.jsp" class="nav-link text-white"><i class="fas fa-history me-2"></i> Expense History</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white" data-bs-toggle="modal" data-bs-target="#addExpenseModal"><i class="fas fa-plus-circle me-2"></i> Add Expense</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white" data-bs-toggle="modal" data-bs-target="#addCategoryModal"><i class="fas fa-folder-plus me-2"></i> Add Category</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white" data-bs-toggle="modal" data-bs-target="#profileModal"><i class="fas fa-user me-2"></i> Profile</a></li>
                <li class="nav-item"><a href="../LogoutServlet" class="nav-link text-white"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
            </ul>
        </div>

 