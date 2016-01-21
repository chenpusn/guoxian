using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using System.IO;

namespace SendSmsDemo_web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox4.Text = DateTime.Now.ToString("yyyyMMddHHmmss");//大写HH表示24小时制时间
        }

        protected void Button2_Click(object sender, EventArgs e)
        {//查询余额
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string timestamp = string.Empty;
            timestamp = Convert.ToInt64(ts.TotalSeconds).ToString();
            string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile("账号密码" + timestamp, "MD5").ToLower();
            string param = "userid=企业id&timestamp=" + timestamp + "&sign=" + sign + "&action=overage";
            byte[] bs = Encoding.UTF8.GetBytes(param);

            HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create("http://xtx.telhk.cn:8080/v2sms.aspx");
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = bs.Length;
            using (Stream reqStream = req.GetRequestStream())
            {
                reqStream.Write(bs, 0, bs.Length);
            }
            using (WebResponse wr = req.GetResponse())
            {
                StreamReader sr = new StreamReader(wr.GetResponseStream(), System.Text.Encoding.Default);
                string xml = sr.ReadToEnd().Trim();
                byte[] buffer = Encoding.GetEncoding("GBK").GetBytes(xml);
                TextBox3.Text = Encoding.UTF8.GetString(buffer);

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {//发送短信
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string timestamp = string.Empty;
            timestamp = Convert.ToInt64(ts.TotalSeconds).ToString();
            string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile("账号密码" + timestamp, "MD5").ToLower();
            string param = "action=send&userid=企业id&timestamp=" + timestamp + "&sign=" + sign + "&content=" + TextBox2.Text + "&mobile=" + TextBox1.Text;
            if (CheckBox1.Checked)//是否定时发送
            {
                param = param +"&send=" +TextBox4.Text; //格式 yyyymmddhhnnss
            }
            else
            {
              
            }
            byte[] bs = Encoding.UTF8.GetBytes(param);

            HttpWebRequest req = (HttpWebRequest)HttpWebRequest.Create("http://xtx.telhk.cn:8080/v2sms.aspx");
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = bs.Length;

            using (Stream reqStream = req.GetRequestStream())
            {
                reqStream.Write(bs, 0, bs.Length);
            }
            using (WebResponse wr = req.GetResponse())
            {
                StreamReader sr = new StreamReader(wr.GetResponseStream(), System.Text.Encoding.Default);
                string xml = sr.ReadToEnd().Trim();
                byte[] buffer = Encoding.GetEncoding("GBK").GetBytes(xml);
                TextBox3.Text = Encoding.UTF8.GetString(buffer); 
             
            }
        }
    }
}