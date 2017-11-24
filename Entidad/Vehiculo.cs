using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class Vehiculo
    {
        public string Marca { set; get; }
        public string Modelo { set; get; }
        public string anno { set; get; }
        public int marca { set; get; }
        public int modelo { set; get; }

        public Vehiculo(string marcap, string modelop, string annop,int marca_p, int modelo_p)
        {
            Marca = marcap;
            Modelo = modelop;
            anno = annop;
            marca = marca_p;
            modelo = modelo_p;
        }

        public Vehiculo(string marcap, string modelop, string annop)
        {
            Marca = marcap;
            Modelo = modelop;
            anno = annop;
        }

        public override string ToString()
        {
            return Marca + " - " + Modelo + " - " + anno;
        }
    }
}
