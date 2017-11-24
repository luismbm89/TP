using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class VehiculoBLL
    {
        public static DataTable obtenerMarca()
        {
            try
            {
                return VehiculoDAL.obtenerMarca();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerModelo(int idMarca)
        {
            try
            {
                return VehiculoDAL.obtenerModelo(idMarca);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
