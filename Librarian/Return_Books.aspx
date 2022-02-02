<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Return_Books.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Return_Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <div class="breadcrumbs">
        <div class="col-sm-4">
            <div class="page-header float-left">
                <div class="page-title">
                    <h1>Return Books</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid" style="min-height: 500px; background-color: white;">
        <br /><br />
        <asp:DataList ID="d1" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered">
                    <tr>
                        <th>Student Enrollment No</th>
                        <th>Books ISBN</th>
                        <th>Books Issue Date</th>
                        <th>Books Approx Return Date</th>
                        <th>Student UserName</th>
                        <th>Is_Book_Returned</th>
                        <th>Book Returned Date</th>
                        <th>Late Day(s)</th>

                        <th>Return Book</th>
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

                    <td><a href="returnBooks.aspx?id=<%#Eval("id") %>">Return Book</a></td>

                </tr>
            </ItemTemplate>

            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:DataList>
    </div>
</asp:Content>
