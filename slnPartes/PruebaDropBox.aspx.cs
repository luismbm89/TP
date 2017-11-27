using Dropbox.Api;
using Dropbox.Api.Files;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace slnPartes
{
    public partial class PruebaDropBox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async System.Threading.Tasks.Task Unnamed2_ClickAsync(object sender, EventArgs e)
        {
            DropboxClient dc = new DropboxClient("deBZ26uJD3AAAAAAAAAAjNTtV6CI6SWXFsWMOI9BRjKv8XSF0zgH7uOG_UCwR2Zf");
            var file = "159386425737-IPs.txt";
            var mem = new MemoryStream(Encoding.UTF8.GetBytes("TESTING"));
            try
            {
                var updated = await dc.Files.UploadAsync(file, WriteMode.Overwrite.Instance, body: mem);
            }
            catch (Exception ex)
            {
                lblResult.Text = ex.Message;
            }
        }
    }
}