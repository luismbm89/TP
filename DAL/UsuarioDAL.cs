using DAO;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
   public static class UsuarioDAL
    {
        public static bool Login(string user,string clave) {
            string osql = string.Format("Select count(*)[flag] from usuario where estado=1 and Usuario='{0}' and contrasenna=hashbytes('MD5','{1}')", user,clave);
            return Convert.ToBoolean(ConexionDAO.getInstance().EjecutarSQLScalar(osql));
        }


    }
}
