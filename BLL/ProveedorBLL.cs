using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProveedorBLL
    {
        public static DataTable obtenerInfoProveedor(int idProveedor)
        {
            try
            {
                return ProveedorDAL.obtenerInfoProveedor(idProveedor);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerTelProveedor(int idProveedor)
        {
            try
            {
                return ProveedorDAL.obtenerTelProveedor(idProveedor);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerTipoProveedor()
        {
            try
            {
                return ProveedorDAL.obtenetTipoProveedor();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerTipoTelefono()
        {
            try
            {
                return ProveedorDAL.obtenetTipoTelefono();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerProveedor(int idProveedor)
        {
            try
            {
                return ProveedorDAL.obtenerProveedor(idProveedor);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
