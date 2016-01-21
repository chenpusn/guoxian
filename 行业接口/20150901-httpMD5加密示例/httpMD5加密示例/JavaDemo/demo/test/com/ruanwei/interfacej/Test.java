package com.ruanwei.interfacej;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;




public class Test {
	
	static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	static String str = sdf.format(new Date());
	public static String url = "http://xtx.telhk.cn:8080/v2smsGBK.aspx";
	public static String userid = "企业id";
	public static String timestamp=str;	
	public static String sign=encryption("账号密码"+str);
	public static String content = "内容";
	public static String mobile = "手机号";

	public static void main(String[] args) {

		
		sendSms();
	}
	public static void keyword() {

		String keyword = SmsClientKeyword.queryKeyWord(url,userid,timestamp,
				 sign, content);
		try {
			System.out.println(new String(keyword.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void sendSms() {

		String send = SmsClientSend.sendSms(url,"send",userid,timestamp,
				sign,mobile,content);
		try {
			System.out.println(new String(send.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void overage() {

		String overage = SmsClientOverage.queryOverage(url,userid,timestamp,
				sign);
		try {
			System.out.println(new String(overage.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void queryStatusReport() {
		String queryStatus = SmsClientQueryStatusReport.queryStatusReport(userid, timestamp,
				sign);
		try {
			System.out.println(new String(queryStatus.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void queryCallReport() {

		String queryCall = SmsClientQueryCall.queryCallReport(url,userid, timestamp,
				sign);
		try {
			System.out.println(new String(queryCall.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static String encryption(String plain) {
		String re_md5 = new String(); 
		try { MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(plain.getBytes()); byte b[] = md.digest(); 
			int i; StringBuffer buf = new StringBuffer(""); 
			for (int offset = 0; offset < b.length; offset++)
			{ 
			i = b[offset];
			if (i < 0) i += 256; 
			if (i < 16) buf.append("0"); 
			buf.append(Integer.toHexString(i)); 
			}
			re_md5 = buf.toString();
		} catch(NoSuchAlgorithmException e)
		{ 
			e.printStackTrace();
		} 
		return re_md5; 
	} 
}
