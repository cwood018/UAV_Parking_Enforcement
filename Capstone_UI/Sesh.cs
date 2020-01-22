using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Capstone_UI
{
    public class Sesh
    {
        public string Uname;
        public string SessionID;
        bool valid;

        public Sesh() { Uname = ""; SessionID = ""; valid = false; }
    
        public void Create_Session(string user)
        {
            HttpContext.Current.Session["Account"] = user;
            Uname = user;

        }

        


        public void Validated()
       {
            if (HttpContext.Current.Session["Account"] == null || HttpContext.Current.Session["Account"] != Uname)
            {
                HttpContext.Current.Response.Redirect("login.aspx", true);
                valid = true;
            };

            
          
        }

        public void Officer_Validation()
        {
            if (Uname.Contains("Operator") == false || Uname.Contains("Admin") == true)
            {
                HttpContext.Current.Response.Write("YOU ARE NOT AN OFFICER");
                HttpContext.Current.Response.Redirect("mainPage.aspx", true);
            }
            else
            {
            }
        }

        public void Session_Timer()
        {
            this.Validated();
            HttpContext.Current.Session.Timeout = 5;
            HttpContext.Current.ThreadAbortOnTimeout = true; 

        }

    }
}