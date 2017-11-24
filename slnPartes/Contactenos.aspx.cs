using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Drawing;

namespace slnPartes
{
    public partial class Contactenos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int revisarCampos(ArrayList campos)
        {
            bool bandera = false;
            int camposLlenos = 0;
            foreach (Control ctrl in campos)
            {
                if (ctrl is TextBox)
                {
                    TextBox txt = (TextBox)ctrl;

                    if (txt.Text.Trim().Equals(""))
                    {
                        txt.BackColor = Color.LightPink;
                        bandera = false;
                    }
                    else
                    {
                        txt.BackColor = Color.LightGreen;
                        bandera = true;
                        camposLlenos++;
                    }
                }
                else
                {
                    if (ctrl is DropDownList)
                    {
                        DropDownList ddl = (DropDownList)ctrl;
                        if (ddl.SelectedIndex != 0)
                        {
                            ddl.BackColor = Color.LightGreen;
                            bandera = true;
                            camposLlenos++;
                        }
                        else
                        {
                            ddl.BackColor = Color.LightPink;
                            bandera = false;
                        }
                    }
                    else
                    {
                        if (ctrl is ListBox)
                        {
                            ListBox lst = (ListBox)ctrl;
                            if (lst.Items.Count != 0)
                            {
                                lst.BackColor = Color.LightGreen;
                                camposLlenos++;
                            }
                            else
                            {
                                lst.BackColor = Color.LightPink;
                            }
                        }
                    }

                }
            }

            return camposLlenos;


        }

        protected void btnEnviarEmail(object sender, EventArgs e)
        {
            ArrayList campos = new ArrayList();

            campos.Add(txtNombre);
            campos.Add(txtTelefono);
            campos.Add(txtCorreo);
            campos.Add(txtAsunto);
            campos.Add(txtMensaje);

            if (revisarCampos(campos) == campos.Count)
            {
                EnviarCorreo oEnviar = new EnviarCorreo();
                oEnviar.destinatario = "ticopartscr@gmail.com";
                oEnviar.asunto = txtAsunto.Text;
                oEnviar.mensaje = txtMensaje.Text;
                oEnviar.remitente = txtCorreo.Text;

                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Categorias";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + oEnviar.EnviarEmail() + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
            else
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Categorias";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }
    }
}