<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Display_Student_Info.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Display_Student_Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">

<%--    For Pagination--%>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>


    <div class="container-fluid" style="background-color: white; padding: 20px;">

        <asp:Repeater ID="r1" runat="server">

            <HeaderTemplate>
                <table class="table table-bordered" id="tbl">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Enrollment No</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Status</th>
                            <th>Active</th>
                            <th>Deactive</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>

            <ItemTemplate>

                <tr>
                    <td>
                        <img src="../<%#Eval("Student_Image") %>" alt=" Image Unavilable " height="100" width="100" />
                    </td>
                    <td><%#Eval("FirstName") %></td>
                    <td><%#Eval("LastName") %></td>
                    <td><%#Eval("Enrollment_No") %></td>
                    <td><%#Eval("UserName") %></td>
                    <td><%#Eval("Email") %></td>
                    <td><%#Eval("Contact") %></td>
                    <td><%#Eval("Approved") %></td>
                    <td><a href="Student_Active.aspx?id=<%#Eval("id") %>">Active</a></td>
                    <td><a href="Student_Deactive.aspx?id=<%#Eval("id") %>">Deactive</a></td>
                </tr>


            </ItemTemplate>

            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>


        </asp:Repeater>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#tbl').DataTable({
                "pagingType": "full_numbers"
            });
        });
    </script>
</asp:Content>
