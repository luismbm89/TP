using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class UsuarioBLL
    {
        public static bool Validar(string usuario,string clave)
        {
            try
            {
                return UsuarioDAL.Login(usuario,clave);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
