using System;
using System.Collections.Generic;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Capstone_UI
{
    public partial class mainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void ticket_create(object sender, EventArgs e)
        {
            Response.Redirect("TicketForm.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("explorer.exe", "-p");
        }
    }
}