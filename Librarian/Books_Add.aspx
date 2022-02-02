<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Books_Add.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Books_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong class="card-title">Add New Book</strong>
            </div>
            <div class="card-body">
                <div id="pay-invoice">
                    <div class="card-body">

                        <form action="" id="form1" runat="server" method="post" novalidate="novalidate">

                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Title </label>
                                <asp:TextBox ID="txtBooksTitle" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Image </label>
                                <asp:FileUpload ID="f1" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book PDF </label>
                                <asp:FileUpload ID="f2" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Video </label>
                                <asp:FileUpload ID="f3" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Author Name </label>
                                <asp:TextBox ID="txtAuthorName" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book ISBN </label>
                                <asp:TextBox ID="txtIsbn" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Quantity </label>
                                <asp:TextBox ID="txtQty" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <div>
                                <asp:Button ID="btnAddBook" runat="server" Text="Add Book" class="btn btn-lg btn-info btn-block" OnClick="btnAddBook_Click"/>
                            </div>
                            <div class="alert alert-success" ID="msg" runat="server" style="margin-top:10px; display:none;">
                                <strong>Book Added Successfully.</strong> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
