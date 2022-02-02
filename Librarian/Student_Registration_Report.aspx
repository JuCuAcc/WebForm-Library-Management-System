<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Student_Registration_Report.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Student_Registration_Report" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <form id="form1" runat="server">
    <p>
        <br />
    </p>
    <p>
    </p>
    <p>
        <asp:Button ID="btnShowReport" runat="server" Font-Bold="True" Font-Size="Larger" OnClick="btnShowReport_Click" Text="Show Report" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CrystalReportSource1" ToolPanelWidth="200px" Width="350px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Reports\Student_Registration_Information.rpt">
        </Report>
    </CR:CrystalReportSource>
    <p>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</form>
</asp:Content>
