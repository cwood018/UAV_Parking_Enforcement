using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class CarTicket : System.Web.UI.Page
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
                TicketsOfCarsGridView.DataSource = wb.CallProcedure("AllCarsTickets");
                TicketsOfCarsGridView.DataBind();
            }            
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            TicketsOfCarsGridView.DataSource = wb.CallProcedure("TicketsOfCars",
            "@plate", plateTextBox.Text,
            "@start", startTimeTextBox.Text,
            "@end", endTimeTextBox.Text);
            TicketsOfCarsGridView.DataBind();
                        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TicketsOfCarsGridView.SelectedIndex = -1;
        }

        protected void TicketsOfCarsGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            TicketsOfCarsGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(plateTextBox.Text) 
                || !String.IsNullOrEmpty(startTimeTextBox.Text) 
                || !String.IsNullOrEmpty(endTimeTextBox.Text))
            {
                TicketsOfCarsGridView.DataSource = wb.CallProcedure("TicketsOfCars",
                "@plate", plateTextBox.Text,
                "@start", startTimeTextBox.Text,
                "@end", endTimeTextBox.Text);
            }
            else
            {
                TicketsOfCarsGridView.DataSource = wb.CallProcedure("AllCarsTickets");
            }
            TicketsOfCarsGridView.DataBind();
        }
    }
}