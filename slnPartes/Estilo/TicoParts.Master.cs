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

        }

        protected void IniciarSesion(object sender, EventArgs e)
        {
            Usuario usr = new Usuario();
            usr.Usuario1 = user.Text;
            usr.Contrasenna = pass.Text;
            if (UsuarioBLL.Validar(usr.Usuario1, usr.Contrasenna)) {
                btnIniciar.Text = "Sesion Iniciada";
                    }

        }
    

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }
    }
}