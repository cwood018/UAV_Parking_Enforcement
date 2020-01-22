using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class TicketsOfUserReport : System.Web.UI.Page
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
                TicketsOfUserGridView.DataSource = wb.CallProcedure("alltickets");
                TicketsOfUserGridView.DataBind();
            }               
        }
        
        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            TicketsOfUserGridView.DataSource = wb.CallProcedure("ticketsOfUsers",
                "@anumber", AnumTextBox.Text, 
                "@firstname", FirstNameTextBox.Text, 
                "@lastname", LastNameTextBox.Text, 
                "@email", EmailTextBox.Text);
            TicketsOfUserGridView.DataBind();
        }

        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            TicketsOfUserGridView.SelectedIndex = -1;
        }

        protected void TicketsOfUserGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            TicketsOfUserGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(AnumTextBox.Text)
                || !String.IsNullOrEmpty(FirstNameTextBox.Text)
                || !String.IsNullOrEmpty(LastNameTextBox.Text)
                || !String.IsNullOrEmpty(EmailTextBox.Text))
            {
                TicketsOfUserGridView.DataSource = wb.CallProcedure("ticketsOfUsers",
                "@anumber", AnumTextBox.Text,
                "@firstname", FirstNameTextBox.Text,
                "@lastname", LastNameTextBox.Text,
                "@email", EmailTextBox.Text);
            }
            else
            {
                TicketsOfUserGridView.DataSource = wb.CallProcedure("alltickets");
            }
            TicketsOfUserGridView.DataBind();
        }
    }
}