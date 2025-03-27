<%@include file="Common Components/sidebar.jsp" %>

  <!-- Main Content -->
        <div class="flex-grow-1 p-4">
            <div class="d-flex justify-content-between align-items-center bg-primary text-white p-3 rounded">
                <button class="btn btn-primary d-md-none" type="button" data-bs-toggle="collapse" data-bs-target="#sidebar" aria-expanded="false" aria-controls="sidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <h2 class="mb-0">Expense History</h2>
                <img src="../images/moneymitra.png" alt="MoneyMitra Logo" height="40">
            </div>

                        <%@include file="../CommonComponents/message.jsp" %>

            <!-- Expense History Table -->
            <div class="mt-4">
                <h4>All Expenses</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th>Date</th>
                                <th>Title</th>
                                <th>Amount</th>
                                <th>Category</th>
                                <th>Type</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                              <%
           for(Expense e:expenseList){
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
                                <td>
                                    <form action="../DeleteServlet" method="post">
                                        <input type="text" hidden name="id" value="<%= e.getId() %>">
                                        <button class="btn btn-warning btn-warning">Delete</button>
                                    </form>
                                </td>
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
