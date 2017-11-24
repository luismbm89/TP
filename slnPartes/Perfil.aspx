<%@ Page Title="" Language="C#" MasterPageFile="~/Estilo/TicoParts.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="slnPartes.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script type='text/javascript'>
    $(function(){
        // Define your mask (using 9 to denote any digit)
        $('#txtTelefono').mask('999-99-9999');
    });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
                               <div class="panel-heading" style="background-color: #00507a; color: white;">Perfil de <%=Session["user"].ToString().ToUpper() %> </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Identificación:</label>
                                                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" autofocus="true"></asp:TextBox>
                                                </div>
                                            </div>
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Nombre:</label>
                                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Primer Apellido:</label>
                                                    <asp:TextBox ID="txtApellido1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Segundo Apellido:</label>
                                                    <asp:TextBox ID="txtApellido2" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Rol:</label>
                                                    <asp:TextBox ID="txtRol" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                </div>
                                            </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Usuario:</label>
                                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Clave:</label>
                                                    <asp:TextBox ID="txtClave" type="password" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Correo:</label>
                                                    <asp:TextBox ID="txtCorreo" type="email" runat="server" CssClass="form-control" placeholder="ej. pepe@dominio.com"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCorreo" ErrorMessage="Formato Incorrecto ej. pepe@dominio.com" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                                <div class="col-sm-2">
                                                <div class="form-group">
                                                    <label>Teléfono:</label>
                                                    <asp:TextBox ID="txtTelefono" type="tel" runat="server" CssClass="form-control" placeholder="ej. 8765-4321"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Formato Incorrecto ej. 8765-4321" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{4}-\d{4}"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                                </div>
                                            </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="col-sm-2">
                                                <div class="form-group"> 
                                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Guardar" />
                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
        </div>
</div>
</asp:Content>
