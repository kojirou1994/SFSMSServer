using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace JZSMS_CSharp
{
    public partial class Form1 : Form
    {
        string strServer,strUserName,strPassword,strdestMobile,strContext,StrDate_From,StrDate_To;

        public Form1()
        {
            InitializeComponent();
            //服务器地址
            strServer = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/services/BusinessService";
            //用户名
            strUserName = "";
            //密码
            strPassword = "";
            //目标号码
            strdestMobile = "";
            //短信内容
            strContext = "";

            //检索一定时间内的定时发送时间格式为 yyyyymmddhhss
            StrDate_From = "200709010000";
            StrDate_To = "200712010000";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //返回负数为错误,返回正数是短信的序列ID
            MessageBox.Show(SMS.sendMessageBySingle(strServer, strUserName, strPassword, strdestMobile, strContext).ToString());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //返回定时发送状态的XML文档
            MessageBox.Show(SMS.getTimelyStatus(strServer, strUserName, strPassword, StrDate_From, StrDate_To));
        }
    }
}