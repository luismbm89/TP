using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class Cotizacion
    {
        public int idCotizacion { set; get; }
        public string descripcion { set; get; }
        public int idMarca { set; get; }
        public int idModelo { set; get; }
        public string anno { set; get; }
        public string otrosDatos { set; get; }
        public int idUsuario { set; get; }
        public bool estado { set; get; }
        public string imagen { set; get; }

        public Cotizacion()
        {
            idCotizacion = 0;
            descripcion = "";
            idMarca = 0;
            idModelo = 0;
            anno = "";
            otrosDatos = "";
            idUsuario = 0;
            estado = true;
            imagen = "";
        }
    }
}
