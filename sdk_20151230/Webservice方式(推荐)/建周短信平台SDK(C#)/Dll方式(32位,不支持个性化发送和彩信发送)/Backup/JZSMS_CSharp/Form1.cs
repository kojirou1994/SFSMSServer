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
            //��������ַ
            strServer = "http://www.jianzhou.sh.cn/JianzhouSMSWSServer/services/BusinessService";
            //�û���
            strUserName = "";
            //����
            strPassword = "";
            //Ŀ�����
            strdestMobile = "";
            //��������
            strContext = "";

            //����һ��ʱ���ڵĶ�ʱ����ʱ���ʽΪ yyyyymmddhhss
            StrDate_From = "200709010000";
            StrDate_To = "200712010000";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //���ظ���Ϊ����,���������Ƕ��ŵ�����ID
            MessageBox.Show(SMS.sendMessageBySingle(strServer, strUserName, strPassword, strdestMobile, strContext).ToString());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //���ض�ʱ����״̬��XML�ĵ�
            MessageBox.Show(SMS.getTimelyStatus(strServer, strUserName, strPassword, StrDate_From, StrDate_To));
        }
    }
}