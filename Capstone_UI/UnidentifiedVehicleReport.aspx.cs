using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class UnidentifiedVehicleReport : System.Web.UI.Page
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
                UnidentifiedGridView.DataSource = wb.CallProcedure("allUnidentifiedVehicles");
                UnidentifiedGridView.DataBind();
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            if (!String.IsNullOrEmpty(ticketIDTextBox.Text))
            {
                UnidentifiedGridView.DataSource = wb.CallProcedure("unidentifiedvehicles", "@id", int.Parse(ticketIDTextBox.Text));
                UnidentifiedGridView.DataBind();
            }
            else
            {
                
            }
        }
        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            UnidentifiedGridView.SelectedIndex = -1;
        }

        protected void UnidentifiedGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            UnidentifiedGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(ticketIDTextBox.Text))
            {
                UnidentifiedGridView.DataSource = wb.CallProcedure("unidentifiedvehicles", "@id", 
                    int.Parse(ticketIDTextBox.Text));
            }
            else
            {
                UnidentifiedGridView.DataSource = wb.CallProcedure("allUnidentifiedVehicles");
            }
            UnidentifiedGridView.DataBind();
        }
    }
}