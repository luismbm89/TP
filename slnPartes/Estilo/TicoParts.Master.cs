using BLL;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace slnPartes.Estilo
{
    public partial class TicoParts : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack){
            if (Session["user"] != null)
            {
                    liPerfil.Visible = true;
                lblIniciar.Text = Session["user"].ToString().ToUpper();
                btnIniciar.Text = "Finalizar";
                switch (Session["Rol"].ToString())
                {
                    case "1"://Administrador
                        Inicio.Visible = true;
                        Partes.Visible = true;
                        Proveedores.Visible = true;
                        Contactenos.Visible = true;
                        Proveedor.Visible = true;
                        Administrador.Visible = true;
                            break;
                    case "2"://Proveedor
                        Inicio.Visible = true;
                        Partes.Visible = true;
                        Proveedores.Visible = true;
                        Contactenos.Visible = true;
                        Proveedor.Visible = true;
                            Administrador.Visible = false;
                            break;
                    case "3"://Cliente
                        Inicio.Visible = true;
                        Partes.Visible = true;
                        Proveedores.Visible = true;
                        Contactenos.Visible = true;
                        Proveedor.Visible = false;
                        Administrador.Visible = false;
                        break;
                
                }
                user.Text = Session["user"].ToString().ToUpper();
                pass.Enabled = false;
            }
            else
            {
                lblIniciar.Text = "Iniciar Sesión";
                btnIniciar.Text = "Iniciar";
                user.Text = "";
                pass.Enabled = true;
                Inicio.Visible = true;
                Partes.Visible = true;
                Proveedores.Visible = true;
                Contactenos.Visible = true;
                Proveedor.Visible = false;
            }}
        }

        protected void IniciarSesion(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            switch (btn.Text)
            {
                case "Iniciar":
                    if (UsuarioBLL.Validar(user.Text, pass.Text).Equals("1"))
                    {
                        Session["user"] = user.Text;
                        Session["Rol"] = UsuarioBLL.Rol(user.Text);
                        Session["idProveedor"] = UsuarioBLL.Proveedor(user.Text);
                        Response.Redirect("~/index.aspx");
                    }
                    else
                    {
                        hdnCheck.Value = "wrong";
                    }
                    break;
                case "Finalizar":
                    Session.Abandon();
                    Session.RemoveAll();
                Response.Redirect("~/index.aspx");
                    break;
            }

        }


        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
        protected void Perfil(object sender, EventArgs e)
        {
            Response.Redirect("~/Perfil.aspx");
        }
    }
}