<%@include file="CommonComponents/header.jsp" %>

    <!-- Contact Form Section -->
    <section class="container py-5">
        <div class="text-center mb-4">
           <h1 class="fw-bold text-primary">Contact Us</h1>
            <p>We're here to help! Reach out to us with your questions or feedback.</p>
        </div>

        <div class="row">
            <div class="col-md-6">
                <form class="p-4 border rounded bg-white shadow-sm">
                    <div class="mb-3">
                        <label for="name" class="form-label">Your Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Your Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email">
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <textarea class="form-control" id="message" rows="4" placeholder="Write your message here..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Send Message</button>
                </form>
            </div>

            <div class="col-md-6">
                <div class="p-4 border rounded bg-white shadow-sm">
                    <h4 class="text-primary">Contact Information</h4>
                    <p><i class="fas fa-envelope me-2"></i> snghrohan000@gmail.com</p>
                    <p><i class="fas fa-phone-alt me-2"></i> +91 1234567890</p>
                    <p><i class="fas fa-map-marker-alt me-2"></i> Dehri, Bihar, India</p>
                </div>

                <div class="p-4 border rounded bg-white shadow-sm mt-4">
                    <h4 class="text-primary">Follow Us</h4>
                    <a href="#" class="text-dark me-3"><i class="fab fa-facebook fa-2x"></i></a>
                    <a href="#" class="text-dark me-3"><i class="fab fa-twitter fa-2x"></i></a>
                    <a href="#" class="text-dark me-3"><i class="fab fa-instagram fa-2x"></i></a>
                </div>
            </div>
        </div>
    </section>

<%@include file="CommonComponents/footer.jsp" %>
