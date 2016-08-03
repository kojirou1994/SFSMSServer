package com.bingki.sms;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import com.jianzhou.sdk.BusinessService;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

public class MmsTest {
	public static String account = "test";
	public static String password = "test";

	// 标题
	public static String title = "圣诞快乐";
	// 手机号
	public static String mobile = "139111111111";

	public static void main(String[] args) {
		try {

			// 文件目录
			String pathjpg = "D:\\彩信\\1_2.jpg";
			String pathtxt = "你好世界2";
			File filejpg = new File(pathjpg);
			// 读取文件
			InputStream fileInputStreamjpg = new FileInputStream(filejpg);
			byte[] tempbytejpg = new byte[fileInputStreamjpg.available()];
			// 读入字节数组
			fileInputStreamjpg.read(tempbytejpg);

			// 转换成base64字符串
			String jpgbase64String = Base64.encode(tempbytejpg);
			String txtbase64String = Base64.encode(pathtxt.getBytes("gb2312"));

			// 合并各个帧的信息,此处请认真读下说明文档，对应好文件类型和帧数
			// 在此处1_2.jpg表示第一帧为图片类型，2_1.txt表示第二针为文本类型
			String content = "1_1.txt," + txtbase64String + ";" + "1_2.jpg," + jpgbase64String;
			// 开始发送
			// 第一步提交彩信基本信息，如为多帧请对应修改此信息
			BusinessService bService = new BusinessService();
			bService.setWebService("http://www.jianzhou.sh.cn/JianzhouSMSWSServer/services/BusinessService");
			int resultFirst = bService.sendMmsMessages(account, password, mobile, title + "|" + content);
			System.out.println(resultFirst);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
