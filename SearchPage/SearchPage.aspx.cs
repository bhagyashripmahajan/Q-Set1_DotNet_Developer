using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace SearchPage
{
    public partial class SearchPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string connectionStr = ConfigurationManager.ConnectionStrings["connectionStr"].ConnectionString;
            using (SqlConnection con=new SqlConnection(connectionStr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "spSearchPage";
                cmd.CommandType = CommandType.StoredProcedure;

                if(inputCategory.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter("@Category", inputCategory.Value);
                    cmd.Parameters.Add(param);
                }

                if (inputProductName.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter("@ProductName", inputProductName.Value);
                    cmd.Parameters.Add(param);
                }

                if (inputSize.Value.Trim() != "" && inputSize.Value.Trim() != "Null")
                {
                    SqlParameter param = new SqlParameter("@Size", inputSize.Value);
                    cmd.Parameters.Add(param);
                }
                else if(inputSize.Value.Trim()=="Null")
                {
                    SqlParameter param = new SqlParameter("@Size", null);
                    cmd.Parameters.Add(param);
                }


                if (!string.IsNullOrEmpty(inputPriceMin.Value) && !string.IsNullOrEmpty(inputPriceMax.Value))
                {
                    int minPrice, maxPrice;
                    if (int.TryParse(inputPriceMin.Value, out minPrice) && int.TryParse(inputPriceMax.Value, out maxPrice)
                        && minPrice >= 100 && maxPrice >= 100 && minPrice <= 5000 && maxPrice <= 5000)
                    {
                        // Add parameters for min and max price.
                        SqlParameter paramMinPrice = new SqlParameter("@MinPrice", minPrice);
                        SqlParameter paramMaxPrice = new SqlParameter("@MaxPrice", maxPrice);
                        cmd.Parameters.Add(paramMinPrice);
                        cmd.Parameters.Add(paramMaxPrice);
                    }
                    else
                    {
                        // Handle the case where the input is not within the specified range.
                    }
                }
                    if (inputDate.Value.Trim() != "")
                {
                    SqlParameter param = new SqlParameter("@MfgDate", inputDate.Value);
                    cmd.Parameters.Add(param);
                }

                con.Open();
                SqlDataReader rdr=cmd.ExecuteReader();
                gvSearchResults.DataSource = rdr;
                gvSearchResults.DataBind();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            inputCategory.Value= string.Empty;
            inputProductName.Value = string.Empty;
            inputSize.SelectedIndex = 0;
            inputPriceMin.Value = "100";
            inputPriceMax.Value = "5000";
            inputDate.Value = string.Empty;
        }
    }
}