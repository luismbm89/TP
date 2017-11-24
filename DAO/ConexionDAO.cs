using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class ConexionDAO
    {
        private static ConexionDAO instance = null;
        public SqlConnection oConexion { set; get; }
        public String Usuario { set; get; }
        public String Clave { set; get; }
        public String Servidor { set; get; }
        public String BaseDatos { set; get; }

        private ConexionDAO()
        {
            Usuario = "sa";
            Clave = "123456"; //123456 - dbCai2017
            Servidor = "localhost";
            BaseDatos = "ticopartdb";
        }

        public static ConexionDAO getInstance()
        {
            if (instance == null)
            {
                instance = new ConexionDAO();
            }
            return instance;
        }

        public void establecerConexion()
        {
            String hileraConexion = @"Data Source=" + Servidor +
                                   ";Initial Catalog=" + BaseDatos +
                                   ";User ID=" + Usuario +
                                   ";Password= " + Clave;


            oConexion = new SqlConnection(hileraConexion);
            try
            {
                oConexion.Open();
                /*
                Usuario = "";
                Clave = "";
                Servidor = "";
                BaseDatos = "";
                */

            }
            catch (Exception e)
            {
                throw new Exception("Error de conexión\n" + e.Message);
            }
        }

        public void cerrarConexion()
        {
            try
            {
                if (oConexion.State == ConnectionState.Open)
                {
                    oConexion.Close();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        //Método que permite ejecutar sentencia Insert,Delete,Update
        //Retorna la cantidad de registros insertados
        public Int32 EjecutarSqlActualizacion(String oSql)
        {
            Int32 vRegistrosActualizados = 0;
            try
            {
                establecerConexion();
                SqlCommand oCommand = new SqlCommand();
                oCommand.Connection = oConexion;
                oCommand.CommandText = oSql;
                oCommand.CommandType = CommandType.Text;

                vRegistrosActualizados = oCommand.ExecuteNonQuery();
                return vRegistrosActualizados;
            }
            catch (Exception errorSQL)
            {
                throw new Exception("Error de SQL en Ejecutar sentencia SQL de actualización: \n" +
                                      errorSQL.Message + "\n" + oSql);
            }
            finally
            {
                cerrarConexion();
            }

        }

        //Método que permite ejecutar sentencia Insert,Delete,Update
        //Retorna la cantidad de registros insertados
        public Int32 EjecutarSqlActualizacion(SqlCommand oCommand)
        {
            Int32 vRegistrosActualizados = 0;
            establecerConexion();
            oCommand.Connection = oConexion;
            try
            {
                vRegistrosActualizados = oCommand.ExecuteNonQuery();
            }
            catch (Exception errorSQL)
            {
                throw new Exception("Error de SQL en Ejecutar sentencia SQL Actualización: \n" +
                                     errorSQL.Message + "\n" + oCommand.CommandText);
            }
            finally
            {
                cerrarConexion();
            }
            return vRegistrosActualizados;
        }

        public int EjecutarSqlActualizacion(List<SqlCommand> listaComandos)
        {
            establecerConexion();
            String textoComando = "";
            int vRegistrosActualizados = 0;
            using (SqlTransaction transaccion = oConexion.BeginTransaction(IsolationLevel.ReadCommitted))
            {
                try
                {
                    foreach (SqlCommand command in listaComandos)
                    {
                        command.Connection = oConexion;
                        command.Transaction = transaccion;
                        textoComando = command.CommandText;
                        command.ExecuteNonQuery();
                        vRegistrosActualizados++;
                    }
                    // Commit a la transacción
                    transaccion.Commit();
                }

                catch (Exception error)
                {
                    transaccion.Rollback();
                    throw new Exception("Error de SQL en Ejecutar sentencia SQL Actualización: \n" +
                                     error.Message + "\n" + textoComando);


                }
                finally
                {
                    cerrarConexion();
                }

            }

            return vRegistrosActualizados;
        }

        //Método que permite ejecutar instrucciones Select 
        //Retorna el resultado en un objeto DataTable
        public DataTable EjecutarConsultaDataTable(String oSql)
        {
            establecerConexion();
            DataTable oDataTable = new DataTable();
            SqlCommand oCommand = new SqlCommand();
            try
            {
                oCommand.Connection = oConexion;
                oCommand.CommandText = oSql;
                oCommand.CommandType = CommandType.Text;

                using (SqlDataAdapter adaptador = new SqlDataAdapter(oCommand))
                {
                    adaptador.Fill(oDataTable);
                    adaptador.Dispose();
                }
            }
            catch (Exception errorSQL)
            {
                throw new Exception("Error de SQL en la consulta Data Table\n" +
                    errorSQL.Message + "\n" + oSql);
            }
            finally
            {
                oCommand = null;
                cerrarConexion();
            }
            return oDataTable;
        }

        public DataTable EjecutarConsultaDataTable(SqlCommand oCommand)
        {
            establecerConexion();
            DataTable oDataTable = new DataTable();
            oCommand.Connection = oConexion;

            try
            {
                using (SqlDataAdapter adaptador = new SqlDataAdapter(oCommand))
                {

                    adaptador.Fill(oDataTable);
                    adaptador.Dispose();
                }
            }
            catch (Exception errorSQL)
            {

                throw new Exception("Error de SQL en la consulta DataTable\n" +
                                     errorSQL.Message + "\n" + oCommand.CommandText);
            }
            finally
            {
                oCommand = null;
                cerrarConexion();
            }
            return oDataTable;
        }

        //Método que permite ejecutar instrucciones Select 
        //Retorna el resultado en un objeto DataTable
        public DataSet EjecutarConsultaDataSet(String oSql)
        {
            DataSet dsTabla = new DataSet();
            establecerConexion();
            try
            {

                SqlCommand oCommand = new SqlCommand();
                oCommand.Connection = oConexion;
                oCommand.CommandText = oSql;
                oCommand.CommandType = CommandType.Text;
                using (SqlDataAdapter adaptador = new SqlDataAdapter(oCommand))
                {
                    adaptador.Fill(dsTabla);
                    adaptador.Dispose();
                }
            }

            catch (Exception error)
            {
                throw new Exception("Error en Ejecutar SQL DataSet:\n" +
                                     error.Message + "\n" + oSql);
            }
            finally
            {
                cerrarConexion();
            }

            return dsTabla;
        }

        // Método que permite ejecutar sentencias SQL Escalares --> SUM, AVG, MIN, MAX, etc.
        //Retorna el único resultado que genera la consulta en una String
        public String EjecutarSQLScalar(String oSql)
        {
            establecerConexion();
            //Declaración de variable para resultado del SqlScalar            
            String vResultadoScalar = "";
            try
            {
                // Creación del nuevo objeto tipo Command
                SqlCommand oCommand = new SqlCommand();

                //Asignación del objeto conexión, String SQL y tipo Command
                oCommand.Connection = oConexion;
                oCommand.CommandText = oSql;
                oCommand.CommandType = CommandType.Text;

                if (oCommand.ExecuteScalar().ToString().Equals(null))
                {
                    vResultadoScalar = "";
                }
                else
                {
                    vResultadoScalar = oCommand.ExecuteScalar().ToString();
                }
                //Ejecutar el SQL Escalar y retornar el valor 
                //Retornar el resultado del SqlScalar
                return vResultadoScalar;
            }
            catch (Exception error)
            {
                throw new Exception("Error en Ejecutar SQL escalar:\n" +
                                      error.Message + "\n" + oSql);

            }
            finally
            {
                cerrarConexion();
            }

        }

        // Método que permite ejecutar sentencias SQL Escalares --> SUM, AVG, MIN, MAX, etc.
        //Retorna el único resultado que genera la consulta en una String
        public String EjecutarSQLScalar(SqlCommand oCommand)
        {
            establecerConexion();
            //Declaración de variable para resultado del SqlScalar            
            String vResultadoScalar = "";

            try
            {
                //Asignación del objeto conexión, String SQL y tipo Command
                oCommand.Connection = oConexion;

                //Ejecutar el SQL Escalar y retornar el valor 
                vResultadoScalar = oCommand.ExecuteScalar().ToString();
                //Retornar el resultado del SqlScalar
                return vResultadoScalar;
            }
            catch (Exception error)
            {
                throw new Exception("Error en Ejecutar SQL escalar:\n" + error.Message +
                                     "\n" + oCommand.CommandText);

            }
            finally
            {
                cerrarConexion();
            }

        }
    }
}
