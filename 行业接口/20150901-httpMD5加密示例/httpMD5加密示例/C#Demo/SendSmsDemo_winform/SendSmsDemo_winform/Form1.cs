using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace SendSmsDemo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            dateTimePicker1.Value = DateTime.Now;
            dateTimePicker2.Value = DateTime.Now;
        }

        string HttpPost(string uri, string parameters)
        {
            // parameters: name1=value1&name2=value2	
            WebRequest webRequest = WebRequest.Create(uri);
            //string ProxyString = 
            //   System.Configuration.ConfigurationManager.AppSettings
            //   [GetConfigKey("proxy")];
            //webRequest.Proxy = new WebProxy (ProxyString, true);
            //Commenting out above required change to App.Config
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.Method = "POST";
            byte[] bytes = Encoding.UTF8.GetBytes(parameters);//这里需要指定提交的编码
            Stream os = null;
            try
            { // send the Post
                webRequest.ContentLength = bytes.Length;   //Count bytes to send
                os = webRequest.GetRequestStream();
                os.Write(bytes, 0, bytes.Length);         //Send it
            }
            catch (WebException ex)
            {
                MessageBox.Show(ex.Message, "HttpPost: Request error",
                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (os != null)
                {
                    os.Close();
                }
            }
            
            try
            { // get the response
                WebResponse webResponse = webRequest.GetResponse();
                if (webResponse == null)
                { return null; }
                StreamReader sr = new StreamReader(webResponse.GetResponseStream(), System.Text.Encoding.Default);
                //上面一句需要将返回的编码进行指定，指定成默认的即可
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                MessageBox.Show(ex.Message, "HttpPost: Response error",
                   MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            return null;
        }

        private void button2_Click(object sender, EventArgs e)
        {//查询余额
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            string ret = string.Empty;
            ret = Convert.ToInt64(ts.TotalSeconds).ToString();
            byte[] result = Encoding.Default.GetBytes("账号密码" + ret);
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            string sign = BitConverter.ToString(output).Replace("-", "").ToLower();
            textBox3.Text = HttpPost("http://xtx.telhk.cn:8080/v2sms.aspx", "userid=企业id&timestamp=" + ret + "&sign=" + sign + "&action=overage");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {//定时发送
                TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
                string ret = string.Empty;
                ret = Convert.ToInt64(ts.TotalSeconds).ToString();
                byte[] result = Encoding.Default.GetBytes("账号密码" + ret);   
                MD5 md5 = new MD5CryptoServiceProvider();
                byte[] output = md5.ComputeHash(result);
                string sign = BitConverter.ToString(output).Replace("-", "").ToLower();
                textBox3.Text = HttpPost("http://xtx.telhk.cn:8080/v2sms.aspx", "action=send&userid=企业id&timestamp=" + ret + "&sign=" + sign + "&content="
                    + textBox2.Text + "&mobile=" + textBox1.Text+"&sendtime="
                       + dateTimePicker1.Value.ToString("yyyy-MM-dd") +" "+ dateTimePicker2.Value.ToString("HH:mm:ss"));
            }
            else
            {//即时发送
                TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);  
                  string ret = string.Empty;   
                 ret = Convert.ToInt64(ts.TotalSeconds).ToString();
                 byte[] result = Encoding.Default.GetBytes("账号密码" + ret);   
                MD5 md5 = new MD5CryptoServiceProvider();
                byte[] output = md5.ComputeHash(result);
                string sign = BitConverter.ToString(output).Replace("-", "").ToLower();

                textBox3.Text = HttpPost("http://xtx.telhk.cn:8080/v2sms.aspx", "action=send&userid=企业id&timestamp=" + ret + "&sign=" + sign + "&content="
                    + textBox2.Text + "&mobile=" + textBox1.Text);
            }
        }


    }
}
