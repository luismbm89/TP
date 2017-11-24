<%@ Page Title="" Language="C#" MasterPageFile="~/Estilo/TicoParts.Master" AutoEventWireup="true" CodeBehind="Contactenos.aspx.cs" Inherits="slnPartes.Contactenos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:Literal ID="ltlMensaje" runat="server" Visible="false"></asp:Literal>
        <div class="panel panel-default">
            <div class="panel-heading"  style="background-color: #00507a; color: white;">
                <div class="panel-title">
                    Contactenos
                </div>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Nombre Completo:</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Telefono:</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Correo:</label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Asunto:</label>
                            <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Mensaje:</label>
                            <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group text-center">
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar"  CssClass="btn btn-primary" OnClick="btnEnviarEmail"/>
                            <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" CssClass="btn btn-warning"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
