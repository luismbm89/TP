using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidad;

namespace BLL
{
    public static class UsuarioBLL
    {
        public static string Validar(string usuario, string clave)
        {
            try
            {
                return UsuarioDAL.Login(usuario, clave);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public static string Rol(string usuario)
        {
            try
            {
                return UsuarioDAL.Rol(usuario);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static DataTable ObtenerInfo(string usuario)
        {

            try
            {
                return UsuarioDAL.ObtenerInfo(usuario);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static string Proveedor(string usuario)
        {
            try
            {
                return UsuarioDAL.Proveedor(usuario);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public static int Actualizar(Usuario usuario)
        {
            try
            {
                return UsuarioDAL.Actualizar(usuario);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
