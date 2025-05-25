using System;
using System.IO;
using System.Net;
using System.Text;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Data.SqlClient;


public partial class Chatbot : System.Web.UI.Page
{
    // 네가 발급받은 실제 Gemini API 키
    private string apiKey = "AIzaSyDvA21aGaxil3za1mIF-N5GFMaiAntEi-Q";

    // 최초 로딩 시 기본 컨텍스트 (서강대 설명 등)를 세션에 저장
    private const string SYSTEM_PROMPT = "너는 서강대학교 학생을 위한 AI 도우미야. 질문이 학사일정, " +
        "부서연결, 장학금, 수강신청, 성적, 교수, 서강대 역사 등과 관련되어 있다면 관련된 서강대 정보를 바탕으로 정확하고 간결하게 설명해줘. " +
        "내가 답변에 필요한 자료들 몇 개를 올려줄게. 질문이 서강대, 내가 올린 자료와 상관이 없어도 일반적인 답변은 해줘.";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && Session["BaseContext"] == null)
        {
            Session["BaseContext"] = SYSTEM_PROMPT;
        }

    }

    protected void btnAsk_Click(object sender, EventArgs e)
    {
        string question = txtQuestion.Text.Trim();
        if (string.IsNullOrEmpty(question))
        {
            lblAnswer.Text = "질문을 입력해주세요.";
            return;
        }
        // 학사 일정 JSON 파일 로드
        string schedulePath = Server.MapPath("~/data/2025_Schedule.json");
        string scheduleJson = File.ReadAllText(schedulePath);
        //var scheduleData = JsonConvert.DeserializeObject<Dictionary<string, string>>(scheduleJson);


        //부서-전번 json 파일 로드 
        string pnumPath = Server.MapPath("~/data/department_pnumber.json");
        string pnumJson = File.ReadAllText(pnumPath);
        //var pnumData = JsonConvert.DeserializeObject<List<Dictionary<string, string>>>(pnumJson);

        string cEvaluationPath = Server.MapPath("~/data/Sogang_CourseEvaluation.json");
        string cEvaluationJson = File.ReadAllText(cEvaluationPath);

        string sogangIdeology = File.ReadAllText(Server.MapPath("~/data/Sogang_ideology.txt"));
        string sogangmajor = File.ReadAllText(Server.MapPath("~/data/Sogang_major.txt"));
        string sogangexchange = File.ReadAllText(Server.MapPath("~/data/Sogang_exchange.txt"));
        string sogangschoolfood = File.ReadAllText(Server.MapPath("~/data/Sogang_Schoolfood(25.5.19-25.5.23).txt"));


        string prompt = $"{SYSTEM_PROMPT}\n\n"
                  + $"[서강대 2025 학사일정]\n{scheduleJson}\n\n"
                  + $"[서강대 부서-이름-전화번호데이터]\n{pnumJson}\n\n"
                  + $"[서강대 24년 2학기 강의평가]\n{cEvaluationJson}\n\n"
                  + $"[서강대 역사와 교육이념]\n{sogangIdeology}\n\n"
                  + $"[서강대 전공과 특징]\n{sogangmajor}\n\n"
                  + $"[서강대 2025 대학교류 정보]\n{sogangexchange}\n\n"
                  + $"[서강대 25.5.19-25.5.23 학식메뉴]\n{sogangschoolfood}\n\n"
                  + $"질문: {question}\n\n"
                  + "(※ 가능하면 다섯 문단 이내로 정리해줘. " +
                  "서강대와 관련이 없으면 답변 끝에 '서강대와는 관련이 없는 질문인 것 같아요. " +
                  "관련 질문을 해주시면 담당부서 연결도 해드릴 수 있습니다.' 라고 출력해줘. " +
                  "전화번호를 제공할 때는 반드시 'tel:전화번호' 형식으로 작성해줘. 예: tel:02-1234-5678. " +
                  "24년 2학기 강의평가에서 총점이 80점 아래면 학생들에게 평가가 매우 안 좋은 거야. 거기 없는 강의는 1학기 과목이야.";




        string url = $"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key={apiKey}";

        var requestObj = new
        {
            contents = new[]
            {
                new {
                    parts = new[] {
                        new { text = prompt }
                    }
                }
            }
        };

        string requestJson = JsonConvert.SerializeObject(requestObj);

        try
        {
            var request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/json";

            byte[] data = Encoding.UTF8.GetBytes(requestJson);
            request.ContentLength = data.Length;

            using (Stream stream = request.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }

            string result;
            using (WebResponse response = request.GetResponse())
            using (StreamReader reader = new StreamReader(response.GetResponseStream()))
            {
                result = reader.ReadToEnd();
            }

            dynamic json = JsonConvert.DeserializeObject(result);
            string answer = json.candidates[0].content.parts[0].text;
            // 2. tel: 링크 감싸기 (UX 개선용)
            string htmlAnswer = Regex.Replace(
                answer,
                @"tel:(\d{2,4}-\d{3,4}-\d{4})",
                "<a href='tel:$1'>$1</a>"
            );


            lblAnswer.Text = htmlAnswer.Replace("\n", "<br>"); //사용자에게 답변 출력 

            //사용자가 답변을 받은 후 Question 테이블에 질문 내용 저장 
            try
            {
                string userId = Session["UserId"] as string;
                string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["GymDb"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        INSERT INTO Question (UserId, qText)
                        VALUES (@UserId, @qText)";
                    cmd.Parameters.AddWithValue("@UserId", (object)userId ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@qText", question);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch
            {

            }

        }
        catch (Exception ex)
        {
            lblAnswer.Text = "에러 발생: " + ex.Message;
        }
    }

    protected void txtQuestion_TextChanged(object sender, EventArgs e)
    {

    }
}
