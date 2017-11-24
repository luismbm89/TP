using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class ImagenParte
    {
        public int idImagen { set; get; }
        public int idParte { set; get; }
        public int idProveedor { set; get; }
        public String rutaImagen { set; get; }

        public ImagenParte()
        {
            idImagen = 0;
            idParte = 0;
            idProveedor = 0;
            rutaImagen = "";
        }
    }
}
