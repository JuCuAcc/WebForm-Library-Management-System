<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Registration.aspx.cs" Inherits="AspNetProject_Jashim.Student.Student_Registration" %>

<!DOCTYPE html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Student Registration Form</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/scss/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


</head>
<body class="bg-dark">


    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container">
            <div class="login-content">
                <div class="login-logo">
                        <h1 style="color: white;">Student Registration</h1>                    
                </div>
                <div class="login-form">
                    <form id="StudentForm1" runat="server">
                        <div class="form-group">
                            <label>First Name</label>
                            <asp:TextBox ID="txtStudentFirstName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtStudentLastName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Enrollment No</label>
                            <asp:TextBox ID="txtStudentEnrollmentNo" runat="server" class="form-control" placeholder="Enrollment Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>User Name</label>
                            <asp:TextBox ID="txtStudentUserName" runat="server" class="form-control" placeholder="User Name"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtStudentPassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtStudentEmail" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Contact No</label>
                            <asp:TextBox ID="txtStudentContact" runat="server" class="form-control" placeholder="Contact Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Select Image</label>
                            <asp:FileUpload ID="f1" runat="server" />
                        </div>
                        <div class="form-group">

                            <div id="ReCaptchContainer"></div>
                            <asp:Label ID="lblMessage1" runat="server"></asp:Label>
                        </div>
                        <asp:Button ID="btnStudentRegister" runat="server" Text="Register Now" class="btn btn-primary btn-flat m-b-30 m-t-30" OnClick="btn_Click" />

                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://www.google.com/recaptcha/api.js?onload=renderRecaptcha&render=explicit" async defer></script>
    <script type="text/javascript">
        var your_site_key = '6LcGUoocAAAAAD4rTtkD8D5yFNTjmMQgRFFxAYsY'; //SiteKeyFromGoogle
        var renderRecaptcha = function () {
            grecaptcha.render('ReCaptchContainer', {
                'sitekey': '6LcGUoocAAAAAD4rTtkD8D5yFNTjmMQgRFFxAYsY',
                'callback': reCaptchaCallback,
                theme: 'light', //light or dark
                type: 'image',// image or audio
                size: 'normal'//normal or compact
            });
        };
        var reCaptchaCallback = function (response) {
            if (response !== '') {
                document.getElementById('lblMessage1').innerHTML = "";
            }
        };
    </script>

    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>


</body>
</html>
