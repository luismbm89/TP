using DAO;
using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class CotizacionDAL
    {
        public static DataTable obtenerInfoCotizacion()
        {
            string oSql = "SELECT [idCotizacion],[descripcion],[Marca],[Modelo],[año],[otrosDatos],[idUsuario],[estado],[imagen] FROM vw_InfoCotizaciones";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerInfoUsuarioCoti(int idUsuario)
        {
            string oSql = "select CONCAT(Nombre,' ',Apellido1,' ',Apellido2) as Nombre,correo,Telefono from Usuario where idUsuario = " + idUsuario ;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerInfoCotizacion(int idCotizacion)
        {
            string oSql = "SELECT [idCotizacion],[descripcion],[Marca],[Modelo],[año],[otrosDatos],[idUsuario],[estado],[imagen] FROM vw_InfoCotizaciones where idCotizacion = " + idCotizacion;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
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
                SqlCommand oCommand = new SqlCommand("sp_GuardarCotizacion");
                oCommand.CommandType = CommandType.StoredProcedure;

                oCommand.Parameters.AddWithValue("@idCotizacion", cotizacion.idCotizacion);
                oCommand.Parameters.AddWithValue("@descripcion", cotizacion.descripcion);
                oCommand.Parameters.AddWithValue("@idMarca", cotizacion.idMarca);
                oCommand.Parameters.AddWithValue("@idModelo", cotizacion.idModelo);
                oCommand.Parameters.AddWithValue("@Año", cotizacion.anno);
                oCommand.Parameters.AddWithValue("@otroDatos", cotizacion.otrosDatos);
                oCommand.Parameters.AddWithValue("@idUsuario", cotizacion.idUsuario);
                oCommand.Parameters.AddWithValue("@estado", cotizacion.estado);
                oCommand.Parameters.AddWithValue("@imagen", cotizacion.imagen);

                return ConexionDAO.getInstance().EjecutarSqlActualizacion(oCommand);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
