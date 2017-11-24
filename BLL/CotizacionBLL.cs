using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entidad;

namespace BLL
{
    public class CotizacionBLL
    {
        public static DataTable obtenerInfoCotizacion()
        {
            try
            {
                return CotizacionDAL.obtenerInfoCotizacion();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerInfoCotizacion(int idCotizacion)
        {
            try
            {
                return CotizacionDAL.obtenerInfoCotizacion(idCotizacion);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerInfoUsuarioCoti(int idUsuario)
        {
            try
            {
                return CotizacionDAL.obtenerInfoUsuarioCoti(idUsuario);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static int guardarCotizacion(Cotizacion cotizacion)
        {
            try
            {
                return CotizacionDAL.guardarCotizacion(cotizacion);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
