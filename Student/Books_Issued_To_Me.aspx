<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="Books_Issued_To_Me.aspx.cs" Inherits="AspNetProject_Jashim.Student.Books_Issued_To_Me" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>Books Issue Details</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid" style="min-height: 500px; background-color: white;">

        <asp:DataList ID="d1" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered">
                    <tr>
                        <th>Student_Enrollment_No</th>
                        <th>Books_Isbn</th>
                        <th>Books_Issue_Date</th>
                        <th>Books_Approx_Return_Date</th>
                        <th>Student_UserName</th>
                        <th>Is_Book_Returned</th>
                        <th>Book_Returned_Date</th>
                        <th>Late_Day</th>
                    </tr>

            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                    <td><%#Eval("Student_Enrollment_No") %></td>
                    <td><%#Eval("Books_Isbn") %></td>
                    <td><%#Eval("Books_Issue_Date") %></td>
                    <td><%#Eval("Books_Approx_Return_Date") %></td>
                    <td><%#Eval("Student_UserName") %></td>
                    <td><%#Eval("Is_Book_Returned") %></td>
                    <td><%#Eval("Book_Returned_Date") %></td>
                    <td><%#Eval("Late_Day") %></td>

                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:DataList>
    </div>


</asp:Content>
