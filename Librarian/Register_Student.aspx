<%@ Page Title="" Language="C#" MasterPageFile="~/Librarian/Librarian.Master" AutoEventWireup="true" CodeBehind="Register_Student.aspx.cs" Inherits="AspNetProject_Jashim.Librarian.Register_Student" %>

<%@ Register Src="~/MyControls/ucRegisterStudent.ascx" TagPrefix="uc1" TagName="ucRegisterStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C1" runat="server">
    <uc1:ucRegisterStudent runat="server" id="ucRegisterStudent" />
</asp:Content>
