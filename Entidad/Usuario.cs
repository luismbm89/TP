namespace Entidad
{
    public class Usuario
    {
        private int idUsuario,Rol,Proveedor;
        string usuario, contrasenna, nombre, Apellido1, Apellido2, correo, Telefono,ID;
        bool Estado;

        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public int Rol1 { get => Rol; set => Rol = value; }
        public int Proveedor1 { get => Proveedor; set => Proveedor = value; }
        public string Usuario1 { get => usuario; set => usuario = value; }
        public string Contrasenna { get => contrasenna; set => contrasenna = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Apellido11 { get => Apellido1; set => Apellido1 = value; }
        public string Apellido21 { get => Apellido2; set => Apellido2 = value; }
        public string Correo { get => correo; set => correo = value; }
        public string Telefono1 { get => Telefono; set => Telefono = value; }
        public bool Estado1 { get => Estado; set => Estado = value; }
        public string Identificacion { get => ID; set => ID = value; }

        public Usuario()
        {
            IdUsuario = 0;
            Rol1 = 0;
            Proveedor1 = 0;
            Identificacion = "";
            Usuario1 = "";
            Contrasenna = "";
            Nombre = "";
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
