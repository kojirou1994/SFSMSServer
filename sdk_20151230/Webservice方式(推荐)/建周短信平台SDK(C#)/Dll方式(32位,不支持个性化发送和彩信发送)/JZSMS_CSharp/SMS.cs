using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;

namespace JZSMS_CSharp
{
    public class SMS
    {
        public SMS()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        //从DLL里导出方法到C#
        [DllImport(@"JZSms.dll")]
        private static extern int releaseAll();
        [DllImport(@"JZSms.dll")]
        private static extern int setWebService(string EndPoint);
        [DllImport(@"JZSms.dll")]
        private static extern int validateUser(string UserName, string Password);
        [DllImport(@"JZSms.dll")]
        private static extern int getUserInfo(string UserName, string Password, ref string returnstr);
        [DllImport(@"JZSms.dll")]
        private static extern int modifyPassword(string UserName, string oldPassword, string newPassword);
        [DllImport(@"JZSms.dll")]
        private static extern int sendMessage(string UserName, string Password, string DestMobile, string msgText);
        [DllImport(@"JZSms.dll")]
        private static extern int sendBatchMessage(string UserName, string Password, string DestMobile, string msgText);
        [DllImport(@"JZSms.dll")]
        private static extern int sendTimelyMessage(string UserName, string Password, string SendDateTime, string DestMobile, string msgText);
        [DllImport(@"JZSms.dll")]
        private static extern int getReceipt(string UserName, string Password, string TaskID, ref string returnstr);
        [DllImport(@"JZSms.dll")]
        private static extern int getReceivedMsg(string UserName, string Password, int param, ref string returnstr);
        [DllImport(@"JZSms.dll")]
        private static extern int getTimelySendStatus(string UserName, string Password, string DateTime_From, string DateTime_To,ref string returnstr);

        //setProxy方法是设置代理服务器的方法,直接上网的,请别调用
        [DllImport(@"JZSms.dll")]
        private static extern int setProxy(string IPAddr, int Port, string UserName, string Password);

        //本示例实现了一个发送,一个接收的方法,其它雷同

        public static int sendMessageBySingle(string server, string username, string password, string destmobile, string msgText)
        {
            int returnLng;
            releaseAll();
            setWebService(server);
            returnLng = sendMessage(username, password, destmobile, msgText);
            return returnLng;
        }

        public static string getTimelyStatus(string server, string username, string password, string DateTime_From, string DateTime_To)
        {
            int returnLng;
            string returnStr = "";
            releaseAll();
            setWebService(server);
            returnLng = getTimelySendStatus(username, password, DateTime_From, DateTime_To, ref returnStr);
            return returnStr;
        }

    }
}
