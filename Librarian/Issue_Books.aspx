<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Issue_Books.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Issue_Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
        <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong class="card-title">Issue Book</strong>
            </div>
            <div class="card-body">
                <div id="pay-invoice">
                    <div class="card-body">

                        <form action="" id="form1" runat="server" method="post" novalidate="novalidate">

                            <div class="form-group">
                                <label for="" class="control-label mb-1">Select Enrollment No</label>
                                <asp:DropDownList ID="ddlSelectEnrollmentNo" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlSelectEnrollmentNo_SelectedIndexChanged" ></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book ISBN</label>
                                <asp:DropDownList ID="ddlBookIsbn" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlBookIsbn_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList>
                            </div>
                            <div class="form-group">

                                <asp:Image ID="imgBook" runat="server" height="150" Width="150" /><br />
                                <asp:Label ID="lblBookName" runat="server" Text=""></asp:Label><br />
                                <asp:Label ID="lblInStock" runat="server" Text=""></asp:Label><br />

                            </div>
                            
                            <div>
                                <asp:Button ID="btnIssueBook" runat="server" Text="Issue Book" class="btn btn-lg btn-info btn-block" OnClick="btnAddBook_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
