using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security; 
public partial class NewPetition : System.Web.UI.Page
{
    private string userId;

    protected void Page_Load(object sender, EventArgs e)
    {
        userId = Session["UserId"] as string;


    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text.Trim();
        string content = txtContent.Text.Trim();
        

        if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(content))
        {
            lblMessage.Text = "제목과 내용을 모두 입력하세요.";
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = conn.CreateCommand())
        {
            cmd.CommandText = @"
                INSERT INTO Petition (PetitionTitle, PetitionText, IdInsert)
                VALUES (@title, @content, @userId)";

            cmd.Parameters.AddWithValue("@title", title);
            cmd.Parameters.AddWithValue("@content", content);
            cmd.Parameters.AddWithValue("@userId", (object)userId ?? DBNull.Value);
            //cmd.Parameters.AddWithValue("@userId", User.Identity.Name);  

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Redirect("PetitionAll.aspx");
            }
            catch (Exception ex)
            {
                lblMessage.Text = "등록 중 오류 발생: " + ex.Message;
            }
        }
    }
}
