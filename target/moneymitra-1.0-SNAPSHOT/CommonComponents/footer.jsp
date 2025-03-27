
    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2025 Rohan Axis. All Rights Reserved.</p>
    </footer>

    <!-- Modal Structure -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="registerModalLabel">Join MoneyMitra Today!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center">
                <img src="images/moneymitra.png" style="background-color: rgb(13 108 247) !important;" alt="MoneyMitra Logo" height="60" class="mb-3">
                <form action="AdminServlet" method="post">
                    <div class="mb-3 text-start">
                        <label for="fullName" class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" placeholder="Enter your first name" required>
                    </div>
                      <div class="mb-3 text-start">
                        <label for="fullName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" placeholder="Enter your last name" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Create a password" required>
                    </div>
                    <div class="mb-3 text-start">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm your password" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Register Now</button>
                </form>
            </div>
            <div class="modal-footer">
                <p class="text-center w-100">Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </div>
    </div>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
