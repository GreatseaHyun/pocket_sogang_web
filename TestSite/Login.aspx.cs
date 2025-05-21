using System;
using System.Configuration;
using System.Data.SqlClient;
//using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string userId = txtUserId.Text.Trim();
        string password = txtPassword.Text;

        if (userId == "" || password == "")
        {
            lblMessage.Text = "아이디와 비밀번호를 입력하세요.";
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = conn.CreateCommand())
        {
            cmd.CommandText = @"
                SELECT COUNT(*) 
                FROM Users_Final
                WHERE UserId = @UserId AND PasswordH = @Password";

            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Password", password); // 평문 비교

            try
            {
                conn.Open();
                int count = (int)cmd.ExecuteScalar();

                if (count == 1)
                {
                    // 로그인 성공
                    Session["UserId"] = userId;
                    //FormsAuthentication.SetAuthCookie(userId, false);
                    Response.Redirect("Welcome.aspx"); // 또는 Main.aspx
                }
                else
                {
                    lblMessage.Text = "아이디 또는 비밀번호가 틀렸습니다.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "오류 발생: " + ex.Message;
            }
        }
    }
}