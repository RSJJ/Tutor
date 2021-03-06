package com.tutor.util;
import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.dom4j.Document;   
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;   
import org.dom4j.Element;   

import com.tutor.action.TeacherBasicAction;
import com.tutor.global.FinalValue;
import com.tutor.util.StringUtil;

public class sendsms {
	private static final Log logger = LogFactory.getLog(sendsms.class);
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

	public static boolean send(String phone,int mobile_code,int type,String...strings){
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		String content = null;

		//System.out.println(mobile);
		switch(type){
		case FinalValue.SEND_REIGISTERMSG:
			content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。学纷享欢迎您"); break;
		case FinalValue.SEND_ORDERMSG:
			content = new String("恭喜您，您的预约订单已提交（订单号："+strings[0]+"），点击"+strings[1]+"查看详情。");break;
			//0为订单号，1为订单链接
		case FinalValue.SEND_CLASSMSG:
			content = new String("温馨提示，您预约"+strings[0]+"的"+strings[1]+"在"+strings[2]+"将要开始了，请及时上课，点击"+strings[3]+"查看详情。");break;
			//0为老师名，1为课程名，2为上课时间，3为课程链接
		}
		 

		NameValuePair[] data = {//�ύ����
			    new NameValuePair("account", "cf_mcfell"), 
			    new NameValuePair("password", StringUtil.MD5Encode("58591003")),  //密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", phone), 
			    new NameValuePair("content", content),
		};
		
		method.setRequestBody(data);		
		
		
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			System.out.println("code:"+code+"||msg:"+msg+"||smsid:"+smsid);
			 if("2".equals(code)){
				 System.out.println("短信提交成功");
				 return true;
			}
			
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;	
	}
	
}