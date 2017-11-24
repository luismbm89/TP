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
    public class ParteBLL
    {
        public static DataTable obtenerCategoria()
        {
            try
            {
                return ParteDAL.obtenerCategoria();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerListaPartes()
        {
            try
            {
                return ParteDAL.obtenerListaPartes();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerClasificacion()
        {
            try
            {
                return ParteDAL.obtenerClasificacion();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParte()
        {
            try
            {
                return ParteDAL.obtenerParte();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParte(int idParte)
        {
            try
            {
                return ParteDAL.obtenerParte(idParte);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParteTabla(int idProveedor)
        {
            try
            {
                return ParteDAL.obtenerParteTabla(idProveedor);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerVehiculoParte(int idParte)
        {
            try
            {
                return ParteDAL.obtenerVehiculoParte(idParte);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static DataTable obtenerParteImagen(int idParte)
        {
            try
            {
                return ParteDAL.obtenerParteImagen(idParte);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static int guardarParte(ParteProveedor parteProveedor)
        {
            try
            {
                return ParteDAL.guardarParte(parteProveedor);
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
                return ParteDAL.guardarImagen(idParte, idProveedor, rutaImagen, id);
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
                return ParteDAL.guardarVehiculo(vehi,noSeq,idParte,idCategoria);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static int actualizarImagenParte(int noSeq, string ruta)
        {
            try
            {
                return ParteDAL.actualizarImagenParte(noSeq, ruta);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}
