using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;


namespace JianzhouWS
{
    public partial class Form1 : Form
    {
        private JianzhouWebservice.BusinessService client;
        public Form1()
        {
            InitializeComponent();
            client = new JianzhouWebservice.BusinessServiceClient();
        }

        private void btn_send_Click(object sender, EventArgs e)
        {           
            //普通短信发送，如多个号码有;分隔，编码为UTF-8
            JianzhouWebservice.sendBatchMessageBody sbmb=new JianzhouWebservice.sendBatchMessageBody();
            sbmb.account=username.Text;
            sbmb.password=password.Text;
            sbmb.destmobile=phone.Text;
            sbmb.msgText=content.Text;
            JianzhouWebservice.sendBatchMessage req=new JianzhouWebservice.sendBatchMessage(sbmb);
            JianzhouWebservice.sendBatchMessageResponse resp=client.sendBatchMessage(req);
            JianzhouWebservice.sendBatchMessageResponseBody body = resp.Body;
            MessageBox.Show(body.sendBatchMessageReturn.ToString());

            //其他发送方法
            //.....
        }
    }
}
