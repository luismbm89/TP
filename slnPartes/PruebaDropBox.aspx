<%@ Page Title="" Language="C#" MasterPageFile="~/Estilo/TicoParts.Master" AutoEventWireup="true" CodeBehind="PruebaDropBox.aspx.cs" Inherits="slnPartes.PruebaDropBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:fileupload runat="server" id="flImage"></asp:fileupload><br />
    <asp:button runat="server" text="Subir" id="btnSubir" onclick="Unnamed2_ClickAsync" />
    <asp:label runat="server" text="" id="lblResult"></asp:label>
</asp:Content>
