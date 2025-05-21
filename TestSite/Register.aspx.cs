using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; 
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)  // 처음 로드될 때만 실행
        {
            ddlMajor.Items.Add("국어국문학과");
            ddlMajor.Items.Add("사학과");
            ddlMajor.Items.Add("철학과");
            ddlMajor.Items.Add("종교학과");
            ddlMajor.Items.Add("영문학부");
            ddlMajor.Items.Add("유럽문화학과");
            ddlMajor.Items.Add("중국문화학과");
            ddlMajor.Items.Add("일본문화학과");
            ddlMajor.Items.Add("인문학기반자유전공학부");

            ddlMajor.Items.Add("사회학과");
            ddlMajor.Items.Add("정치외교학과");
            ddlMajor.Items.Add("심리학과");

            ddlMajor.Items.Add("경제학과");

            ddlMajor.Items.Add("경영학부");

            ddlMajor.Items.Add("글로벌한국학부");
            ddlMajor.Items.Add("게페르트국제학부");
            ddlMajor.Items.Add("글로벌융합학부");

            ddlMajor.Items.Add("지식융합미디어학부");
            ddlMajor.Items.Add("신문방송학과");
            ddlMajor.Items.Add("미디어&엔터테인먼트학과");
            ddlMajor.Items.Add("아트&테크놀로지학과");

            ddlMajor.Items.Add("수학과");
            ddlMajor.Items.Add("물리학과");
            ddlMajor.Items.Add("화학과");
            ddlMajor.Items.Add("생명과학과");
            ddlMajor.Items.Add("SCIENCE기반자유전공학부");

            ddlMajor.Items.Add("전자공학과");
            ddlMajor.Items.Add("화공생명공학과");
            ddlMajor.Items.Add("기계공학과");
            ddlMajor.Items.Add("시스템반도체공학과");

            ddlMajor.Items.Add("컴퓨터공학과");
            ddlMajor.Items.Add("인공지능학과");
            ddlMajor.Items.Add("AI기반자유전공학부");
        }
            
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string userId = txtUserId.Text.Trim();
        string password = txtPassword.Text;
        string studentNo = txtStudentNo.Text.Trim();
        string major = ddlMajor.SelectedValue;

        if (userId == "" || password == "" || studentNo == "" || major == "")
        {
            lblMessage.Text = "모든 필드를 입력하세요.";
            return;
        }
        if (studentNo.Length != 8 || !int.TryParse(studentNo, out _) || !studentNo.StartsWith("20"))
        {
            lblMessage.Text = "학번은 '20'으로 시작하는 숫자 8자리여야 합니다.";
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;
        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = conn.CreateCommand())
        {
            cmd.CommandText = @"
                INSERT INTO Users_Final (UserId, PasswordH, StudentNumber, Major)
                VALUES (@UserId, @Password, @StudentNo, @Major)";
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Password", password); // 평문 저장
            cmd.Parameters.AddWithValue("@StudentNo", studentNo);
            cmd.Parameters.AddWithValue("@Major", major);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "회원가입이 완료되었습니다!";
                btnGoToLogin.Visible = true; 
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) // 중복된 아이디 또는 학번
                    lblMessage.Text = "이미 존재하는 아이디 혹은 학번입니다.";
                else
                    lblMessage.Text = "오류: " + ex.Message;
            }
        }
    }
}




