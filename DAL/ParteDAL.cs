using DAO;
using Entidad;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ParteDAL
    {
        public static DataTable obtenerCategoria()
        {
            string oSql = "select idCategoriaParte,categoria from CategoriaParte";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerListaPartes()
        {
            string oSql = "select idParte,parte from listaParte";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerClasificacion()
        {
            string oSql = "select id,descripcion from Clasificacion";
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParte()
        {
            string oSql = "SELECT [noSeq],[idParte],[descripcion],[categoria],[NombreProveedor] ,[provincia],[Canton],[precio],[imagen],anno,marca,Modelo FROM [dbo].[vw_VistaPartes]";

            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }

        }

        public static DataTable obtenerParte(int noSeq)
        {
            string oSql = "SELECT [noSeq],[Parte],[Clasificacion],[precio],[provincia],[Canton],[idParte],[idProveedor] FROM [dbo].[vw_InfoParte] where noSeq = " + noSeq;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParteTabla(int idProveedor)
        {
            string oSql = "select v.noSeq,categoria,v.descripcion as parte, descripcion,i.Clasificacion,v.precio from vw_VistaPartes v inner join vw_InfoParte i on v.noSeq = i.noSeq  where idProveedor = " + idProveedor;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerVehiculoParte(int noSeq)
        {
            string oSql = "SELECT [Marca],[Modelo],[anno] FROM [vw_InfoParteVehiculo] where idParte = " + noSeq;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParteImagen(int idParte)
        {
            string oSql = "SELECT [id],[rutaImagen] FROM [Imagenes] where idParte = " + idParte;
            try
            {
                return ConexionDAO.getInstance().EjecutarConsultaDataTable(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static int guardarParte(ParteProveedor oParteProveedor)
        {
            int noSeq = 0;

            try
            {
                SqlCommand oCommand = new SqlCommand("sp_GuardarParte");
                oCommand.CommandType = CommandType.StoredProcedure;

                oCommand.Parameters.AddWithValue("@noSeq",oParteProveedor.noSeq);
		        oCommand.Parameters.AddWithValue("@idParte",oParteProveedor.idParte);
		        oCommand.Parameters.AddWithValue("@idCategoriaParte",oParteProveedor.idCategoriaParte);
		        oCommand.Parameters.AddWithValue("@descripcion",oParteProveedor.descripcion);
		        oCommand.Parameters.AddWithValue("@idProveedor",oParteProveedor.idProveedor);
		        oCommand.Parameters.AddWithValue("@idProvincia",oParteProveedor.idProvincia);
		        oCommand.Parameters.AddWithValue("@idCanton",oParteProveedor.idCanton);
		        oCommand.Parameters.AddWithValue("@codProveedor",oParteProveedor.codProveedor);
		        oCommand.Parameters.AddWithValue("@estado",oParteProveedor.estado);
		        oCommand.Parameters.AddWithValue("@clasificacion",oParteProveedor.clasificacion);
		        oCommand.Parameters.AddWithValue("@precio",oParteProveedor.precio);
		        oCommand.Parameters.AddWithValue("@envio",oParteProveedor.envio);
		        oCommand.Parameters.AddWithValue("@costoEnvio",oParteProveedor.costoEnvio);
                oCommand.Parameters.AddWithValue("@Imagen", oParteProveedor.imagen);
                //TODO: Agregar Vehiculos e Imagenes
                noSeq = Convert.ToInt32(ConexionDAO.getInstance().EjecutarSQLScalar(oCommand));
                return noSeq;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static int guardarImagen(int idParte, int idProveedor, string rutaImagen, int id)
        {
            try
            {
                SqlCommand oCommand = new SqlCommand("sp_GuardarImagen");
                oCommand.CommandType = CommandType.StoredProcedure;

                oCommand.Parameters.AddWithValue("@idParte", idParte);
                oCommand.Parameters.AddWithValue("@idProveedor", idProveedor);
                oCommand.Parameters.AddWithValue("@rutaImagen", rutaImagen);
                oCommand.Parameters.AddWithValue("@id", id);

                return ConexionDAO.getInstance().EjecutarSqlActualizacion(oCommand);
            }
            catch (Exception)
            {
                
                throw;
            }    
                
        }

        public static int guardarVehiculo(Vehiculo vehi, int noSeq, int idParte, int idCategoria)
        {
            try
            {
                SqlCommand oCommand = new SqlCommand("sp_GuardarVehiculo");
                oCommand.CommandType = CommandType.StoredProcedure;

                oCommand.Parameters.AddWithValue("@noSeq", noSeq);
                oCommand.Parameters.AddWithValue("@idParte", idParte);
                oCommand.Parameters.AddWithValue("@idCategoriaParte", idCategoria);
                oCommand.Parameters.AddWithValue("@idMarcaVehiculo", vehi.marca);
                oCommand.Parameters.AddWithValue("@idModeloVehiculo", vehi.modelo);
                oCommand.Parameters.AddWithValue("@anno", vehi.anno);

                return ConexionDAO.getInstance().EjecutarSqlActualizacion(oCommand);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static int actualizarImagenParte(int noSeq, string ruta)
        {
            string oSql = "update Parte set imagen = '" + ruta + "' where noSeq = " + noSeq;
            try
            {
                return ConexionDAO.getInstance().EjecutarSqlActualizacion(oSql);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
