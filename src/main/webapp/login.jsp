<%@include file="CommonComponents/header.jsp" %>

   <!-- Login Section -->
    <section class="d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="card shadow-sm p-4" style="max-width: 400px; width: 100%;">
            <div class="text-center mb-4">
                <img src="images/moneymitra.png" style="background-color: rgb(13 108 247) !important;" alt="MoneyMitra Logo" height="60">
                <h2 class="fw-bold mt-3">Login to MoneyMitra</h2>
            </div>
            <form action="LoginServlet" method="post">
                <%@include file="CommonComponents/message.jsp" %>
                <div class="mb-3">
                    <label for="email" class="form-label">Email Address</label>
                    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
                <div class="text-center mt-3">
                    <p>Don't have an account? <a href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Register here</a></p>
                </div>
            </form>
        </div>
    </section>

<%@include file="CommonComponents/footer.jsp" %>
