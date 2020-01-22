using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class UserDeletionReport : System.Web.UI.Page
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
                userdeletionGridView.DataSource = wb.CallProcedure("alldeletionlogs");
                userdeletionGridView.DataBind();
            }
        }
        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            userdeletionGridView.DataSource = wb.CallProcedure("deletionlogs",
                "@deleted", deletedTextBox.Text,
                "@deletor", deletorTextBox.Text);
            userdeletionGridView.DataBind();
        }
        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            userdeletionGridView.SelectedIndex = -1;
        }
        protected void userdeletionGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            userdeletionGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(deletedTextBox.Text)
                || !String.IsNullOrEmpty(deletorTextBox.Text))
            {
                userdeletionGridView.DataSource = wb.CallProcedure("deletionlogs",
                "@deleted", deletedTextBox.Text,
                "@deletor", deletorTextBox.Text);
            }
            else
            {
                userdeletionGridView.DataSource = wb.CallProcedure("alldeletionlogs");
            }
            userdeletionGridView.DataBind();
        }
    }
}