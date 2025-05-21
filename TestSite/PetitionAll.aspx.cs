using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PetitionAll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadPetitions();
    }

    protected void btnNewPetition_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewPetition.aspx");
    }
    private void LoadPetitions()
    {
        string connStr = ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand("SELECT Id, PetitionTitle, ClickCountPos, DtInsert FROM Petition ORDER BY DtInsert DESC", conn))
        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
        {
            DataTable table = new DataTable();
            adapter.Fill(table);

            gvPetitions.DataSource = table;
            gvPetitions.DataBind();
        }
    }
    protected void gvPetitions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Read")
        {
            string id = e.CommandArgument.ToString();
            Response.Redirect($"PetitionRead.aspx?Id={id}");
        }
    }



}