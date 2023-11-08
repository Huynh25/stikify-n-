<%-- 
    Document   : Setting
    Created on : Nov 7, 2023, 9:45:38 PM
    Author     : Assin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Content Setting Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <style>
            /* Custom CSS styles */
            body {
                padding-top: 50px;
                background-color: #f8f9fa;
            }

            .head-content {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
                color: #333;
            }

            .section {
                margin-bottom: 20px;
                padding: 20px;
                background-color: #fff;
                border-radius: 4px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .section-title {
                margin-top: 0;
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }

            .input-box {
                margin-bottom: 20px;
            }

            .input-box label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .input-box input[type="password"],
            .input-box input[type="email"] {
                border: 1px solid #ccc;
                border-radius: 4px;
                padding: 8px;
                width: 100%;
            }

            .btn-primary {
                margin-top: 20px;
            }

            .btn-danger,
            .btn-secondary {
                margin-top: 10px;
            }

            .btn-danger {
                background-color: #dc3545;
                border-color: #dc3545;
            }

            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }

            .btn-danger:hover,
            .btn-secondary:hover {
                background-color: #c82333;
                border-color: #bd2130;
            }

            .btn-default {
                background-color: #f8f9fa;
                border-color: #ccc;
                color: #333;
            }

            .btn-default:hover {
                background-color: #e2e6ea;
                border-color: #bdbdbd;
                color: #333;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="head-content">
                <h1>Setting</h1>
                <a href="explore" class="btn btn-default">Back</a>
            </div>
            <div class="btn-group-vertical">
                <div>
                    <button type="button" class="btn" data-toggle="collapse" data-target="#changePass">Change password</button>
                    <div class="col-md-8"></div>
                    <div id="changePass" class="collapse">
                        <h3>Change password</h3>
                        <div>
                            <form action="action" value="changePass">
                                <div class="mb-3 input-box animation">
                                    <input type="password" class="form-control" id="currentPass" name="currentPass" placeholder="Enter current password" required>
                                </div>
                                <div class="mb-3 input-box animation">
                                    <input type="password" class="form-control" id="newPass" name="newPass" placeholder="Enter new password" required>
                                </div>
                                <div class="mb-3 input-box animation">
                                    <input type="password" class="form-control" id="confirmPass" name="confirmPass" placeholder="Enter confirm password">
                                </div>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="btn" data-toggle="collapse" data-target="#changeEmail">Change email</button>
                    <div class="col-md-8"></div>
                    <div id="changeEmail" class="collapse">
                        <h3>Change email</h3>
                        <div>
                            <form action="action" value="changeEmail" id="changeEmail">
                                <div class="mb-3 mt-3 input-box animation">
                                    <input type="email" class="form-control" id="currentEmail" name="currentEmail" placeholder="Enter current email" required>
                                </div>
                                <div class="mb-3 mt-3 input-box animation">
                                    <input type="email" class="form-control" id="newEmail" name="newEmail" placeholder="Enter new email" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="btn" data-toggle="collapse" data-target="#changeMode">Change mode</button>
                    <div class="col-md-8"></div>
                    <div id="changeMode" class="collapse">
                        <h3>Change mode</h3>
                        <div>
                            <button type="button" class="btn btn-default">Dark mode</button>
                        </div>
                    </div>
                </div>
                <a href="deleteAccount?value=${sessionScope.username}" type="button" class="btn btn-danger">Delete account</a>
                <a href="logout" type="button" class="btn btn-secondary">Logout</a>
            </div>

        </div>
        </<script>
<!-- Include jQuery library -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>
        $(document).ready(function () {
                    // Xử lý sự kiện submit của biểu mẫu
                    $("#passwordForm").submit(function(event) {
            event.preventDefault(); // Ngăn chặn hành vi mặc định của nút submit

                    // Kiểm tra mật khẩu mới và xác nhận mật khẩu phải giống nhau
                    var newPassword = $("#newPass").val();
                    var confirmPass = $("#confirmPass").val();
                    if (newPassword !== confirmPass) {
            alert("New password and confirm password do not match.");
                    return;
            }

            // Thực hiện các hành động khác, ví dụ: gửi yêu cầu AJAX để thay đổi mật khẩu

            // Sau khi thực hiện thành công, bạn có thể thêm hiệu ứng hoặc thông báo thành công
            alert("Password changed successfully!");
            });

            // Hiệu ứng animation khi người dùng nhập vào ô input
            $(".input-box input").focus(function () {
                $(this).closest(".input-box").addClass("active");
            });

            $(".input-box input").blur(function() {
            if ($(this).val() === "") {
            $(this).closest(".input-box").removeClass("active");
            }
            });
}              );
                </script>
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </body>
</html>
