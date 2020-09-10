package in.co.gud.service;

public interface WebAppService {


	void addUser(String name,String userName, String email, String pwd, String conpwd);

	int LogIn(String name, String email);


}
