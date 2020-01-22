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
    public partial class WebForm1 : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        Sesh mySesh = new Sesh();
        string UName;
        string Pass;
        bool oper = true;

        protected void Button1_Click(object sender, EventArgs e)
        {

            UName = userNameInput.Text;
            Pass = passwordInput.Text;

            SqlConnection db = new SqlConnection(SqlDataSource1.ConnectionString);
            db.Open();

            SqlCommand check_User_Name = new SqlCommand("SELECT * FROM System_Users where username like @UName and hashed_passwords = @Pass;", db);
            check_User_Name.Parameters.AddWithValue("@UName", userNameInput.Text);
            check_User_Name.Parameters.AddWithValue("@Pass", passwordInput.Text);
            SqlDataReader reader = check_User_Name.ExecuteReader();
            if (reader.HasRows)
            {

               this.mySesh.Create_Session(this.userNameInput.Text);
                Session["Item"] = mySesh;
                Response.Redirect("mainPage.aspx");
                
            }
            else
            {
                //User NOT Exists
                Label1.Text = "INCORRECT USER NAME OR PASSWORD!"; Label1.Visible = true;

            }
            db.Close();

        }




    }
}