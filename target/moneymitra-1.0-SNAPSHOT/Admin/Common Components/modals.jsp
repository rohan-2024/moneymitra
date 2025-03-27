
    <!-- Add Expense Modal -->
    <div class="modal fade" id="addExpenseModal" tabindex="-1" aria-labelledby="addExpenseModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addExpenseModalLabel">Add Expense</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../ExpenseServlet" method="post">
                          <input type="text" hidden name="action" value="add">
                        <input type="text" hidden name="admin" value="<%= admin.getId() %>">

                        <div class="mb-3">
                            <label for="expenseTitle" class="form-label">Title</label>
                            <input type="text" class="form-control" name="title" placeholder="Enter expense title" required>
                        </div>
                        <div class="mb-3">
                            <label for="expenseAmount" class="form-label">Amount (?)</label>
                            <input type="number" class="form-control" name="amount" placeholder="Enter amount" required>
                        </div>
                        <div class="mb-3">
                            <label for="expenseCategory" class="form-label">Category</label>
                            <select class="form-select" name="category" required>
                                <%
                                    for(Category c:categoryList) {
                                %>
                                <option value="<%= c.getId() %>"><%= c.getName() %></option>
                               <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="expenseDate" class="form-label">Date</label>
                            <input type="date" class="form-control" name="expenseDate" required>
                        </div>
                       
                        <button type="submit" class="btn btn-primary">Add Expense</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


       <%
           for(Expense e:expenseList){
       %>
       <!-- Edit Expense Modal -->
    <div class="modal fade" id="editExpenseModal<%= e.getId() %>" tabindex="-1" aria-labelledby="editExpenseModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editExpenseModalLabel">Edit Expense</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../ExpenseServlet" method="post">
                          <input type="text" hidden name="action" value="edit">
                        <input type="text" hidden name="admin" value="<%= admin.getId() %>">
                        <input type="text" hidden name="expense" value="<%= e.getId() %>">
                        

                        <div class="mb-3">
                            <label for="editExpenseTitle" class="form-label">Title</label>
                            <input type="text" class="form-control" name="title" value="<%= e.getTitle() %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="editExpenseAmount" class="form-label">Amount (?)</label>
                            <input type="number" class="form-control" name="amount" value="<%= e.getAmount() %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="editExpenseCategory" class="form-label">Category</label>
                           <select class="form-select" name="category" required>
                                <%
                                    for(Category c:categoryList) {
                                %>
                                <option value="<%= e.getId() %>"></option>
                                <option value="<%= c.getId() %>"><%= c.getName() %></option>
                               <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="editExpenseDate" class="form-label">Date</label>
                            <input type="date" class="form-control" name="expenseDate">
                        </div>
                      
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
      <%
          }
      %>
      
           <!-- Add Category Modal -->
     <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCategoryModalLabel">Add Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../CategoryServlet" method="post">
                        <input type="text" hidden name="action" value="add">
                        <input type="text" hidden name="admin" value="<%= admin.getId() %>">

                        <div class="mb-3">
                            <label for="categoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" name="name" placeholder="Enter category name" required>
                        </div>
                        <div class="mb-3">
                            <label for="categoryType" class="form-label">Category Type</label>
                            <select class="form-select" name="type" required>
                                <option value="Income">Income</option>
                                <option value="Expense">Expense</option>
                            </select>
                        </div>
                       
                        <button type="submit" class="btn btn-primary">Add Category</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
       <%
           for(Category c:categoryList){
       %>
           <!-- Edit Category Modal -->
    <div class="modal fade" id="editCategoryModal<%= c.getId() %>" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../CategoryServlet" method="post">
                          <input type="text" hidden name="action" value="edit">
                        <input type="text" hidden name="admin" value="<%= admin.getId() %>">
                        
                        <div class="mb-3">
                            <label for="editCategoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" value="<%= c.getName() %>" name="name" >
                        </div>
                        <div class="mb-3">
                            <label for="editCategoryType" class="form-label">Category Type</label>
                            <select class="form-select" type="type" required>
                                <option value="<%= c.getCatType() %>"><%= c.getCatType() %></option>
                                <option value="Income">Income</option>
                                <option value="Expense">Expense</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
                                
    <%
        }
    %>
    <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">Your Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../ProfileServlet" method="post">
                      
                        <div class="mb-3">
                            <label for="profileNameModal" class="form-label">Name</label>
                            <input readonly type="text" class="form-control" id="profileNameModal" value="<%= admin.getFirstName()+" "+admin.getLastName() %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="profileEmailModal" class="form-label">Email</label>
                            <input type="email" readonly class="form-control" name="email" value="<%= admin.getEmail() %>" required>
                        </div>
                       
                        <div class="mb-3">
                            <label for="profilePasswordModal" class="form-label">Current Password</label>
                            <input type="password" class="form-control" name="currentPassword" placeholder="Enter current password">
                        </div> 
                        <div class="mb-3">
                            <label for="profilePasswordModal" class="form-label">New Password</label>
                            <input type="password" class="form-control" name="newPassword" placeholder="Enter new password">
                        </div>
                        <button type="submit" class="btn btn-primary">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>