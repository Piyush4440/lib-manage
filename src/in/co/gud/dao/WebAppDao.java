package in.co.gud.dao;

public interface WebAppDao {

	void addUser(String name,String userName, String email, String pwd, String conpwd);

	int LogIn(String email, String pass);

}
