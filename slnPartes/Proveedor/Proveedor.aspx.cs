using BLL;
using Entidad;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal;

namespace slnPartes.Proveedor
{
    public partial class Proveedor : System.Web.UI.Page
    {
        public static ArrayList Files = new ArrayList();
        public static ArrayList lst_Vehiculos = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (id == "2") {
                    string disennoMensajeI = "<div class='alert alert-success alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                    string mensaje = "Mensaje Enviado correctamente";
                    string disennoMensajeF = "</div>";
                    ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                    ltlMensaje.Visible = true;
                    MultiView1.ActiveViewIndex = 2;
                    this.Menu1.Items[2].Selected = true;
                    Response.AppendHeader("Refresh", "2;url=../Proveedor/Proveedor.aspx");
                }
                else
                {
                    ltlMensaje.Visible = false;
                }
                Page.Form.Attributes.Add("enctype", "multipart/form-data");
                MultiView1.ActiveViewIndex = 0;
                //CargarDatosProveedor();

                llenarComboProvincia(ddlProvincia);
                llenarComboTipoProveedor();
                llenarComboTipoTelefono();
                CargarDatosProveedor();
                this.Menu1.Items[0].Selected = true;
            }
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

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            MultiView1.ActiveViewIndex = Int32.Parse(e.Item.Value);
            Menu1.Items[Convert.ToInt32(e.Item.Value)].Selected = true;

            switch (Convert.ToInt32(e.Item.Value))
            {
                case 0: //Empresa
                    llenarComboProvincia(ddlProvincia);
                    llenarComboTipoProveedor();
                    llenarComboTipoTelefono();
                    CargarDatosProveedor();
                    break;
                case 1: //Partes
                    llenarTablaPartes();
                    llenarComboCategoria();
                    llenarComboPartes();
                    llenarComboProvincia(ddlTP_Provincia);
                    llenarComboClasificacion();
                    llenarComboMarca();
                    llenarComboAnno();
                    break;
                case 2: //Cotizaciones
                    llenarTablaCotizaciones();
                    break;
                case 3:
                    break;
                default:
                    break;
            }
        }

        

        //Metodos Tab Parte
        private void llenarComboCategoria()
        {
            ddlTP_CatParte.Items.Clear();
            try
            {
                ddlTP_CatParte.DataSource = ParteBLL.obtenerCategoria();
                ddlTP_CatParte.DataTextField = "categoria";
                ddlTP_CatParte.DataValueField = "idCategoriaParte";
                ddlTP_CatParte.DataBind();
                ddlTP_CatParte.Items.Insert(0, "Seleccione una Categoria");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Categorias";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboPartes()
        {
            ddlTP_Parte.Items.Clear();
            try
            {
                ddlTP_Parte.DataSource = ParteBLL.obtenerListaPartes();
                ddlTP_Parte.DataTextField = "parte";
                ddlTP_Parte.DataValueField = "idParte";
                ddlTP_Parte.DataBind();
                ddlTP_Parte.Items.Insert(0, "Seleccione una Parte");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Partes";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboProvincia(DropDownList ddl)
        {
            ddl.Items.Clear();
            try
            {
                ddl.DataSource = PaisBLL.obtenerProvicia();
                ddl.DataTextField = "provincia";
                ddl.DataValueField = "idProvincia";
                ddl.DataBind();
                ddl.Items.Insert(0, "Seleccione una Provincia");
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

        private void llenarComboCanton(DropDownList ddl, int idProvincia)
        {
            ddlTP_Canton.Items.Clear();
            try
            {
                ddl.DataSource = PaisBLL.obtenerCanton(idProvincia);
                ddl.DataTextField = "Canton";
                ddl.DataValueField = "idCanton";
                ddl.DataBind();
                ddl.Items.Insert(0, "Seleccione un Canton");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Categorias";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboClasificacion()
        {
            ddlTP_Clasificacion.Items.Clear();
            try
            {
                ddlTP_Clasificacion.DataSource = ParteBLL.obtenerClasificacion();
                ddlTP_Clasificacion.DataTextField = "descripcion";
                ddlTP_Clasificacion.DataValueField = "id";
                ddlTP_Clasificacion.DataBind();
                ddlTP_Clasificacion.Items.Insert(0, "Seleccione un Estado");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Clasificaciones";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboMarca()
        {
            ddlTP_Marca.Items.Clear();
            try
            {
                ddlTP_Marca.DataSource = VehiculoBLL.obtenerMarca();
                ddlTP_Marca.DataTextField = "Marca";
                ddlTP_Marca.DataValueField = "idMarca";
                ddlTP_Marca.DataBind();
                ddlTP_Marca.Items.Insert(0, "Seleccione una Marca");
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

        private void llenarComboModelo()
        {
            ddlTP_Modelo.Items.Clear();
            try
            {
                ddlTP_Modelo.DataSource = VehiculoBLL.obtenerModelo(Convert.ToInt32(ddlTP_Marca.SelectedValue));
                ddlTP_Modelo.DataTextField = "Modelo";
                ddlTP_Modelo.DataValueField = "idModelo";
                ddlTP_Modelo.DataBind();
                ddlTP_Modelo.Items.Insert(0, "Seleccione un Modelo");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar las Categorias";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboAnno()
        {
            ddlTP_Anno.Items.Clear();
            try
            {
                for (int i = DateTime.Now.Year; i > 1960; i--)
                {
                    ddlTP_Anno.Items.Add(i.ToString());
                }
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los Años";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
            ddlTP_Anno.Items.Insert(0, "Seleccione un Año");
        }

        private void llenarTablaPartes()
        {
            try
            {
                grvTP_Partes.DataSource = ParteBLL.obtenerParteTabla(Convert.ToInt32(Session["idProveedor"].ToString()));
                grvTP_Partes.DataBind();
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar la tabla de partes";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void ddlTP_Provincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarComboCanton(ddlTP_Canton, Convert.ToInt32(ddlTP_Provincia.SelectedValue));
        }

        protected void ddlTP_Marca_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarComboModelo();
        }

        protected void btnTP_AgregarFotos_Click(object sender, EventArgs e)
        {
            try
            {
                Boolean fileOK = false;
                String path = Server.MapPath("~/Imagenes/Partes");
                if (FileUpload1.HasFile)
                {
                    String fileExtension =
                        System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
                    String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        if (FileUpload1.HasFile)
                        {
                            if (FileUpload1.PostedFile.ContentLength > 0)
                            {

                                if (lstTP_Imagenes.Items.Contains(new ListItem(System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName))))
                                {
                                    ltTP_Parte.Text = "Imagen Agregada";
                                    ltTP_Parte.Visible = true;
                                    iBtnTP_EliminarImg.Enabled = true;
                                }
                                else
                                {
                                    Files.Add(FileUpload1);
                                    lstTP_Imagenes.Items.Add(System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName));
                                    ltTP_Parte.Text = "Agregue otra imagen";
                                    ltTP_Parte.Visible = true;
                                    iBtnTP_EliminarImg.Enabled = true;
                                }
                            }
                            else
                            {
                                ltTP_Parte.Text = "El tamaño de la imagen deber ser mayor a 0";
                                ltTP_Parte.Visible = true;
                            }
                        }
                        else
                        {
                            ltTP_Parte.Text = "Seleccione una imagen";
                            ltTP_Parte.Visible = true;
                        }
                    }
                    catch (Exception ex)
                    {

                    }

                }
                else
                {
                    ltTP_Parte.Text = "Eliga una imagen por favor.";
                    ltTP_Parte.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnTP_AgregarV_Click(object sender, EventArgs e)
        {
            string Marca = "";
            string Modelo = "";
            string anno = "";
            int marca = 0;
            int modelo = 0;
            int i = 0;

            if (ddlTP_Marca.SelectedIndex != 0)
            {
                i++;
                Marca = ddlTP_Marca.SelectedItem.Text;
                marca = Convert.ToInt32(ddlTP_Marca.SelectedItem.Value);
            }

            if (ddlTP_Modelo.SelectedIndex != 0 && ddlTP_Modelo.Items.Count > 0)
            {
                i++;
                Modelo = ddlTP_Modelo.SelectedItem.Text;
                modelo = Convert.ToInt32(ddlTP_Modelo.SelectedItem.Value);
            }

            if (ddlTP_Anno.SelectedIndex != 0)
            {
                i++;
                anno = ddlTP_Anno.SelectedItem.Text;
            }


            try
            {
                if (i == 3)
                {
                    lstTP_Vehiculos.Items.Add(new ListItem(new Vehiculo(Marca, Modelo, anno, marca, modelo).ToString()));
                    lst_Vehiculos.Add(new Vehiculo(Marca, Modelo, anno, marca, modelo));
                    iBtnTP_EliminarVehi.Enabled = true;
                    ddlTP_Marca.SelectedIndex = 0;
                    ddlTP_Modelo.SelectedIndex = 0;
                    ddlTP_Anno.SelectedIndex = 0;
                    ltlMensaje.Visible = false;
                    ddlTP_Modelo.Items.Clear();
                }
                else
                {
                    string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                    string mensaje = "Por favor seleccione una Marca, un Modelo y el año para continuar";
                    string disennoMensajeF = "</div>";
                    ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                    ltlMensaje.Visible = true;
                }
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al añadir el vehiculo";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void ddlTP_Parte_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTP_Descrip.Text = ddlTP_Parte.SelectedItem.Text;
        }

        protected void iBtnTP_EliminarImg_Click(object sender, ImageClickEventArgs e)
        {
            if (lstTP_Imagenes.SelectedIndex != -1)
            {
                lstTP_Imagenes.Items.RemoveAt(lstTP_Imagenes.SelectedIndex);
            }
        }

        protected void iBtnTP_EliminarVehi_Click(object sender, ImageClickEventArgs e)
        {
            if (lstTP_Vehiculos.SelectedIndex != -1)
            {
                lstTP_Vehiculos.Items.RemoveAt(lstTP_Vehiculos.SelectedIndex);
                //lst_Vehiculos.RemoveAt(lstTP_Vehiculos.SelectedIndex);
            }

        }

        protected void btnTP_GuardaParte_Click(object sender, EventArgs e)
        {
            ArrayList campos = new ArrayList();
            campos.Add(ddlTP_CatParte);
            campos.Add(ddlTP_Parte);
            campos.Add(txtTP_Descrip);
            campos.Add(ddlTP_Provincia);
            campos.Add(ddlTP_Canton);
            campos.Add(ddlTP_Clasificacion);
            campos.Add(txtTP_Precio);
            campos.Add(lstTP_Vehiculos);
            revisarCampos(campos);

            if (revisarCampos(campos) == campos.Count)
            {
                ParteProveedor oParteP = new ParteProveedor();
                oParteP.noSeq = Convert.ToInt32(hdfTP_txtNoSeq.Value);
                oParteP.idParte = Convert.ToInt32(ddlTP_Parte.SelectedValue);
                oParteP.idCategoriaParte = Convert.ToInt32(ddlTP_CatParte.SelectedValue);
                oParteP.descripcion = txtTP_Descrip.Text;
                oParteP.idProveedor = Convert.ToInt32(Session["idProveedor"].ToString());
                oParteP.idProvincia = Convert.ToInt32(ddlTP_Provincia.SelectedValue);
                oParteP.idCanton = Convert.ToInt32(ddlTP_Canton.SelectedValue);
                oParteP.codProveedor = txtTP_CodProveedor.Text;
                oParteP.estado = 0;
                oParteP.clasificacion = Convert.ToInt32(ddlTP_Clasificacion.SelectedValue);
                oParteP.precio = Convert.ToInt32(txtTP_Precio.Text);
                oParteP.envio = false;
                oParteP.costoEnvio = 0;
                oParteP.imagen = "";

                int noSeq = 0;
                try
                {
                    noSeq = ParteBLL.guardarParte(oParteP);
                    guardarVehiculo(0, noSeq, oParteP.idCategoriaParte);
                    guardarImagen(noSeq, oParteP.idProveedor);
                    /*
                    foreach (FileUpload fileup in Files)
                    {
                        guadarImagenes(fileup, noSeq, oParteP.idProveedor);
                    }*/
                    llenarTablaPartes();
                    /*
                    string disennoMensajeI = "<div class='alert alert-success alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                    string mensaje = "Parte agregada Correctamente";
                    string disennoMensajeF = "</div>";
                    ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                    ltlMensaje.Visible = true;*/
                }
                catch (Exception ex)
                {
                    string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                    string mensaje = "Error al guardar la Parte, por favor intenter mas tarde - " + ex.ToString();
                    string disennoMensajeF = "</div>";
                    ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                    ltlMensaje.Visible = true;
                }


            }
            else
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Por favor complete todos lo campos para continuar";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void guardarVehiculo(int noSeq, int idParte, int idCategoria)
        {
            try
            {
                foreach (Vehiculo vehi in lst_Vehiculos)
                {
                    ParteBLL.guardarVehiculo(vehi, noSeq, idParte, idCategoria);
                }
            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al agregar el vehiculo a la parte - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void guardarImagenes(FileUpload fileup, int noSeq, int idProveedor)
        {
            try
            {
                foreach (HttpPostedFile file in Files)
                {
                    
                }

                if (FileUpload1.HasFile)
                {
                    string str = FileUpload1.FileName;

                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str));
                    string Image = "~/Upload/" + str.ToString();
                    //string name = TextBox1.Text;  

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void guardarImagen(int noSeq, int idProveedor)
        {
            try
            {

                string path = "~/Imagenes/Partes/" + idProveedor + "/" + noSeq + "/";

                if (!Directory.Exists(Server.MapPath(path)))
                {
                    Directory.CreateDirectory(Server.MapPath(path));
                }

                if (Directory.Exists(Server.MapPath(path)))
                {
                    int i = 1;
                    foreach (FileUpload fileUp in Files)
                    {
                        if (fileUp.HasFile)
                        {
                            if (Directory.Exists(Server.MapPath(path)))
                            {
                                string nombreArchivo = fileUp.FileName;
                                string extension = Path.GetExtension(fileUp.PostedFile.FileName);
                                string ruta = path + idProveedor + noSeq + "_" + i + extension;
                                fileUp.PostedFile.SaveAs(Server.MapPath(ruta));
                                ParteBLL.guardarImagen(noSeq, idProveedor, ".." + ruta.Substring(1), 0);
                                if (i == 1)
                                {
                                    ParteBLL.actualizarImagenParte(noSeq, ".." + ruta.Substring(1));
                                }
                                fileUp.Dispose();
                            }
                        }
                        i++;
                    }

                }
            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al guardar la Imagen - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void btnTp_Cancel_Click(object sender, EventArgs e)
        {

        }

        //Metodos Empresa

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenarComboCanton(ddlCanton, Convert.ToInt32(ddlProvincia.SelectedValue));
        }

        protected void ibtnEliminar_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ibtnActualizar_Click(object sender, ImageClickEventArgs e)
        {

        }

        private void llenarComboTipoProveedor()
        {
            try
            {
                ddlTipoProveedor.DataSource = ProveedorBLL.obtenerTipoProveedor();
                ddlTipoProveedor.DataTextField = "tipoProveedor";
                ddlTipoProveedor.DataValueField = "idTipoProveedor";
                ddlTipoProveedor.DataBind();
                ddlTipoProveedor.Items.Insert(0, "Seleccione un Tipo Proveedor");
            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los datos del tipo Proveedor - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void llenarComboTipoTelefono()
        {
            try
            {
                ddlTipoTelefono.DataSource = ProveedorBLL.obtenerTipoTelefono();
                ddlTipoTelefono.DataTextField = "tipoTelefono";
                ddlTipoTelefono.DataValueField = "idTtipoTelefono";
                ddlTipoTelefono.DataBind();
                ddlTipoTelefono.Items.Insert(0, "Seleccione un Tipo de Telefono");
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los Datos del Tipo Telefono";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        private void CargarDatosProveedor()
        {
            try
            {
                foreach (DataRow row in ProveedorBLL.obtenerProveedor(Convert.ToInt32(Session["idProveedor"].ToString())).Rows)
                {
                    txtCedula.Text = row["cedula"].ToString();
                    txtID.Text = row["idProveedor"].ToString();
                    ddlTipoProveedor.SelectedValue = row["tipoProveedor"].ToString();
                    txtNombre.Text = row["NombreProveedor"].ToString();
                    txtDescripcion.Text = row["descripcion"].ToString();
                    ddlProvincia.SelectedValue = row["idProvincia"].ToString();
                    llenarComboCanton(ddlCanton, Convert.ToInt32(ddlProvincia.SelectedValue));
                    ddlCanton.SelectedValue = row["idCanton"].ToString();
                    txtDireccion.Text = row["direccion"].ToString();
                    txtEmail.Text = row["email"].ToString();
                }

                foreach (DataRow row in ProveedorBLL.obtenerTelProveedor(Convert.ToInt32(Session["idProveedor"].ToString())).Rows)
                {
                    lstTelefonos.Items.Add(row["telefono"].ToString());
                }
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los datos del proveedor";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void grvTP_Partes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow rowV = grvTP_Partes.Rows[index];

            try
            {
                if (e.CommandName == "modificar")
                {

                }
                else
                {
                    if (e.CommandName == "eliminar")
                    {

                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        //Datos Cotizaciones
        private void llenarTablaCotizaciones()
        {
            try
            {
                grvCotizaciones.DataSource = CotizacionBLL.obtenerInfoCotizacion();
                grvCotizaciones.DataBind();
            }
            catch (Exception ex)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los datos de las Cotizacion - " + ex.ToString();
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void grvCotizaciones_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(grvCotizaciones.DataKeys[index].Values[0]);
            try
            {
                if (e.CommandName == "contestar")
                {
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$(function () {");
                    sb.Append(" $('#modalCotizacion').modal('show');});");
                    sb.Append("</script>");
                    llenarModalCotizacion(Convert.ToInt32(id));
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ModelScript", sb.ToString(), false);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void llenarModalCotizacion(int idCotizacion)
        {
            try
            {
                int idUsuario = 0;
                foreach (DataRow row in CotizacionBLL.obtenerInfoCotizacion(idCotizacion).Rows)
                {
                    
                    txtCOT_Marca.Text = row["Marca"].ToString();
                    txtCOT_Modelo.Text = row["Modelo"].ToString();
                    txtCOT_Anno.Text = row["año"].ToString();
                    txtCOT_Descripcion.Text = row["descripcion"].ToString();
                    txtCOT_OtrosDatos.Text = row["otrosDatos"].ToString();
                    idUsuario = Convert.ToInt32(row["idUsuario"].ToString());
                }
                foreach (DataRow row in CotizacionBLL.obtenerInfoUsuarioCoti(idUsuario).Rows)
                {
                    txtCOT_Nombre.Text = row["Nombre"].ToString();
                    txtCOT_Email.Text = row["correo"].ToString();
                    txtCOT_Telefono.Text = row["Telefono"].ToString();
                }
            }
            catch (Exception)
            {
                string disennoMensajeI = "<div class='alert alert-warning alert - dismissable fade in'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>";
                string mensaje = "Error al cargar los datos de la Cotizacion";
                string disennoMensajeF = "</div>";
                ltlMensaje.Text = disennoMensajeI + mensaje + disennoMensajeF;
                ltlMensaje.Visible = true;
            }
        }

        protected void grvCotizaciones_DataBound(object sender, EventArgs e)
        {
            
        }

        protected void btnEnviarCot_Click(object sender, EventArgs e)
        {
            EnviarCorreo oCorreo = new EnviarCorreo();
            oCorreo.remitente = txtEmail.Text;
            oCorreo.asunto = "Respuesta a Cotización";
            oCorreo.destinatario = txtCOT_Email.Text;
            oCorreo.mensaje = "El proveedor a contestado su solicitud: " + txtCOT_Mensaje.Text;
            ltlMensaje.Text = oCorreo.EnviarEmail();
            ltlMensaje.Visible = true;
            Response.Redirect("../Proveedor/Proveedor.aspx?id=2");
        }

        private void PagarMes()
        {
            Dictionary<string, string> config = PayPal.Api.ConfigManager.Instance.GetProperties();
            
        }


    }
}