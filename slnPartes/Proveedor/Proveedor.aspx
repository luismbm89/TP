<%@ Page Title="" Language="C#" MasterPageFile="~/Estilo/TicoParts.Master" AutoEventWireup="true" CodeBehind="Proveedor.aspx.cs" Inherits="slnPartes.Proveedor.Proveedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function openModalCotizacion() {
            $('#modalCotizacion').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container-fluid">
                <asp:Literal ID="ltlMensaje" runat="server" Visible="false"></asp:Literal>
                <div class="row">
                    <div class="col-sm-2">
                        <nav>
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #00507a; color: white;">
                                        Menu
                                    </div>
                                    <div class="panel-body">
                                        <nav class="col-sm-3">
                                            <asp:Menu ID="Menu1" Width="168px" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
                                                <Items>
                                                    <asp:MenuItem  Text="Empresa" Value="0"></asp:MenuItem>
                                                    <asp:MenuItem Text="Partes" Value="1"></asp:MenuItem>
                                                    <asp:MenuItem Text="Cotizaciones" Value="2"></asp:MenuItem>
                                                    <asp:MenuItem Text="Registro Usuario" Value="3"></asp:MenuItem>
                                                </Items>
                                                <StaticMenuItemStyle CssClass="nav nav-pills nav-stacked" />
                                                <StaticMenuStyle CssClass="nav nav-pills nav-stacked" />
                                                <StaticSelectedStyle CssClass="active" BackColor="#710002" ForeColor="WhiteSmoke" />
                                            </asp:Menu>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <div class="col-sm-10">

                        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                            <!-- View Empresa -->
                            <asp:View ID="tabEmpresa" runat="server">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #00507a; color: white;">Datos Empresa</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>ID Proveedor:</label>
                                                    <asp:TextBox Enabled="false" ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Tipo Proveedor:</label>
                                                    <asp:DropDownList ID="ddlTipoProveedor" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Nombre:</label>
                                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Cédula:</label>
                                                    <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Descripción:</label>
                                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Provincia:</label>
                                                    <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Cantón:</label>
                                                    <asp:DropDownList ID="ddlCanton" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Dirección:</label>
                                                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Correo Electronico:</label>
                                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Telefono:</label>
                                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Tipo Telefono:</label>
                                                    <asp:DropDownList ID="ddlTipoTelefono" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <div class="form-group">
                                                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn btn-primary" />
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="form-group">
                                                    <asp:ListBox ID="lstTelefonos" runat="server" CssClass="form-control"></asp:ListBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-1">
                                                <asp:ImageButton ID="ibtnEliminar" Enabled="false" ImageUrl="~/Imagenes/delete.png" Width="25px" runat="server" OnClick="ibtnEliminar_Click" /><br />
                                                <asp:ImageButton ID="ibtnActualizar" Enabled="false" ImageUrl="~/Imagenes/update.png" Width="25px" runat="server" OnClick="ibtnActualizar_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <asp:Literal ID="ltlEmpresa" runat="server"></asp:Literal>
                                            </div>
                                            <div class="col-sm-4 text-right">
                                                <asp:Button ID="btnGuardarEmprea" runat="server" Text="Guardar" CssClass="btn btn-primary" />
                                                <asp:Button ID="btnCancelarEmpresa" runat="server" Text="Cancelar" CssClass="btn btn-warning" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:View>
                            <!-- View Parte -->
                            <asp:View ID="tabParte" runat="server">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #00507a; color: white;">Partes</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Categoria Parte:</label>
                                                    <asp:DropDownList ID="ddlTP_CatParte" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    <asp:HiddenField ID="hdfTP_txtNoSeq" runat="server" Value="0" />
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Parte:</label>
                                                    <asp:DropDownList ID="ddlTP_Parte" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlTP_Parte_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Descripcion:</label>
                                                    <asp:TextBox ID="txtTP_Descrip" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Provincia:</label>
                                                    <asp:DropDownList ID="ddlTP_Provincia" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlTP_Provincia_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Canton:</label>
                                                    <asp:DropDownList ID="ddlTP_Canton" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Codigo Proveedor:</label>
                                                    <asp:TextBox ID="txtTP_CodProveedor" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Estado de la Parte:</label>
                                                    <asp:DropDownList ID="ddlTP_Clasificacion" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Precio:</label>
                                                    <asp:TextBox ID="txtTP_Precio" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Marca:</label>
                                                    <asp:DropDownList ID="ddlTP_Marca" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlTP_Marca_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Modelo:</label>
                                                    <asp:DropDownList ID="ddlTP_Modelo" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Año:</label>
                                                    <asp:DropDownList ID="ddlTP_Anno" runat="server" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label style="color: #f5f5f5;">:</label><br />
                                                    <asp:Button ID="btnTP_AgregarV" runat="server" Text="Agregar Vehiculo" CssClass="btn btn-default" OnClick="btnTP_AgregarV_Click" />
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-10">
                                                            <label>Vehiculos:</label>
                                                            <asp:ListBox ID="lstTP_Vehiculos" runat="server" CssClass="form-control"></asp:ListBox>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label style="color: white;">:</label>
                                                            <asp:ImageButton ID="iBtnTP_EliminarVehi" Enabled="false" ImageUrl="~/Imagenes/delete.png" Width="25px" runat="server" OnClick="iBtnTP_EliminarVehi_Click" /><br />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <div class="form-group">
                                                            <label>Agrear Imagen:</label>
                                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <asp:Button ID="btnTP_AgregarFotos" runat="server" Text="Agregar Imagen" CssClass="btn btn-default" OnClick="btnTP_AgregarFotos_Click" />
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <asp:Literal ID="ltTP_Parte" runat="server" Visible="false"></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-sm-10">
                                                            <label>Lista de Imagenes:</label>
                                                            <asp:ListBox ID="lstTP_Imagenes" runat="server" CssClass="form-control"></asp:ListBox>
                                                        </div>
                                                        <div class="col-sm-2">
                                                            <label style="color: white;">:</label>
                                                            <asp:ImageButton ID="iBtnTP_EliminarImg" Enabled="false" ImageUrl="~/Imagenes/delete.png" Width="25px" runat="server" OnClick="iBtnTP_EliminarImg_Click" /><br />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label style="color: #f5f5f5;">:</label><br />
                                                    <asp:Button ID="btnTP_GuardaParte" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnTP_GuardaParte_Click" />
                                                    <asp:Button ID="btnTp_Cancel" runat="server" Text="Cancelar" CssClass="btn btn-warning" OnClick="btnTp_Cancel_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="col-sm-12" style="overflow: auto; height: 25vh;">
                                                <asp:GridView ID="grvTP_Partes" runat="server" CssClass="table table-responsive table-hover" OnRowCommand="grvTP_Partes_RowCommand" AutoGenerateColumns="false">
                                                    <HeaderStyle BackColor="#00507a" ForeColor="White" />
                                                    <Columns>
                                                        <asp:BoundField DataField="noSeq" HeaderText="noSeq" Visible="false"></asp:BoundField>
                                                        <asp:BoundField DataField="categoria" HeaderText="Categoria"></asp:BoundField>
                                                        <asp:BoundField DataField="Parte" HeaderText="Parte"></asp:BoundField>
                                                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion"></asp:BoundField>
                                                        <asp:BoundField DataField="Clasificacion" HeaderText="Clasificacion"></asp:BoundField>
                                                        <asp:BoundField DataField="precio" HeaderText="Precio"></asp:BoundField>
                                                        <asp:ButtonField Text="Modificar" CommandName="modificar" ControlStyle-CssClass="btn btn-sm btn-primary"></asp:ButtonField>
                                                        <asp:ButtonField Text="Eliminar" CommandName="eliminar" ControlStyle-CssClass="btn btn-sm btn-warning"></asp:ButtonField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </asp:View>
                            <!-- View Mensajes -->
                            <asp:View ID="tabMensajes" runat="server">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #00507a; color: white;">Cotizaciones</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="col-sm-12" style="overflow: auto; height: 25vh;">
                                                    <asp:GridView ID="grvCotizaciones" runat="server" DataKeyNames="idCotizacion" CssClass="table table-responsive table-hover" AutoGenerateColumns="false" OnRowCommand="grvCotizaciones_RowCommand" OnDataBound="grvCotizaciones_DataBound">
                                                        <HeaderStyle BackColor="#00507a" ForeColor="White" />
                                                        <Columns>
                                                            <asp:BoundField DataField="idCotizacion" HeaderText="ID Cotizacion" Visible="false"></asp:BoundField>
                                                            <asp:BoundField DataField="descripcion" HeaderText="Descripcion"></asp:BoundField>
                                                            <asp:BoundField DataField="Marca" HeaderText="Marca"></asp:BoundField>
                                                            <asp:BoundField DataField="Modelo" HeaderText="Modelo"></asp:BoundField>
                                                            <asp:BoundField DataField="año" HeaderText="Año"></asp:BoundField>
                                                            <asp:BoundField DataField="otrosDatos" HeaderText="Otro Datos"></asp:BoundField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Button runat="server" ID="Contestar"
                                                                        Text="Contestar" CommandName="contestar"
                                                                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ControlStyle-CssClass="btn btn-sm btn-primary" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </asp:View>
                            <asp:View ID="tabUsuarios" runat="server">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #00507a; color: white;">Registro de Usuarios</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Dirección:</label>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                </div>

                <!-- Modal Cotizaciones -->
                <div class="modal fade" id="modalCotizacion" role="dialog">
                    <div class="modal-dialog modal-lg">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #001140; color: white;">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Cotizacion</h4>
                            </div>
                            <div class="modal-body">
                                <!-- Datos del Cliente -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" style="background-color: #00507a; color: white;">Datos del Cliente</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Cliente:</span>
                                                            <asp:TextBox ID="txtCOT_Nombre" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Correo:</span>
                                                            <asp:TextBox ID="txtCOT_Email" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Telefono:</span>
                                                            <asp:TextBox ID="txtCOT_Telefono" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Datos del Vehiculo -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" style="background-color: #00507a; color: white;">Datos del Vehiculo</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Marca:</span>
                                                            <asp:TextBox ID="txtCOT_Marca" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Modelo:</span>
                                                            <asp:TextBox ID="txtCOT_Modelo" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Año:</span>
                                                            <asp:TextBox ID="txtCOT_Anno" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Datos de la Parte -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" style="background-color: #00507a; color: white;">Datos de la Parte</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Parte:</span>
                                                            <asp:TextBox ID="txtCOT_Descripcion" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Datos:</span>
                                                            <asp:TextBox ID="txtCOT_OtrosDatos" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Enviar Informacion -->
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading" style="background-color: #00507a; color: white;">Enviar Informacion</div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-sm-10">
                                                        <div class="input-group">
                                                            <span class="input-group-addon">Mensaje:</span>
                                                            <asp:TextBox ID="txtCOT_Mensaje" CssClass="form-control" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-2">
                                                        <asp:Button ID="btnEnviarCot" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnEnviarCot_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>

            <asp:PostBackTrigger ControlID="btnTP_AgregarV" />
            <asp:PostBackTrigger ControlID="btnTP_AgregarFotos" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
