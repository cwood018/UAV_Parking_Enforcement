using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class CarsOfParkers : System.Web.UI.Page
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
                CarsParkersGridView.DataSource = wb.CallProcedure("allcarsofusers");
                CarsParkersGridView.DataBind();
            }            
        }
        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            webMethods wb = new webMethods();
            CarsParkersGridView.DataSource = wb.CallProcedure("carsofusers", 
                                                              "@plate", PlateTextBox.Text,
                                                              "@anumber", anumTextBox.Text);
            CarsParkersGridView.DataBind();
        }
        protected void CloseFormBtn_Click(object sender, EventArgs e)
        {
            CarsParkersGridView.SelectedIndex = -1;
        }

        protected void CarsParkersGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            webMethods wb = new webMethods();
            CarsParkersGridView.PageIndex = e.NewPageIndex;
            if (!String.IsNullOrEmpty(PlateTextBox.Text)
                || !String.IsNullOrEmpty(anumTextBox.Text))
            {
                CarsParkersGridView.DataSource = wb.CallProcedure("carsofusers",
                                                              "@plate", PlateTextBox.Text,
                                                              "@anumber", anumTextBox.Text);
            }
            else
            {
                CarsParkersGridView.DataSource = wb.CallProcedure("allcarsofusers");
            }
            CarsParkersGridView.DataBind();
        }
    }
}