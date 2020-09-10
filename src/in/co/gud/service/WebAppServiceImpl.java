package in.co.gud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.co.gud.dao.WebAppDao;

@Service
public class WebAppServiceImpl implements WebAppService {
	@Autowired
	WebAppDao w;
	@Override
	public void addUser(String name,String userName, String email, String pwd, String conpwd){
		w.addUser(name, userName, email, pwd, conpwd);
		
	}
	@Override
	public int LogIn(String email, String pass) {
		return w.LogIn(email,pass);
		
	}


}
