<%@include file="Common Components/sidebar.jsp" %>

        <!-- Main Content -->
        <div class="flex-grow-1 p-4">
            <div class="d-flex justify-content-between align-items-center bg-primary text-white p-3 rounded">
                <button class="btn btn-primary d-md-none" type="button" data-bs-toggle="collapse" data-bs-target="#sidebar" aria-expanded="false" aria-controls="sidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <h2 class="mb-0">Categories</h2>
                <img src="../images/moneymitra.png" alt="MoneyMitra Logo" height="40">
            </div>
            <%@include file="../CommonComponents/message.jsp" %>
            <!-- Categories Table -->
            <div class="mt-4">
                <h4>All Categories</h4>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="bg-primary text-white">
                            <tr>
                                <th>Category Name</th>
                                <th>Category Type</th>
                                <th>Action</th> <!-- Action Column -->
                            </tr>
                        </thead>
                        <tbody>
                                <%
                                     for(Category c:categoryList){
                                %>
                            <tr>
                                <td><%= c.getName() %></td>
                                <td><%= c.getCatType() %></td>
                                <td><button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editCategoryModal<%= c.getId() %>">Edit</button></td>
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
