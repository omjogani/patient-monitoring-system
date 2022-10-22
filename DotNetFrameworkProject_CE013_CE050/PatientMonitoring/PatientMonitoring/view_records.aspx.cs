using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using System.Text;

namespace PatientMonitoring
{
    public partial class view_records : System.Web.UI.Page
    {
        int patientId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                patientId = Convert.ToInt32(Request.Form.Get("PatientId"));
                //Response.Write(patientId);
                //if(patientId <= 0)
                //{
                   //Response.Redirect("view_patients.aspx");
                //}
                bindGrid();
                getName();
            }
        }

        protected void bindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    /*
                    if (txt_search.Text.Length == 0)
                    {
                        cmd.CommandText = $"select * from patientsrecords where pid = {patientId}";
                        //Response.Write(cmd.CommandText);
                    }
                    else
                    {
                        cmd.CommandText = "select * from patientsrecords where illness like '%' + @illness + '%'";
                        cmd.Parameters.AddWithValue("@illness", txt_search.Text.Trim());
                    }*/
                        cmd.CommandText = $"select * from patientsrecords where pid = {patientId}";

                    cmd.Connection = con;
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void getName()
        {
            string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            SqlCommand com = new SqlCommand($"select name from patients where Id = {patientId}", con);
            // table name   
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset  

            string name = 
                Convert.ToString(ds.Tables[0].Rows[0]["Name"]);
            lbl_name.Text = name;
            //Response.Write(name);
        }

        protected void EditRecord(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            NameValueCollection pair = new NameValueCollection();
            pair.Add("RecordId", btn.CommandArgument.ToString());

            //Response.Write(btn.CommandArgument.ToString());
            //Response.Write(gvr.Cells[1].Text);

            switch (btn.CommandName)
            {
                case "ThisBtnClick":
                    //Response.Write(btn.CommandArgument.ToString());
                    RedirectWithData(pair, "update_record.aspx");
                    break;
                case "ThatBtnClick":
                    Response.Write(btn.CommandArgument.ToString());
                    break;
            }
        }

        public static void RedirectWithData(NameValueCollection data, string url)
        {
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();

            StringBuilder s = new StringBuilder();
            s.Append("<html>");
            s.AppendFormat("<body onload='document.forms[\"form\"].submit()'>");
            s.AppendFormat("<form name='form' action='{0}' method='post'>", url);
            foreach (string key in data)
            {
                s.AppendFormat("<input type='hidden' name='{0}' value='{1}' />", key, data[key]);
            }
            s.Append("</form></body></html>");
            response.Write(s.ToString());
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            //response.End();
        }
    }
}