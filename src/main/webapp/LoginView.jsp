<%-- 
    Document   : Login-View
    Created on : Sep 19, 2023, 6:53:30 PM
    Author     : Assin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stiktify</title>
        <link rel="stylesheet" href="CSS/login.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="body">
        <div class="wrapper">
            <span class="bg-animate"></span>
            <!-- Form login -->
            <div class="form-box login">
                <h2 class="animation">Login</h2>
                <form action="login" method="post">
                    <div class="mb-3 mt-3 input-box animation">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter email" name="email">
                    </div>
                    <div class="mb-3 input-box animation">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" name="pswd">
                    </div>
                    <div class="form-check mb-3 animation">
                        <label class="form-check-label">
                            <input class="form-check-input" type="checkbox" name="remember"> Remember me
                        </label>
                    </div>
                    <button type="submit" class="btn-form btn-primary animation">Login</button>
                    <div class="logreg-link animation">
                        <p>
                            Already have an account? <a href="#" class="register-link">Create new</a>
                        </p>
                    </div>
                </form>
            </div>
            <!-- End form login -->
            <!-- Form register -->
            <div class="form-box register">
                <h2 class="animation">Register</h2>
                <form action="">
                    <div class="mb-3 mt-3 input-box animation">
                        <input type="text" class="form-control" placeholder="Enter name" name="name">
                    </div>
                    <div class="mb-3 input-box animation">
                        <input type="password" class="form-control" placeholder="Enter password" name="pswd">
                    </div>
                    <div class="mb-3 input-box animation">
                        <input type="email" class="form-control" placeholder="Enter email" name="email">
                    </div>
                    <div class="mb-3 input-box animation">
                        <input type="date" class="form-control" placeholder="Enter birth date" name="birth">
                    </div>
                    <div class="mb-3 input-box animation">
                        <input type="text" class="form-control" placeholder="Enter address" name="address">
                    </div>
                    <button type="submit" class="btn-form btn-primary animation">Create</button>
                    <div class="logreg-link animation">
                        <p>
                            Already have an account? <a href="#" class="login-link">Login</a>
                        </p>
                    </div>
                </form>
            </div>
            <!-- End form register -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- javascript event for create and login -->
        <script>
            const wrapper = document.querySelector('.wrapper');
            const registerLink = document.querySelector('.register-link');
            const loginLink = document.querySelector('.login-link');

            registerLink.onclick = () => {
                wrapper.classList.add('active');
            };

            loginLink.onclick = () => {
                wrapper.classList.remove('active');
            };
        </script>
        <!-- end javascript -->
    </body>
</html>
