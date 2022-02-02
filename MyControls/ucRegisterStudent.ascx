<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRegisterStudent.ascx.cs" Inherits="AspNetProject_Jashim.MyControls.ucRegisterStudent" %>
<style type="text/css">
    .auto-style1 {
        width: 136px;
    }

    .auto-style2 {
        height: 21px;
        width: 136px;
    }
    .auto-style3 {
        width: 249px;
    }
    .auto-style4 {
        height: 21px;
        width: 249px;
    }
    .auto-style5 {
        width: 337px;
    }
    .auto-style6 {
        height: 21px;
        width: 337px;
    }
    .auto-style7 {
        width: 249px;
        height: 51px;
    }
    .auto-style8 {
        width: 337px;
        height: 51px;
    }
    .auto-style9 {
        width: 136px;
        height: 51px;
    }
    .auto-style12 {
        width: 268435456px;
    }
    .auto-style13 {
        width: 268435424px;
    }
</style>

<form ID="f1" runat="server">


    <center><h2><strong>Record Student Information</strong></h2></center>
    <center>
        <table cssclass="table table-striped table-bordered table-hover">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td rowspan="11">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>FirstName </strong> </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is Required" ForeColor="Blue">*</asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td class="auto-style4"><strong>LastName</strong></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtLastName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Enrollment No </strong> </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtEnrollmentNo" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvEnrollmentNo" runat="server" ControlToValidate="txtEnrollmentNo" ErrorMessage="Enrollment Number is Required" ForeColor="Blue">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>UserName </strong> </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtUserName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="User Name is Mandatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Password</strong></td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPassword" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage=" Password is Required" ForeColor="Blue">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Email</strong></td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtEmail" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Address Must be valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Blue"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Contact</strong></td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtContact" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact" ErrorMessage="Cell Phone Number is Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"><strong>Select Image </strong> </td>
                <td class="auto-style8">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="240px" />
                </td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style3"><strong>Approved</strong></td>
                <td class="auto-style5">
                    <asp:RadioButtonList ID="rdoApproved" runat="server" RepeatDirection="Horizontal" Height="28px" Width="142px">
                        <asp:ListItem>yes</asp:ListItem>
                        <asp:ListItem>no</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"><strong></strong></td>
                <td class="auto-style5">
                    <asp:Button ID="btnRegister" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Blue" Height="56px" Text="Register" Width="148px" OnClick="btnRegister_Click" />
                </td>
                <td colspan="2" rowspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
    </center>
    <br />
    <center><h2><strong>Student Information</strong></h2></center>
    <table>
        <tr>
            <td colspan="3" rowspan="6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered table-hover">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                        <asp:TemplateField HeaderText="Id" InsertVisible="False" SortExpression="Id">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Enrollment No" SortExpression="Enrollment_No">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Enrollment_No") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Enrollment_No") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Password" SortExpression="Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email" SortExpression="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact" SortExpression="Contact">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Contact") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Contact") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderImageUrl="../Librarian/images/useravatar.png" HeaderText="Student Image" SortExpression="Student_Image">
                            <EditItemTemplate>
                                <asp:Image ID="TextBox8" runat="server" Text='<%# Eval("Student_Image") %>'/>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Student_Image") %>' />
                            </ItemTemplate>
                            <ControlStyle Height="100px" Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Approved" SortExpression="Approved">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Approved") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Approved") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbCon %>" 
                    DeleteCommand="DELETE FROM [Student_Registration] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Student_Registration] ([FirstName], [LastName], [Enrollment_No], [UserName], [Password], [Email], [Contact], [Student_Image], [Approved]) VALUES (@FirstName, @LastName, @Enrollment_No, @UserName, @Password, @Email, @Contact, @Student_Image, @Approved)" 
                    SelectCommand="SELECT * FROM [Student_Registration]" 
                    UpdateCommand="UPDATE [Student_Registration] SET [FirstName] = @FirstName, [LastName] = @LastName, [Enrollment_No] = @Enrollment_No, [UserName] = @UserName, [Password] = @Password, [Email] = @Email, [Contact] = @Contact, [Student_Image] = @Student_Image, [Approved] = @Approved WHERE [Id] = @Id">

                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Enrollment_No" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Student_Image" Type="String" />
                        <asp:Parameter Name="Approved" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="Enrollment_No" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Student_Image" Type="String" />
                        <asp:Parameter Name="Approved" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>

    </table>
</form>

