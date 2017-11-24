using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class ParteProveedor
    {
        public int noSeq {set;get;}  
        public int idParte {set;get;}
        public int idCategoriaParte {set;get;}
        public string descripcion {set;get;}
        public int idProveedor {set;get;}
        public int idProvincia {set;get;}
        public int idCanton {set;get;}
        public string codProveedor {set;get;}
        public int estado {set;get;}
        public int clasificacion {set;get;}
        public float precio {set;get;}
        public bool envio {set;get;}
        public float costoEnvio {set;get;}
        public string imagen { set; get; }

        public ParteProveedor()
        {
            noSeq = 0;
            idParte = 0;
            idCategoriaParte = 0;
            descripcion = "";
            idProveedor = 0;
            idProvincia = 0;
            idCanton = 0;
            codProveedor = "";
            estado = 0;
            clasificacion = 0;
            precio = 0;
            envio = false;
            costoEnvio = 0;
            imagen = "";
        }
    }
}
