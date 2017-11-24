<%@ Page Title="" Language="C#" MasterPageFile="~/Estilo/TicoParts.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="slnPartes.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function openModalRepuesto() {
            $('#myModal').modal('show');
        }

        function ShowPopUpImage(obj) {
            $('#modalRepuesto').modal('show');
        }

        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 500) / 2 + "px";
            imgDiv.style.top = "20px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }

        function HideDiv() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }
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
                        <div class="panel panel-primary">
                            <div class="panel-heading" style="background-color: #00507a; color: white;">Buscar</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>Tipo Servicio:</label>
                                    <asp:DropDownList ID="ddlTS" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlTS_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Proveedor:</label>
                                    <asp:TextBox runat="server" ID="txtBuscarNombre" CssClass="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Provincia:</label>
                                    <asp:DropDownList ID="ddlProvincia" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Canton:</label>
                                    <asp:DropDownList ID="ddlCanton" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCanton_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
                                <asp:Button ID="btnCancelar" runat="server" Text="Limpiar" CssClass="btn btn-warning" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-10">
                        <div class="panel panel-primary">
                            <div class="panel-heading" style="background-color: #00507a; color: white;">Proveedores</div>
                            <div class="panel-body">
                                <asp:DataList ID="dtlProveedores" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnItemCommand="dtlPartes_ItemCommand" OnSelectedIndexChanged="dtlPartes_SelectedIndexChanged">
                                    <ItemTemplate>
                                        <div class="form-group col-sm-2 text-center">
                                            <div class="panel panel-info">
                                                <div class="panel-heading" style="background-color: #00507a; color: white;">
                                                    <strong style="font-size:small" title="<%# DataBinder.Eval(Container.DataItem, "descripcion") %>"><%# DataBinder.Eval(Container.DataItem, "descripcion").ToString().Length <= 15 ? Eval("descripcion") : Eval("descripcion").ToString().Substring(0, 15)+"..." %></strong>
                                                </div>
                                                <div class="panel-body text-center">
                                                    <div class="thumbnail">
                                                        <img src="<%# DataBinder.Eval(Container.DataItem, "logo") %>" style="width: 100%;" onerror="this.src='Imagenes/Diseno/tpImagenOverlay.png';">
                                                    </div>
                                                    <hr style="color:black"/>
                                                    <label><%# DataBinder.Eval(Container.DataItem, "NombreProveedor") %></label>
                                                    <br />
                                                    <label style="font-size:smaller"><%# DataBinder.Eval(Container.DataItem, "cedula","{0:c}") %></label>
                                                    <br />
                                                    <label style="font-size:smaller"><%# DataBinder.Eval(Container.DataItem, "Provincia") %> , <%# DataBinder.Eval(Container.DataItem, "Canton") %> , <%# DataBinder.Eval(Container.DataItem, "direccion") %></label>
                                                    <br />
                                                    <label style="font-size:smaller"><a href="mailto:<%# DataBinder.Eval(Container.DataItem, "email") %>"> <%# DataBinder.Eval(Container.DataItem, "email") %></a></label>
                                                    <br />
                                                    <label style="font-size:smaller"><%# DataBinder.Eval(Container.DataItem, "telefonos") %></label>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                            <div class="panel-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Repuesto -->
            <div id="modalRepuesto" class="modal fade" role="dialog">
                <div class="modal-dialog modal-lg">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalParte" runat="server"></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            <asp:Label ID="lblParte" runat="server" Text=""></asp:Label>
                                        </div>
                                        <div class="panel-body">
                                            <strong>Clasificacion: </strong>
                                            <asp:Label ID="lblClasificacion" runat="server" Text=""></asp:Label><br />
                                            <strong>Provincia: </strong>
                                            <asp:Label ID="lblProvincia" runat="server" Text=""></asp:Label><br />
                                            <strong>Canton: </strong>
                                            <asp:Label ID="lblCanton" runat="server" Text=""></asp:Label><br />
                                            <strong>Precio: </strong>
                                            <asp:Label ID="lblPrecio" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">Vehiculos</div>
                                        <div class="panel-body">
                                            <asp:ListBox ID="lstVehiculos" runat="server" CssClass="form-control"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">Imagenes</div>
                                        <div class="panel-body">
                                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                <!-- Indicators -->
                                                <ol class="carousel-indicators">
                                                    <asp:Literal ID="ltlIndicadores" runat="server"></asp:Literal>
                                                </ol>

                                                <!-- Wrapper for slides -->
                                                <div class="carousel-inner">
                                                    <asp:Literal ID="ltlImagenes" runat="server"></asp:Literal>
                                                </div>

                                                <!-- Left and right controls -->
                                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">Datos Proveedor</div>
                                        <div class="panel-body">
                                            <strong>Nombre:</strong><asp:Label ID="lblProveedor" runat="server" Text=""></asp:Label><br />
                                            <strong>Tipo:</strong><asp:Label ID="lblTipoProveedor" runat="server" Text=""></asp:Label><br />
                                            <strong>Provincia:</strong><asp:Label ID="lblProvinciaP" runat="server" Text=""></asp:Label><br />
                                            <strong>Canton:</strong><asp:Label ID="lblCantonP" runat="server" Text=""></asp:Label><br />
                                            <strong>Direccion:</strong><asp:Label ID="lblDireccion" runat="server" Text=""></asp:Label><br />
                                            <strong>E-mail: </strong>
                                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label><br />
                                            <strong>Telefono:</strong><br />
                                            <asp:ListBox ID="lstTelefonos" runat="server" CssClass="form-control"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-sm-12">
                                    <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo">Solicitar Informacion</button>
                                    <br />
                                    <div id="demo" class="collapse">
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Nombre:</label>
                                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Telefono:</label>
                                                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label>Correo:</label>
                                                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-sm-1 text-right">
                                                <div class="form-group">
                                                    <label style="color: white;">Solicitar</label>
                                                    <asp:Button ID="btnEnviar" runat="server" Text="Solicitar" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-sm-6 text-left">
                                </div>
                                <div class="col-sm-6 text-right">
                                    <button type="button" class="btn btn-default btn-raised" data-dismiss="modal">Cerrar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="divBackground" class="modal modal-sm">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div id="divImage">
                        <img id="imgLoader" alt="" src="images/loader.gif" class="img-responsive" />
                        <img id="imgFull" alt="" src="" class="img-responsive" />
                </div>
                <div class="modal-footer">
                   <input id="btnClose" type="button" value="Cerrar" onclick="HideDiv()" class="btn btn-primary" />
                </div>
                </div>
                </div>
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>
