using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class UnsentTicketsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Sesh mySesh = new Sesh();
                mySesh = (Sesh)Session["Item"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("login.aspx");
            }

            webMethods wb = new webMethods();
            if (!IsPostBack)
            {
                UnsentTicketsGridView.DataSource = wb.CallProcedure("allunsenttickets");
                UnsentTicketsGridView.DataBind();
            }            
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            if (!String.IsNullOrEmpty(ticketIDTextBox.Text))
            {
                UnsentTicketsGridView.DataSource = wb.CallProcedure("unsenttickets", "@id", int.Parse(ticketIDTextBox.Text));
                UnsentTicketsGridView.DataBind();
            }
            else
            {

            }
        }
        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            UnsentTicketsGridView.SelectedIndex = -1;
        }

        protected void UnsentTicketsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            UnsentTicketsGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(ticketIDTextBox.Text))
            {
                UnsentTicketsGridView.DataSource = wb.CallProcedure("unsenttickets", "@id", 
                    int.Parse(ticketIDTextBox.Text));
            }
            else
            {
                UnsentTicketsGridView.DataSource = wb.CallProcedure("allunsenttickets");
            }
            UnsentTicketsGridView.DataBind();
        }
    }
}