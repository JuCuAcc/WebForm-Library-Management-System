<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyImagesinfolder.aspx.cs" Inherits="AspNetProject_Jashim.MyImagesinfolder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div style="padding-left: 200px; padding-right: 300px;">  
        <table width="1024px">  
            <tr>  
                <td>  
                    <div style="text-align: center; color: Black; font-size: 18px;">  
                        Crystal Reports With Image 
                    </div>  
                </td>  
            </tr>  
            <tr>  
                <td>  
                    <div style="line-height: 40px; text-align: center;">  
                        <asp:Image ID="imgpro" Height="100" ImageUrl="~/images/noImage.jpg" Width="100" runat="server" />  
                    </div>  
                </td>  
            </tr>  
            <tr>  
                <td align="center">  
                    <asp:FileUpload ID="FileUpload1" runat="server" /><br />  
                    <asp:Button ID="Button1" runat="server" Text="Upload Photo" OnClick="Button1_Click" />  
                </td>  
            </tr>  
        </table>  
    </div> 
    </form>
</body>
</html>
