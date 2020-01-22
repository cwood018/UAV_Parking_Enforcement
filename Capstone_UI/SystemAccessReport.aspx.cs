using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class SystemAccessReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Sesh mySesh = new Sesh();
                mySesh = (Sesh)Session["Item"];
                mySesh.Officer_Validation();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }


            webMethods wb = new webMethods();
            if (!IsPostBack)
            {
                sysaccessGridView.DataSource = wb.CallProcedure("allsysaccess");
                sysaccessGridView.DataBind();
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            sysaccessGridView.DataSource = wb.CallProcedure("sysaccess",
                "@uname", usernameTextBox.Text,
                "@start", starttimeTextBox.Text,
                "@end", endtimeTextBox.Text);
            sysaccessGridView.DataBind();
        }

        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            sysaccessGridView.SelectedIndex = -1;
        }

        protected void sysaccessGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            sysaccessGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(usernameTextBox.Text)
                || !String.IsNullOrEmpty(starttimeTextBox.Text)
                || !String.IsNullOrEmpty(endtimeTextBox.Text))
            {
                sysaccessGridView.DataSource = wb.CallProcedure("sysaccess",
                "@anumber", usernameTextBox.Text,
                "@firstname", starttimeTextBox.Text,
                "@lastname", endtimeTextBox.Text);
            }
            else
            {
                sysaccessGridView.DataSource = wb.CallProcedure("allsysaccess");
            }
            sysaccessGridView.DataBind();
        }
    }
}
