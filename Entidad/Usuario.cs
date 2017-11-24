namespace Entidad
{
    public class Usuario
    {
        private int idUsuario, Rol, Proveedor;

        public int Proveedor1
        {
            get { return Proveedor; }
            set { Proveedor = value; }
        }

        public int Rol1
        {
            get { return Rol; }
            set { Rol = value; }
        }

        public int IdUsuario
        {
            get { return idUsuario; }
            set { idUsuario = value; }
        }
        string usuario, contrasenna, nombre, Apellido1, Apellido2, correo, Telefono, ID, Identificacion;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Identificacion1
        {
            get { return Identificacion; }
            set { Identificacion = value; }
        }

        public string ID1
        {
            get { return ID; }
            set { ID = value; }
        }

        public string Telefono1
        {
            get { return Telefono; }
            set { Telefono = value; }
        }

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        public string Apellido21
        {
            get { return Apellido2; }
            set { Apellido2 = value; }
        }

        public string Apellido11
        {
            get { return Apellido1; }
            set { Apellido1 = value; }
        }

        public string Contrasenna
        {
            get { return contrasenna; }
            set { contrasenna = value; }
        }

        public string Usuario1
        {
            get { return usuario; }
            set { usuario = value; }
        }
        bool Estado;

        public bool Estado1
        {
            get { return Estado; }
            set { Estado = value; }
        }

        

        public Usuario()
        {
            IdUsuario = 0;
            Rol1 = 0;
            Proveedor1 = 0;
            Identificacion = "";
            Usuario1 = "";
            Contrasenna = "";
            nombre = "";
            Apellido11 = "";
            Apellido21 = "";
            Correo = "";
            Telefono1 = "";
            Estado1 = true;
        }

        public Usuario(int ID,int Rol,int Proveedor,string usuario,string contrasenna,string Nombre,string Apellido1,string Apellido2,string correo,string Telefono,bool estado,string Identificacion1)
        {
            IdUsuario = ID;
            Rol1 = Rol;
            Proveedor1 = Proveedor;
            Usuario1 = usuario;
            Contrasenna = contrasenna;
            Identificacion = Identificacion1;
            Nombre = nombre;
            Apellido11 = Apellido1;
            Apellido21 = Apellido2;
            Correo = correo;
            Telefono1 = Telefono;
            Estado1 = estado;
        }
    }
}
