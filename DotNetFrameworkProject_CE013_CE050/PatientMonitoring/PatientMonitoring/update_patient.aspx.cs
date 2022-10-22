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
    public partial class update_patient : System.Web.UI.Page
    {
        int pid;
        string name;
        int age;
        int weight;
        string gender;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!Page.IsPostBack)
            {
                pid = Convert.ToInt32(Request.Form.Get("PatientId"));
                hf_pid.Value = pid.ToString();

                //Response.Write(id);
                string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                SqlCommand com = new SqlCommand($"select * from patients where Id = {Convert.ToInt32(pid)}", con);
                // table name   
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);  // fill dataset  

                name = Convert.ToString(ds.Tables[0].Rows[0]["name"]);
                age = Convert.ToInt32(ds.Tables[0].Rows[0]["age"]);
                //Response.Write(id);
                weight = Convert.ToInt32(ds.Tables[0].Rows[0]["weight"]);
                gender = Convert.ToString(ds.Tables[0].Rows[0]["gender"]);
                

                patient_name.Text = name;
                patient_age.Text = Convert.ToString(age);
                patient_weight.Text = Convert.ToString(weight);
                patient_gender.Text = Convert.ToString(gender);

            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "update patients set name=@Name,age=@age,weight=@weight,gender=@gender where Id=@Id";

                pid = Convert.ToInt32(hf_pid.Value);
                name = patient_name.Text;
                age = Convert.ToInt32(patient_age.Text);
                weight = Convert.ToInt32(patient_weight.Text);
                gender = patient_gender.Text;

               

                /*
                Response.Write(uid);
                Response.Write(name);
                Response.Write(url);
                Response.Write(description);
                Response.Write(isPublic);
                */


                using (SqlCommand cmd = new SqlCommand(query))
                {
                    
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@weight", weight);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@Id", pid);
                 

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
                    Response.Redirect("view_patients.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "Delete from [Patients] where [Id]=@Id";
                pid = Convert.ToInt32(hf_pid.Value);

                using (SqlCommand cmd = new SqlCommand(query))
                {

                    //cmd.Parameters.AddWithValue("@Uid", Convert.ToInt64(uid));
                    cmd.Parameters.AddWithValue("@Id", pid);


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