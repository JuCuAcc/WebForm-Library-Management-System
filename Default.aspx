<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspNetProject_Jashim._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            padding-top: 60px;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

            li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

                /* Changing the link color to #111 (black) on hover */
                li a:hover {
                    background-color: #111;
                }

        @media (max-width: 979px) {
            body {
                padding-top: 0px;
            }
        }
    </style>
    <div>
        <nav>
            <ul>
                <li><a runat="server" href="Librarian/Login.aspx">Librarian Login</a></li>
                <li><a runat="server" href="Student/Student_Login.aspx">Student Login</a></li>
            </ul>
        </nav>
    </div>
    <div style="background-color: azure;">
        <div class="jumbotron" style="background-color: antiquewhite;">
            <h1 style="color: purple; text-align: center;">Programmer Library</h1>
            <p class="lead" style="color: deeppink; text-align: center;">Programmer Library is a great place to find almost all best programming books in the world.</p>
            <br />
            <p style="text-align: right;"><a href="https://en.wikipedia.org/wiki/Public_library" class="btn btn-success btn-lg">Learn more &raquo;</a></p>
        </div>

        <div class="row">
            <div class="col-md-4" style="background-color: antiquewhite;">
                <h2>Getting started</h2>
                <p>
                    A subscription library (also membership library or independent library) is a library that is financed by private funds either from membership fees or endowments. Unlike a public library, access is often restricted to members, but access rights can also be given to non-members, such as students.
                </p>
                <p>
                    <a class="btn btn-primary" href="https://en.wikipedia.org/wiki/Subscription_library">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4" style="background-color: antiquewhite;">
                <h2>Get more libraries</h2>
                <p>
                    In computer science, a library is a collection of non-volatile resources used by computer programs, often for software development. These may include configuration data, documentation, help data, message templates, pre-written code and subroutines, classes, values or type specifications. In IBM's OS/360 and its successors they are referred to as partitioned data sets.
                </p>
                <p>
                    <a class="btn btn-primary" href="https://en.wikipedia.org/wiki/Library_(computing)">Learn more &raquo;</a>
                </p>
            </div>
            <div class="col-md-4" style="background-color: antiquewhite;">
                <h2>Web Hosting</h2>
                <p>
                    You can easily find a web hosting company that offers the right mix of features and price for your applications.
                </p>
                <p>
                    <a class="btn btn-primary" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                </p>
            </div>
        </div>
    </div>

</asp:Content>
