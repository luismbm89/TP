using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using Entidad;
using System.Text;

namespace slnPartes
{
    public partial class partes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                llenarComboAnno();
                llenarComboMarca();
                llenarComboProvincia();
                llenarDtlParte();
            }
        }

        private void llenarComboProvincia()
        {
            try
            {
                ddlProvincia.Items.Clear();
                ddlProvincia.DataSource = PaisBLL.obtenerProvicia();
                ddlProvincia.DataTextField = "provincia";
                ddlProvincia.DataValueField = "idProvincia";
                ddlProvincia.DataBind();
                ddlProvincia.Items.Insert(0, "-- Todas --");

            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Provincias";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboMarca()
        {
            try
            {
                ddlMarca.Items.Clear();
                ddlMarca.DataSource = VehiculoBLL.obtenerMarca();
                ddlMarca.DataTextField = "Marca";
                ddlMarca.DataValueField = "idMarca";
                ddlMarca.DataBind();
                ddlMarca.Items.Insert(0, "-- Todas --");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Marcas";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboAnno()
        {
            try
            {
                for (int i = DateTime.Now.Year; i >= 1960; i--)
                {
                    ddlAnno.Items.Add(i.ToString());
                }
                ddlAnno.Items.Insert(0, "-- Todos --");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al llenar la lista de año";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarDtlParte()
        {
            try
            {
                dtlPartes.DataSource = ParteBLL.obtenerParte();
                dtlPartes.DataBind();
            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las partes - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void dtlPartes_ItemCommand(object source, DataListCommandEventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append(@"<script type='text/javascript'>");
            sb.Append("$(function () {");
            sb.Append(" $('#modalRepuesto').modal('show');});");
            sb.Append("</script>");
            ltlIndicadores.Text = "<li data-target='#myCarousel' data-slide-to='0' class='Active'></li>";
            ltlImagenes.Text = "<div class='item active'><img src='../Imagenes/Diseno/tpImagenOverlay.png' alt='TP'></div>";
            llenarModalRepuesto(Convert.ToInt32(e.CommandArgument.ToString()));
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
        }

        private void llenarModalRepuesto(int idParte)
        {
            int idProveedor = 0;
            try
            {
                //Informacion de la Parte
                foreach (DataRow row in ParteBLL.obtenerParte(idParte).Rows)
                {
                    lblModalParte.Text = row["Parte"].ToString();
                    lblParte.Text = row["Parte"].ToString();
                    lblClasificacion.Text = row["Clasificacion"].ToString();
                    lblProvincia.Text = row["provincia"].ToString();
                    lblCanton.Text = row["Canton"].ToString();
                    lblPrecio.Text = row["precio"].ToString();
                    idProveedor = Convert.ToInt32(row["idProveedor"].ToString());
                }

                //Informacion de Vehiculos
                lstVehiculos.Items.Clear();
                foreach (DataRow row in ParteBLL.obtenerVehiculoParte(idParte).Rows)
                {
                    lstVehiculos.Items.Add(new ListItem(new Vehiculo(row["Marca"].ToString(), row["Modelo"].ToString(), row["anno"].ToString()).ToString()));
                }

                //Informacion Imagenes
                int i = 0;
                foreach (DataRow row in ParteBLL.obtenerParteImagen(idParte).Rows)
                {
                    if (i == 0)
                    {
                        ltlIndicadores.Text = "<li data-target='#myCarousel' data-slide-to='" + i + "' class='Active'></li>";
                        ltlImagenes.Text = "<div class='item active img'><img src='" + row["rutaImagen"].ToString() + "' OnClientClick='return LoadDiv(this.src);'></div>";
                    }
                    else
                    {
                        ltlIndicadores.Text += "<li data-target='#myCarousel' data-slide-to='" + i + "'></li>";
                        ltlImagenes.Text += "<div class='item img'><img src='" + row["rutaImagen"].ToString() + "' OnClientClick='return LoadDiv(this.src);'></div>";
                    }

                    i++;
                }

                //Informacion Proveedor
                foreach (DataRow row in ProveedorBLL.obtenerInfoProveedor(idProveedor).Rows)
                {
                    lblProveedor.Text = row["NombreProveedor"].ToString();
                    lblTipoProveedor.Text = row["tipoProveedor"].ToString();
                    lblProvinciaP.Text = row["provincia"].ToString();
                    lblCantonP.Text = row["Canton"].ToString();
                    lblDireccion.Text = row["direccion"].ToString();
                    lblEmail.Text = row["email"].ToString();
                }

                //Obtener Telefono Proveedor
                lstTelefonos.Items.Clear();
                if (ProveedorBLL.obtenerTelProveedor(idProveedor) != null)
                {
                    foreach (DataRow row in ProveedorBLL.obtenerTelProveedor(idProveedor).Rows)
                    {
                        lstTelefonos.Items.Add(row["telefono"].ToString());
                    }
                }

            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar la informacion de la parte - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarComboModelo();
            aplicarFiltro();
        }

        private void llenarComboModelo()
        {
            try
            {
                ddlModelo.Items.Clear();
                ddlModelo.DataSource = VehiculoBLL.obtenerModelo(Convert.ToInt32(ddlMarca.SelectedValue));
                ddlModelo.DataTextField = "Modelo";
                ddlModelo.DataValueField = "idModelo";
                ddlModelo.DataBind();
                ddlModelo.Items.Insert(0, "-- Todos --");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los Modelos";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlCanton.Items.Clear();
                if (ddlProvincia.SelectedIndex != 0)
                {
                    ddlCanton.DataSource = PaisBLL.obtenerCanton(Convert.ToInt32(ddlProvincia.SelectedValue));
                    ddlCanton.DataTextField = "Canton";
                    ddlCanton.DataValueField = "idCanton";
                    ddlCanton.DataBind();
                }
                ddlCanton.Items.Insert(0, "-- Todos --");
                aplicarFiltro();
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar el Canton";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void dtlPartes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dtlPartes.SelectedIndex != -1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalRepuesto();", true);
            }
        }

        protected void ddlAnno_SelectedIndexChanged(object sender, EventArgs e)
        {
            aplicarFiltro();

        }

        private void aplicarFiltro()
        {
            try
            {
                DataView dv = new DataView(ParteBLL.obtenerParte());
                if (ddlAnno.SelectedIndex > 0)
                {
                    dv.RowFilter = String.Format("anno like '%{0}%'", ddlAnno.SelectedItem.Text);
                }

                if (ddlMarca.SelectedIndex > 0)
                {
                    dv.RowFilter = String.Format("Marca like'%{0}%'", ddlMarca.SelectedValue);
                }

                if (ddlModelo.SelectedIndex > 0)
                {
                    dv.RowFilter = String.Format("Modelo like'%{0}%'", ddlModelo.SelectedItem.Text);
                }

                if (ddlProvincia.SelectedIndex > 0)
                {
                    dv.RowFilter = String.Format("provincia like'%{0}%'", ddlProvincia.SelectedItem.Text);
                }
                if (ddlCanton.SelectedIndex > 0)
                {
                    dv.RowFilter = String.Format("Canton like'%{0}%'", ddlCanton.SelectedItem.Text);
                }


                dtlPartes.DataSource = dv;
                dtlPartes.DataBind();
            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al Aplicar filtro - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void ddlModelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            aplicarFiltro();
        }

        protected void ddlCanton_SelectedIndexChanged(object sender, EventArgs e)
        {
            aplicarFiltro();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EnviarCorreo oEnviarCorreo = new EnviarCorreo();

            string destinatario = lblEmail.Text;
            string Remitente = txtCorreo.Text;
            string Nombre = txtNombre.Text;
            string telefono = txtTelefono.Text;
            string asunto = lblParte.Text;

            StringBuilder sb = new StringBuilder();
            //Style
            sb.Append("<style>.demo {width:100%;border:1px solid #C0C0C0;border-collapse:collapse;padding:5px;}");
            sb.Append("div.blueTable {font-family: Arial, Helvetica, sans-serif;border: 1px solid #1C6EA4;background-color: #EEEEEE;width: 100%;text-align: left;border-collapse: collapse;}");
            sb.Append(".divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {border: 1px solid #AAAAAA;padding: 3px 2px;}");
            sb.Append(".divTable.blueTable .divTableBody .divTableCell {font-size: 13px;}");
            sb.Append(".divTable.blueTable .divTableRow:nth-child(even) {background: #FFFFFF;}");
            sb.Append(".divTable.blueTable .divTableHeading {background: #00507A; background: -moz-linear-gradient(top, #407c9b 0%, #196187 66%, #00507A 100%);");
            sb.Append("background: -webkit-linear-gradient(top, #407c9b 0%, #196187 66%, #00507A 100%);");
            sb.Append("background: linear-gradient(to bottom, #407c9b 0%, #196187 66%, #00507A 100%);border-bottom: 2px solid #444444;}");
            sb.Append(".divTable.blueTable .divTableHeading .divTableHead {font-size: 15px;font-weight: bold;color: #FFFFFF;text-align: center;border-left: 2px solid #D0E4F5;}");
            sb.Append(".divTable.blueTable .divTableHeading .divTableHead:first-child {border-left: none;}");
            sb.Append(".blueTable .tableFootStyle {font-size: 14px;}");
            sb.Append(".blueTable .tableFootStyle .links {text-align: right;}");
            sb.Append(".blueTable .tableFootStyle .links a{display: inline-block;background: #1C6EA4;color: #FFFFFF;padding: 2px 8px;border-radius: 5px;}");
            sb.Append(".blueTable.outerTableFooter {border-top: none;}");
            sb.Append(".blueTable.outerTableFooter .tableFootStyle {padding: 3px 5px");
            /* DivTable.com */
            sb.Append(".divTable{ display: table; }");
            sb.Append(".divTableRow { display: table-row; }");
            sb.Append(".divTableHeading { display: table-header-group;}");
            sb.Append(".divTableCell, .divTableHead { display: table-cell;}");
            sb.Append(".divTableHeading { display: table-header-group;}");
            sb.Append(".divTableFoot { display: table-footer-group;}");
            sb.Append(".divTableBody { display: table-row-group;}");
            sb.Append("</style>");
            //Cuerpo

            sb.Append("<div class='divTable blueTable'>");
            sb.Append("<div class='divTableHeading'>");
            sb.Append("<div class='divTableRow'>");
            sb.Append("<div class='divTableHead'>TicoParts.co.cr</div>");
            sb.Append("</div>");
            sb.Append("</div>");
            sb.Append("<div class='divTableBody'>");
            sb.Append("<div class='divTableRow'>");
            sb.Append("<div class='divTableCell'>Cliente:");
            sb.Append(Nombre);
            sb.Append("</div></div>");
            sb.Append("<div class='divTableRow'>");
            sb.Append("<div class='divTableCell'>Correo:");
            sb.Append(Remitente);
            sb.Append("</div></div>");
            sb.Append("<div class='divTableRow'>");
            sb.Append("<div class='divTableCell'>Telefono:");
            sb.Append(telefono);
            sb.Append("</div></div>");
            sb.Append("<div class='divTableRow'>");
            sb.Append("<div class='divTableCell'>Parte:");
            sb.Append(lblParte.Text);
            sb.Append("</div></div></div>");


            oEnviarCorreo.destinatario = destinatario;
            oEnviarCorreo.remitente = Remitente;
            oEnviarCorreo.asunto = "Interesado en la Parte: " + asunto;
            oEnviarCorreo.mensaje = sb.ToString();

            try
            {
                string disennoMensajeI = "<div class='alert alert-success alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = oEnviarCorreo.EnviarEmail();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al enviar el correo";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }

        }
    }
}