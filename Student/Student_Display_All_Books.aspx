<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.Master" AutoEventWireup="true" CodeBehind="Student_Display_All_Books.aspx.cs" Inherits="AspNetProject_Jashim.Student.Student_Display_All_Books" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <%--    For Pagination--%>
    <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" type="text/css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong class="card-title">Books Table</strong>
            </div>
            <div class="card-body">
                <%--Note: HeaderTemplate and FooterTemplate will repeate 1 time only but
                ItemTemplate will repeate as long as item exist.--%>
                <asp:Repeater ID="r1" runat="server">
                    <HeaderTemplate>
                        <table class="table" id="tbl">
                            <thead>
                                <tr>
                                    <th scope="col">Books Image </th>
                                    <th scope="col">Books  Title</th>
                                    <th scope="col">Books PDF </th>
                                    <th scope="col">Books Video</th>
                                    <th scope="col">Author Name </th>
                                    <th scope="col">ISBN </th>
                                    <th scope="col">Available Quantity </th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
                            <td>
                                <img src=" ../<%#Eval("Books_Image")%>" height="100" width="100" /></td>
                            <td><%#Eval("Books_Title") %></td>
                            <td><%#Eval("Books_Pdf") %>
                                <br />
                                <%#CheckPdf(Eval("Books_Pdf"),Eval("id"))%></td>
                            <td><%#Eval("Books_Video") %>
                                <br />
                                <%#CheckVideo(Eval("Books_Video"),Eval("id"))%></td>
                            <td><%#Eval("Books_Author_Name") %></td>
                            <td><%#Eval("Books_Isbn") %></td>
                            <td><%#Eval("available_Quantity") %></td>
                        </tr>
                    </ItemTemplate>

                    <FooterTemplate>
                        </tbody>
                </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#tbl').DataTable({
                "pagingType": "full_numbers"
            });
        });
    </script>

</asp:Content>
