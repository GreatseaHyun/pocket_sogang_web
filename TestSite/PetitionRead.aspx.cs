using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class PetitionRead : System.Web.UI.Page
{
    int petitionId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Request.QueryString["Id"], out petitionId))
        {
            lblMessage.Text = "잘못된 접근입니다.";
            return;
        }

        if (!IsPostBack)
            LoadPetition();
    }

    private void LoadPetition()
    {
        string connStr = ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand("SELECT PetitionTitle, PetitionText, ClickCountPos, ClickCountNeg FROM Petition WHERE Id = @id", conn))
        {
            cmd.Parameters.AddWithValue("@id", petitionId);
            conn.Open();
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    lblTitle.Text = reader["PetitionTitle"].ToString();
                    lblContent.Text = reader["PetitionText"].ToString();
                    lblAgree.Text = reader["ClickCountPos"].ToString();
                    lblDisagree.Text = reader["ClickCountNeg"].ToString();
                }
                else
                {
                    lblMessage.Text = "해당 청원을 찾을 수 없습니다.";
                }
            }
        }
    }

    protected void btnAgree_Click(object sender, EventArgs e)
    {
        string key = "Voted_" + petitionId;

        if (Session[key] != null)
        {
            lblMessage.Text = "이미 공감 또는 비공감을 선택하셨습니다.";
            return;
        }

        UpdateCount("ClickCountPos");
        Session[key] = true;
    }

    protected void btnDisagree_Click(object sender, EventArgs e)
    {
        string key = "Voted_" + petitionId;

        if (Session[key] != null)
        {
            lblMessage.Text = "이미 공감 또는 비공감을 선택하셨습니다.";
            return;
        }

        UpdateCount("ClickCountNeg");
        Session[key] = true;
    }

    private void UpdateCount(string columnName)
    {
        string connStr = ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand($"UPDATE Petition SET {columnName} = {columnName} + 1 WHERE Id = @id", conn))
        {
            cmd.Parameters.AddWithValue("@id", petitionId);
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        LoadPetition(); // 갱신된 수 다시 불러오기
    }
}
