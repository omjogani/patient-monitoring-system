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
    public partial class update_record : System.Web.UI.Page
    {
        int rid;
        int pid;
        string illness;
        string complaints;
        string pho;
        string treatments;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                rid = Convert.ToInt32(Request.Form.Get("RecordId"));
                hf_recordid.Value = rid.ToString();

                //Response.Write(id);
                string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                SqlCommand com = new SqlCommand($"select * from patientsrecords where Id = {Convert.ToInt32(rid)}", con);
                // table name   
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);  // fill dataset  

                illness = Convert.ToString(ds.Tables[0].Rows[0]["illness"]);
                pid = Convert.ToInt32(ds.Tables[0].Rows[0]["pid"]);
                //Response.Write(id);
                complaints = Convert.ToString(ds.Tables[0].Rows[0]["complaints"]);
                pho = Convert.ToString(ds.Tables[0].Rows[0]["pho"]);
                treatments = Convert.ToString(ds.Tables[0].Rows[0]["treatments"]);


                illness_text.Text = illness;
                complaints_text.Text = complaints;
                pho_text.Text = pho;
                treatment_text.Text = treatments;

            }
        }

        protected void btn_udpate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "update patientsrecords set illness=@illness,complaints=@complaints,pho=@pho,treatments=@treatments where Id=@Id";

                rid = Convert.ToInt32(hf_recordid.Value);
                illness = illness_text.Text;
                complaints = complaints_text.Text;
                pho = pho_text.Text;
                treatments = treatment_text.Text;



                /*
                Response.Write(uid);
                Response.Write(name);
                Response.Write(url);
                Response.Write(description);
                Response.Write(isPublic);
                */


                using (SqlCommand cmd = new SqlCommand(query))
                {

                    cmd.Parameters.AddWithValue("@illness", illness);
                    cmd.Parameters.AddWithValue("@complaints", complaints);
                    cmd.Parameters.AddWithValue("@pho", pho);
                    cmd.Parameters.AddWithValue("@treatments", treatments);
                    cmd.Parameters.AddWithValue("@Id", rid);


                    cmd.Connection = con;
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    /*
                    Response.Write("Link is updated successfully.");
                    Response.Write(result.ToString());

                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        query = query.Replace(p.ParameterName, p.Value.ToString());
                    }
                    Response.Write(query);
                    */
                    //Response.Redirect("view_records.aspx");
                    NameValueCollection pair = new NameValueCollection();
                    pair.Add("PatientId", pid.ToString());
                    RedirectWithData(pair, "view_records.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "Delete from [PatientsRecords] where [Id]=@Id";
                rid = Convert.ToInt32(hf_recordid.Value);

                using (SqlCommand cmd = new SqlCommand(query))
                {

                    //cmd.Parameters.AddWithValue("@Uid", Convert.ToInt64(uid));
                    cmd.Parameters.AddWithValue("@Id", rid);


                    cmd.Connection = con;
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    /*
                    Response.Write("Link is deleted successfully.");
                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        query = query.Replace(p.ParameterName, p.Value.ToString());
                    }
                    Response.Write(query);
                    */
                    //Response.Redirect("view_records.aspx");
                    NameValueCollection pair = new NameValueCollection();
                    pair.Add("PatientId", pid.ToString());
                    RedirectWithData(pair, "view_records.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
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