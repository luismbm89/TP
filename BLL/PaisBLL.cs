using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class PaisBLL
    {
        public static DataTable obtenerProvicia()
        {
            try
            {
                return PaisDAL.obtenerProvincia();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerCanton(int idProvincia)
        {
            try
            {
                return PaisDAL.obtenerCanton(idProvincia);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
