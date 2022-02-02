<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Edit_Books.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Edit_Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <div class="col-lg-12">
        <div class="card">
            <div class="card-header">
                <strong class="card-title">Update Books</strong>
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
                                <label for="" class="control-label mb-1">Book Image </label><br />
                                <asp:Label ID="booksimage" runat="server" Text=""></asp:Label>
                                <asp:FileUpload ID="f1" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book PDF </label><br />
                                <asp:Label ID="bookspdf" runat="server" Text=""></asp:Label>
                                <asp:FileUpload ID="f2" runat="server" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label for="" class="control-label mb-1">Book Video </label><br />
                                <asp:Label ID="booksvideo" runat="server" Text=""></asp:Label>
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
                                <asp:Button ID="btnUpdateBook" runat="server" Text="Update Book" class="btn btn-lg btn-info btn-block" OnClick="btnAddBook_Click" />
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
