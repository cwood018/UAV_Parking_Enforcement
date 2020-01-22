using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace Capstone_UI
{
    public class webMethods
    {
        public webMethods()
        {

        }
        public DataTable CallProcedure(string prodecure)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                            da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
            
        }
        public DataTable CallProcedure(string prodecure, string proparam1, string param1)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter(proparam1, param1));
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
        }
        public DataTable CallProcedure(string prodecure, string proparam1, int param1)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter(proparam1, param1));
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
        }
        public DataTable CallProcedure(string prodecure, string proparam1, string param1,
           string proparam2, string param2)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (!String.IsNullOrEmpty(param1))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam1, param1));
                    }
                    if (!String.IsNullOrEmpty(param2))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam2, param2));
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
        }

        public DataTable CallProcedure(string prodecure, string proparam1, string param1,
           string proparam2, string param2,
           string proparam3, string param3)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (!String.IsNullOrEmpty(param1))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam1, param1));
                    }
                    if (!String.IsNullOrEmpty(param2))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam2, param2));
                    }
                    if (!String.IsNullOrEmpty(param3))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam3, param3));
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
        }
        public DataTable CallProcedure(string prodecure,string proparam1, string param1, 
            string proparam2, string param2,
            string proparam3, string param3, 
            string proparam4, string param4)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (!String.IsNullOrEmpty(param1))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam1, param1));
                    }
                    if (!String.IsNullOrEmpty(param2))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam2, param2));
                    }
                    if (!String.IsNullOrEmpty(param3))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam3, param3));
                    }
                    if (!String.IsNullOrEmpty(param4))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam4, param4));
                    }                    
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
        }

        public DataTable CallProcedure(string prodecure, string proparam1, int param1,
            string proparam2, string param2,
            string proparam3, string param3,
            string proparam4, string param4)
        {
            DataSet tickets = new DataSet();
            string conn = ConfigurationManager.ConnectionStrings["capstone_finalConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand(prodecure, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (param1 != -1)
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam1, param1));
                    }
                    if (!String.IsNullOrEmpty(param2))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam2, param2));
                    }
                    if (!String.IsNullOrEmpty(param3))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam3, param3));
                    }
                    if (!String.IsNullOrEmpty(param4))
                    {
                        cmd.Parameters.Add(new SqlParameter(proparam4, param4));
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(tickets, "ss");
                    }
                }
            }
            return tickets.Tables["ss"];
        }
    }
}