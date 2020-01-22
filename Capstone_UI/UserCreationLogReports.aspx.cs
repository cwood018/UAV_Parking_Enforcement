using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class UserCreationLogReports : System.Web.UI.Page
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
                usercreationGridView.DataSource = wb.CallProcedure("allcreationlogs");
                usercreationGridView.DataBind();
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            usercreationGridView.DataSource = wb.CallProcedure("creationlogs",
                "@created", createdTextBox.Text,
                "@creator", creatorTextBox.Text);
            usercreationGridView.DataBind();
        }

        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            usercreationGridView.SelectedIndex = -1;
        }

        protected void userdeletionGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            usercreationGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(createdTextBox.Text)
                || !String.IsNullOrEmpty(creatorTextBox.Text))
            {
                usercreationGridView.DataSource = wb.CallProcedure("creationlogs",
                "@created", createdTextBox.Text,
                "@creator", creatorTextBox.Text);
            }
            else
            {
                usercreationGridView.DataSource = wb.CallProcedure("allcreationlogs");
            }
            usercreationGridView.DataBind();
        }
    }
}