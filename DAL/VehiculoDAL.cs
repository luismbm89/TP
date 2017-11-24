using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class VehiculoDAL
    {
        public static DataTable obtenerMarca()
        {
            string oSql = "select idMarca,Marca from MarcaVehiculo";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerModelo(int idMarca)
        {
            string oSql = "select idModelo,Modelo from ModeloVehiculo where idMarca = " + idMarca;
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
