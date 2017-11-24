using DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class PaisDAL
    {
        public static DataTable obtenerProvincia()
        {
            string oSql = "select idProvincia,provincia from provincia";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerCanton(int idProvincia)
        {
            string oSql = "select idCanton, canton from Canton where idProvincia = " + idProvincia;

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
