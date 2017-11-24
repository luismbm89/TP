using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace slnPartes
{
    public class EnviarCorreo
    {
        public string destinatario { set; get; }
        public string asunto { set; get; }
        public string mensaje { set; get; }
        public string remitente { set; get; }

        public EnviarCorreo()
        {
            destinatario = "";
            asunto = "";
            mensaje = "";
            remitente = "";
        }

        public string EnviarEmail()
        {
            string alerta = "";

            /*-------------------------MENSAJE DE CORREO----------------------*/

            //Creamos un nuevo Objeto de mensaje
            System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

            //Direccion de correo electronico a la que queremos enviar el mensaje
            mmsg.To.Add(destinatario);

            //Nota: La propiedad To es una colección que permite enviar el mensaje a más de un destinatario

            //Asunto
            mmsg.Subject = asunto;
            mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

            //Direccion de correo electronico que queremos que reciba una copia del mensaje
            mmsg.Bcc.Add("ticopartscr@gmail.com"); //Opcional

            //Cuerpo del Mensaje
            mmsg.Body = "<IMG SRC='../Imagenes/tplogo1.png'> <h2>TicoParts.co.cr</h2>" + mensaje;
            mmsg.BodyEncoding = System.Text.Encoding.UTF8;
            mmsg.IsBodyHtml = true; //Si no queremos que se envíe como HTML

            //Correo electronico desde la que enviamos el mensaje
            mmsg.From = new System.Net.Mail.MailAddress(remitente,"TicoParts - Partes");


            /*-------------------------CLIENTE DE CORREO----------------------*/

            //Creamos un objeto de cliente de correo
            System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

            //Hay que crear las credenciales del correo emisor
            cliente.Credentials =
                new System.Net.NetworkCredential("ticopartscr@gmail.com", "Ticoparts2016");

            //Lo siguiente es obligatorio si enviamos el mensaje desde Gmail

            cliente.Port = 587;
            cliente.EnableSsl = true;


            cliente.Host = "smtp.gmail.com"; //Para Gmail "smtp.gmail.com";

            alerta = "Correo enviado correctamente, Pronto estaremos en contacto";
            /*-------------------------ENVIO DE CORREO----------------------*/

            try
            {
                //Enviamos el mensaje      
                cliente.Send(mmsg);
                alerta = "Correo enviado correctamente, Pronto estaremos en contacto";
            }
            catch (System.Net.Mail.SmtpException ex)
            {
                alerta = ex.ToString();
            }
            return alerta;
        }
    }
}