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
    public partial class add_patient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "insert into patients (name, age, weight, gender) values (@name, @age, @weight, @gender)";
                String name = patient_name.Text;
                String age = patient_age.Text;
                String weight = patient_weight.Text;
                String gender = patient_gender.SelectedValue;
                Console.WriteLine(gender);                

                using (SqlCommand cmd = new SqlCommand(query))
                {
                    
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@age", age);
                    cmd.Parameters.AddWithValue("@weight", weight);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("home.aspx");
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