using DAO;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DAL
{
    public static class UsuarioDAL
    {
        public static string Login(string user, string clave)
        {
            string osql = string.Format("Select count(*)[flag] from usuario where estado=1 and Usuario='{0}' and contrasenna=hashbytes('MD5','{1}')", user, clave);
            return (ConexionDAO.getInstance().EjecutarSQLScalar(osql));
        }
        public static string Rol(string user)
        {
            string osql = string.Format("Select Rol from Usuario where Usuario='{0}'", user);
            return (ConexionDAO.getInstance().EjecutarSQLScalar(osql));
        }
        public static string Proveedor(string user)
        {
            string osql = string.Format("Select Proveedor from Usuario where Usuario='{0}'", user);
            return (ConexionDAO.getInstance().EjecutarSQLScalar(osql));
        }

        public static DataTable ObtenerInfo(string usuario)
        {
            string osql = string.Format("Select [idUsuario],[Usuario],[contrasenna],[Identificacion],[Nombre],[Apellido1],[Apellido2],[correo],[Telefono],b.[Rol],a.[Rol][idRol],[estado],[Proveedor] from Usuario a inner join Roles b on a.Rol=b.idRol where Usuario='{0}' and estado=1", usuario);
            return (ConexionDAO.getInstance().EjecutarConsultaDataTable(osql));
        }
        public static int Actualizar(Usuario usuario)
        {
            string osql = string.Format("Update a set Usuario = '{0}',[contrasenna]=case  when '{1}'='' then [contrasenna] else HASHBYTES('MD5','{1}') end ,[Identificacion] = '{2}',[Nombre] = '{3}',[Apellido1] = '{4}',[Apellido2] = '{5}',[correo] = '{6}',[Telefono] = '{7}' from Usuario a where idUsuario={8}", usuario.Usuario1,usuario.Contrasenna,usuario.Identificacion,usuario.Nombre,usuario.Apellido11,usuario.Apellido21,usuario.Correo,usuario.Telefono1,usuario.IdUsuario);
            return (ConexionDAO.getInstance().EjecutarSqlActualizacion(osql));
        }
    }
}
