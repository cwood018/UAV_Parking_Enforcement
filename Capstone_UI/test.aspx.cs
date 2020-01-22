using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            hashing h = new hashing();
            Label1.Text = h.getHash(TextBox1.Text);
            Response.Write(Request.RawUrl.ToString());
        }
    }
}