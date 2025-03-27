<%@include file="Common Components/sidebar.jsp" %>
<%
    double income=0;
    double expenses=0;
    double savings=0;
    for(Expense e:expenseList){
    if(cd.getCategoryById(e.getCategory()).getCatType().equals("Income")){
        income=income+e.getAmount();
    }else{
    expenses=expenses+e.getAmount();
    }
    }
    savings=income-expenses;
%>
     <!-- Main Content -->
        <div class="flex-grow-1 p-4">
            <!-- Navbar with toggle button for mobile -->
            <div class="d-flex justify-content-between align-items-center bg-primary text-white p-3 rounded">
                <button class="btn btn-primary d-md-none" type="button" data-bs-toggle="collapse" data-bs-target="#sidebar" aria-expanded="false" aria-controls="sidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <h2 class="mb-0">Dashboard</h2>
                <img src="../images/moneymitra.png" alt="MoneyMitra Logo" height="40">
            </div>
            <%@include file="../CommonComponents/message.jsp" %>
            <!-- Summary Cards -->
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card text-center shadow-sm p-4">
                        <h5>Total Income</h5>
                        <p class="fw-bold text-success">&#8377; <%= income %></p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center shadow-sm p-4">
                        <h5>Total Expenses</h5>
                        <p class="fw-bold text-danger">&#8377; <%= expenses %></p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center shadow-sm p-4">
                        <h5>Total Savings</h5>
                        <p class="fw-bold text-primary">&#8377; <%= savings %></p>
                    </div>
                </div>
            </div>

            <!-- Recent Transactions Table -->
            <div class="mt-4">
                <h4>Recent Transactions</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th>Date</th>
                                <th>Title</th>
                                <th>Amount</th>
                                <th>Category</th>
                                <th>Type</th>
                                <th>Action</th> 
                            </tr>
                        </thead>
                        <tbody>
                              <%
           List<Expense> recentexpenseList=ed.getAllExpenseInDesc(admin.getId());
           for(Expense e:recentexpenseList){
       %>
                            <tr>
                                <td><%= e.getExpenseDate() %></td>
                                <td><%= e.getTitle() %></td>
                                   <%
                                    String catName=cd.getCategoryById(e.getCategory()).getName();
                                    String type=cd.getCategoryById(e.getCategory()).getCatType();
                                    if(type.equals("Expense")){
                                %>
                                
                                <td class="text-danger">&#8377; <%= e.getAmount() %></td>
                             <%
                                 }else{
                             %>
                                <td class="text-success">&#8377; <%= e.getAmount() %></td>
                                <%
                                    }
                                %>
                                <td><%= catName %></td>
                                <td><%= type %></td>
                                <td><button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editExpenseModal<%= e.getId() %>">Edit</button></td>
                            </tr>
                            <%
                                }
                            %>
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
<%@include file="Common Components/modals.jsp" %>
