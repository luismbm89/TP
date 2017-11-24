using BLL;
using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace slnPartes
{
    public partial class Proveedores : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

        
        
        private void llenarDtlParte()
        {
            try
            {
                dtlProveedores.DataSource = ProveedorBLL.ListaProveedores();
                dtlProveedores.DataBind();
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
        }
        private void llenarModalProveedor(int Proveedor)
        {
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
            if (dtlProveedores.SelectedIndex != -1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalRepuesto();", true);
            }
        }
        

        private void aplicarFiltro()
        {
            int f1 = 0, f2 = 0, f3 = 0, f4 = 0, f5 = 0, f6 = 0;
            try
            {
                DataView dv = new DataView(ProveedorBLL.ListaProveedores());

                if (ddlTS.SelectedIndex > 0)
                {
                    f4 = 1;
                }
                if (ddlProvincia.SelectedIndex > 0)
                {
                    f5 = 1;
                }
                if (ddlCanton.SelectedIndex > 0)
                {
                    f6 = 1;
                }
                if (txtBuscarNombre.Text.Length > 0)
                {
                    f3 = 1;
                }
                StringBuilder filtro = new StringBuilder();
                if (f3 > 0)
                {
                    if (filtro.Length > 0)
                    {
                        filtro.Append(" and ");
                    }
                    filtro.Append(String.Format("NombreProveedor like'%{0}%'", txtBuscarNombre.Text));
                }
                if (f4 > 0)
                {
                    if (filtro.Length > 0)
                    {
                        filtro.Append(" and ");
                    }
                    filtro.Append(String.Format("tipoProveedor like'%{0}%'", ddlTS.SelectedItem.Text));
                }
                if (f5 > 0)
                {
                    if (filtro.Length > 0)
                    {
                        filtro.Append(" and ");
                    }
                    filtro.Append(String.Format("provincia like'%{0}%'", ddlProvincia.SelectedItem.Text));
                }
                if (f6 > 0)
                {
                    if (filtro.Length > 0)
                    {
                        filtro.Append(" and ");
                    }
                    filtro.Append(String.Format("Canton like'%{0}%'", ddlCanton.SelectedItem.Text));
                }

                dv.RowFilter = filtro.ToString();
                dtlProveedores.DataSource = dv;
                dtlProveedores.DataBind();
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
        

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            aplicarFiltro();
        }

        protected void ddlTS_SelectedIndexChanged(object sender, EventArgs e)
        {
            aplicarFiltro();
        }
    }
}