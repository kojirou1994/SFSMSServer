package com.bingki.sms;

import com.jianzhou.sdk.BusinessService;

public class CallJZSms {

	
	public static void main(final String[] args) throws InterruptedException {
		// TODO Auto-generated method stub
		BusinessService bs = new BusinessService();
		bs.setWebService("http://www.jianzhou.sh.cn/JianzhouSMSWSServer/services/BusinessService");

		System.out.println("333:" + bs.sendBatchMessage("test", "test", "13911111111", "李  y7 飞【建周科技】"));

	}

}
