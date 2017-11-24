using BLL;
using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace slnPartes
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Llenarinfo();
            }
        }
        protected void Guardar(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            user.Apellido11 = txtApellido1.Text;
            user.Apellido21 = txtApellido2.Text;
            user.Contrasenna = txtClave.Text;
            user.Correo = txtCorreo.Text;
            user.Identificacion1 = txtID.Text;
            user.IdUsuario = Convert.ToInt32(txtUsuario.ToolTip);
            user.Nombre = txtNombre.Text;
            user.Proveedor1 = Convert.ToInt32(Session["idProveedor"].ToString());
            user.Usuario1 = txtUsuario.Text;
            user.Telefono1 = txtTelefono.Text;
            user.Rol1 = Convert.ToInt32(txtRol.ToolTip);
            if (UsuarioBLL.Actualizar(user) > 0) {
                if (txtUsuario.Text != Session["user"].ToString()||txtClave.Text.Length>0)
                {
                    Session.Abandon();
                    Session.RemoveAll();
                    Response.Redirect("~/index.aspx");
                }
                else
                {
                    Response.Redirect("~/Perfil.aspx?id=2");
                }
            }

        }
        public void Llenarinfo()
        {
            txtUsuario.Text = Session["user"].ToString();
            DataTable dt = UsuarioBLL.ObtenerInfo(Session["user"].ToString());
            txtUsuario.ToolTip = dt.Rows[0][0].ToString();
            txtUsuario.Text = dt.Rows[0][1].ToString();
            txtClave.Text = "";//dt.Rows[0][2].ToString();
            txtID.Text = dt.Rows[0][3].ToString();
            txtNombre.Text = dt.Rows[0][4].ToString();
            txtApellido1.Text = dt.Rows[0][5].ToString();
            txtApellido2.Text = dt.Rows[0][6].ToString();
            txtCorreo.Text = dt.Rows[0][7].ToString();
            txtTelefono.Text = dt.Rows[0][8].ToString();
            txtRol.Text = dt.Rows[0][9].ToString();
            txtRol.ToolTip = dt.Rows[0][10].ToString();
        }
    }
}