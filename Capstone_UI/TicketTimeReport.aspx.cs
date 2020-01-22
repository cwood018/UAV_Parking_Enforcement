using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class TicketTimeReport : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                webMethods wb = new webMethods();
                TicketTimeGridView.DataSource = wb.CallProcedure("alltickets");
                TicketTimeGridView.DataBind();
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            if (!String.IsNullOrEmpty(TicketIDTextBox.Text))
            {
                TicketTimeGridView.DataSource = wb.CallProcedure("tickettime",
                "@ticketid", int.Parse(TicketIDTextBox.Text),
                "@plate", PlateNumTextBox.Text,
                "@start", StartTimeTextBox.Text,
                "@end", EndTimeTextBox.Text);
                TicketTimeGridView.DataBind();
            }
            else
            {
                TicketTimeGridView.DataSource = wb.CallProcedure("tickettime",
                "@ticketid", -1,
                "@plate", PlateNumTextBox.Text,
                "@start", StartTimeTextBox.Text,
                "@end", EndTimeTextBox.Text);
                TicketTimeGridView.DataBind();
            }
        }
               
        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            TicketTimeGridView.SelectedIndex = -1;
        }

        protected void TicketTimeGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            TicketTimeGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(TicketIDTextBox.Text)
                || !String.IsNullOrEmpty(PlateNumTextBox.Text)
                || !String.IsNullOrEmpty(StartTimeTextBox.Text)
                || !String.IsNullOrEmpty(EndTimeTextBox.Text))
            {
                if (!String.IsNullOrEmpty(TicketIDTextBox.Text))
                {
                    TicketTimeGridView.DataSource = wb.CallProcedure("tickettime",
                    "@ticketid", int.Parse(TicketIDTextBox.Text),
                    "@plate", PlateNumTextBox.Text,
                    "@start", StartTimeTextBox.Text,
                    "@end", EndTimeTextBox.Text);
                }
                else
                {
                    TicketTimeGridView.DataSource = wb.CallProcedure("tickettime",
                    "@ticketid", -1,
                    "@plate", PlateNumTextBox.Text,
                    "@start", StartTimeTextBox.Text,
                    "@end", EndTimeTextBox.Text);
                    TicketTimeGridView.DataBind();
                }
                
            }
            else
            {
                TicketTimeGridView.DataSource = wb.CallProcedure("alltickets");
            }
            TicketTimeGridView.DataBind();
        }
    }
}