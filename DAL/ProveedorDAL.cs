using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ProveedorDAL
    {
        public static DataTable obtenerInfoProveedor(int idProveedor)
        {
            string oSql = "SELECT [NombreProveedor],[tipoProveedor],[provincia],[Canton],[direccion],[email] FROM [dbo].[vw_InfoProveedorParte] where idProveedor = " + idProveedor;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerTelProveedor(int idProveedor)
        {
            string oSql = "select telefono from telefonoProveedor where idProveedor = " + idProveedor;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenetTipoProveedor()
        {
            string oSql = "select idTipoProveedoor,tipoProveedor from tipoProveedor";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenetTipoTelefono()
        {
            string oSql = "select idTtipoTelefono,tipoTelefono from tipoTelefono";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerProveedor(int idProveedor)
        {
            string oSql = "SELECT [idProveedor],[tipoProveedor],[NombreProveedor],[cedula],[descripcion],[idProvincia],[idCanton],[direccion],[logo],[email] FROM [dbo].[Proveedor] where idProveedor = " + idProveedor;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

    }
}
