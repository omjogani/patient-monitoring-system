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
    public partial class view_patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
                /*GridView1.Columns[7].Visible = false;
                GridView1.Columns[9].Visible = false;
                GridView1.Columns[10].Visible = false;
                GridView1.Columns[11].Visible = false;
                GridView1.Columns[12].Visible = false;
                GridView1.Columns[13].Visible = false;*/
                bindGrid();
            }

        }

        protected void bindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    if(txt_search.Text.Length == 0)
                    {
                        cmd.CommandText = "select * from patients";
                        //Response.Write("normal....");
                    }
                    else
                    {
                        cmd.CommandText = "select * from patients where name like '%' + @name + '%'";
                        cmd.Parameters.AddWithValue("@name", txt_search.Text.Trim());
                        //Response.Write("seach....");
                    }
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

        protected void AddRecord(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            NameValueCollection pair = new NameValueCollection();
            pair.Add("PatientId", btn.CommandArgument.ToString());

            //Response.Write(btn.CommandArgument.ToString());
            //Response.Write(gvr.Cells[1].Text);
            
            switch (btn.CommandName)
            {
                case "ThisBtnClick":
                    //Response.Write(btn.CommandArgument.ToString());
                    RedirectWithData(pair, "add_records.aspx");
                    break;
                case "ThatBtnClick":
                    Response.Write(btn.CommandArgument.ToString());
                    break;
            }
            
        }

        protected void EditRecord(object sender, EventArgs e) {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            NameValueCollection pair = new NameValueCollection();
            pair.Add("PatientId", btn.CommandArgument.ToString());

            //Response.Write(btn.CommandArgument.ToString());
            //Response.Write(gvr.Cells[1].Text);

            switch (btn.CommandName)
            {
                case "ThisBtnClick":
                    //Response.Write(btn.CommandArgument.ToString());
                    RedirectWithData(pair, "update_patient.aspx");
                    break;
                case "ThatBtnClick":
                    Response.Write(btn.CommandArgument.ToString());
                    break;
            }
        }
        protected void ViewRecords(object sender, EventArgs e) {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            NameValueCollection pair = new NameValueCollection();
            pair.Add("PatientId", btn.CommandArgument.ToString());

            //Response.Write(btn.CommandArgument.ToString());
            //Response.Write(gvr.Cells[1].Text);

            switch (btn.CommandName)
            {
                case "ThisBtnClick":
                    //Response.Write(btn.CommandArgument.ToString());
                    RedirectWithData(pair, "view_records.aspx");
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

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    
                    {
                        cmd.CommandText = "select * from patients where name like '%' + @name + '%'";
                        cmd.Parameters.AddWithValue("@name", txt_search.Text.Trim());
                        //Response.Write("seach....");
                    }
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
    }
}