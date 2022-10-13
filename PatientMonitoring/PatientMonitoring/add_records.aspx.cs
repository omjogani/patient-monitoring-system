using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatientMonitoring
{
    public partial class add_records : System.Web.UI.Page
    {
        int patientId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                patientId = Convert.ToInt32(Request.Form.Get("PatientId"));
                
                hf_patientid.Value = patientId.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "insert into patientsrecords (pid,illness, complaints, pho, treatments) values (@pid,@illness, @complaints, @pho, @treatment)";
                String illness = illness_text.Text;
                String complaints = complaints_text.Text;
                String pho = pho_text.Text;
                String treatment = treatment_text.Text;
                patientId = Convert.ToInt32(hf_patientid.Value);

                using (SqlCommand cmd = new SqlCommand(query))
                {

                    cmd.Parameters.AddWithValue("@illness", illness);
                    cmd.Parameters.AddWithValue("@pid", patientId);
                    cmd.Parameters.AddWithValue("@complaints", complaints);
                    cmd.Parameters.AddWithValue("@pho", pho);
                    cmd.Parameters.AddWithValue("@treatment", treatment);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        query = query.Replace(p.ParameterName, p.Value.ToString());
                    }
                    //Response.Write(query);
                    Response.Redirect("view_patients.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
            }
        }
    }
}