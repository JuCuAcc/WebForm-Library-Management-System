<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Book_List_View.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.XmlDataSourceView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <form id="form1" runat="server">
        <center>
            <h2>Book List</h2>
        </center>
        <p>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource1" GroupItemCount="3" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color: #FFF8DC;">Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        Books Title:
                        <asp:Label ID="Books_TitleLabel" runat="server" Text='<%# Eval("Books_Title") %>' />
                        <br />
                        Books Author Name:
                        <asp:Label ID="Books_Author_NameLabel" runat="server" Text='<%# Eval("Books_Author_Name") %>' />
                        <br />
                        Books Isbn:
                        <asp:Label ID="Books_IsbnLabel" runat="server" Text='<%# Eval("Books_Isbn") %>' />
                        <br />
                        Available Quantity:
                        <asp:Label ID="available_QuantityLabel" runat="server" Text='<%# Eval("available_Quantity") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color: #008A8C; color: white;">Id:
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        Books Title:
                        <asp:TextBox ID="Books_TitleTextBox" runat="server" Text='<%# Bind("Books_Title") %>' />
                        <br />
                        Books Author Name:
                        <asp:TextBox ID="Books_Author_NameTextBox" runat="server" Text='<%# Bind("Books_Author_Name") %>' />
                        <br />
                        Books Isbn:
                        <asp:TextBox ID="Books_IsbnTextBox" runat="server" Text='<%# Bind("Books_Isbn") %>' />
                        <br />
                        Available Quantity:
                        <asp:TextBox ID="available_QuantityTextBox" runat="server" Text='<%# Bind("available_Quantity") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">Books Title:
                        <asp:TextBox ID="Books_TitleTextBox" runat="server" Text='<%# Bind("Books_Title") %>' />
                        <br />
                        Books Author Name:
                        <asp:TextBox ID="Books_Author_NameTextBox" runat="server" Text='<%# Bind("Books_Author_Name") %>' />
                        <br />
                        Books Isbn:
                        <asp:TextBox ID="Books_IsbnTextBox" runat="server" Text='<%# Bind("Books_Isbn") %>' />
                        <br />
                        Available Quantity:
                        <asp:TextBox ID="available_QuantityTextBox" runat="server" Text='<%# Bind("available_Quantity") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color: #DCDCDC; color: #000000;">Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        Books Title:
                        <asp:Label ID="Books_TitleLabel" runat="server" Text='<%# Eval("Books_Title") %>' />
                        <br />
                        Books Author Name:
                        <asp:Label ID="Books_Author_NameLabel" runat="server" Text='<%# Eval("Books_Author_Name") %>' />
                        <br />
                        Books Isbn:
                        <asp:Label ID="Books_IsbnLabel" runat="server" Text='<%# Eval("Books_Isbn") %>' />
                        <br />
                        Available Quantity:
                        <asp:Label ID="available_QuantityLabel" runat="server" Text='<%# Eval("available_Quantity") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <br />
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: white; font-weight: bold; color: #FFFFFF;">Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        Books Title:
                        <asp:Label ID="Books_TitleLabel" runat="server" Text='<%# Eval("Books_Title") %>' />
                        <br />
                        Books Author Name:
                        <asp:Label ID="Books_Author_NameLabel" runat="server" Text='<%# Eval("Books_Author_Name") %>' />
                        <br />
                        Books Isbn:
                        <asp:Label ID="Books_IsbnLabel" runat="server" Text='<%# Eval("Books_Isbn") %>' />
                        <br />
                        Available Quantity:
                        <asp:Label ID="available_QuantityLabel" runat="server" Text='<%# Eval("available_Quantity") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" DeleteCommand="DELETE FROM [Books] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Books] ([Books_Title], [Books_Author_Name], [Books_Isbn], [available_Quantity]) VALUES (@Books_Title, @Books_Author_Name, @Books_Isbn, @available_Quantity)" SelectCommand="SELECT [Id], [Books_Title], [Books_Author_Name], [Books_Isbn], [available_Quantity] FROM [Books]" UpdateCommand="UPDATE [Books] SET [Books_Title] = @Books_Title, [Books_Author_Name] = @Books_Author_Name, [Books_Isbn] = @Books_Isbn, [available_Quantity] = @available_Quantity WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Books_Title" Type="String" />
                    <asp:Parameter Name="Books_Author_Name" Type="String" />
                    <asp:Parameter Name="Books_Isbn" Type="String" />
                    <asp:Parameter Name="available_Quantity" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Books_Title" Type="String" />
                    <asp:Parameter Name="Books_Author_Name" Type="String" />
                    <asp:Parameter Name="Books_Isbn" Type="String" />
                    <asp:Parameter Name="available_Quantity" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</asp:Content>
