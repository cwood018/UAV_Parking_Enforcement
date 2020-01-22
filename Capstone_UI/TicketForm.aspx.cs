using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Capstone_UI
{
    public partial class TicketForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void emailing(object sender, EventArgs e)
        {

            
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;

            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential("tamucc.parking.authority@gmail.com", "CapstoneTest!");
            
            
            
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("tamucc.parking.authority@gmail.com");
            mail.Subject = "Ticket Warning, DONOTREPLY";
            mail.To.Add(new MailAddress(dropdownLIst.Text));
            mail.Body = ticket_box.Text;

            smtpClient.Send(mail);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('MESSAGE SENT');", true);
        }


    }
}