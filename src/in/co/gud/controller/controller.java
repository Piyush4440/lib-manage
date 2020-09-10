package in.co.gud.controller;


import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import in.co.gud.service.WebAppService;



@Controller
public class controller {
	@Autowired
	WebAppService w;
	@RequestMapping(value="/")
	public String home()
	{
		System.out.println("hello");
		return "index";
	}
@RequestMapping(value="ForgotPass")
	public String ForgotPass(HttpServletRequest req)
	{
		System.out.println("ForgotPass"); 
		String email=req.getParameter("email");
		isValidEmailAddress( email);
		
		return "ForgotPass";
	}	
public static boolean isValidEmailAddress(String email) {
	   boolean result = true;
	   try {
	      InternetAddress emailAddr = new InternetAddress(email);
	      emailAddr.validate();
	   } catch (AddressException ex) {
	      result = false;
	   }
	   return result;
	}
@RequestMapping(value="signup")
public String signup()
{
	System.out.println("signup");
	return "Sign Up";
}
@RequestMapping(value="adduser")
public String addUser(HttpServletRequest req)
{
	String Name=req.getParameter("name");
	String username=req.getParameter("userName");
	String email=req.getParameter("email");
	String pass=req.getParameter("pwd");
	String cpass=req.getParameter("conpwd");
	System.out.println(cpass);
	w.addUser(Name,username,email,pass,cpass);
	return "index";
}
@RequestMapping(value="ChangePass")
public String ChangePass(HttpServletRequest req )
{	
	String email=req.getParameter("email");
	String pass=req.getParameter("pass");
	String npass=req.getParameter("npass");
	String conpass=req.getParameter("cpass");
	System.out.println(email);
	return "ChangePass";
}
@RequestMapping(value="LogIn")
public String LogIn(HttpServletRequest req)
{
	
	String email=req.getParameter("email");
	String pass=req.getParameter("pass");
	System.out.println(email);
	int x=w.LogIn(email,pass);
	if(x==0){
		req.setAttribute("msg","email id not ragister");
		return "index";
	}
	else if (x==2){
		req.setAttribute("msg", "password not match");
		return "index";
	}		
	else{
		return "first";
	}		
}


}
	