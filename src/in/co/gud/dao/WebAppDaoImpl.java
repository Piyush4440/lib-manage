package in.co.gud.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class WebAppDaoImpl implements WebAppDao {
	

	@Autowired
	JdbcTemplate jdbctemplate;
	

	@Override
	public void addUser(String name,String userName, String email, String pwd, String conpwd)  {
		final String procedureCall="{call Proc_App(?,?,?,?,?)}";
		System.out.println(email);
		Connection con=null;
		try
		{
			con=jdbctemplate.getDataSource().getConnection();
			CallableStatement cs=con.prepareCall(procedureCall);
			cs.setString(1, "insert");
			cs.setString(2, name);
			cs.setString(3, userName);
			cs.setString(4, email);
			cs.setString(5, pwd);
			cs.setString(6, conpwd);
			cs.execute();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		

	}

	int flag=0;
	public int LogIn(String email, String pass) {
		final String procedureCall="{call Proc_App(?,?)}";
		System.out.println(email);
		System.out.println(pass);
		Connection con=null;
		try
		{
			con=jdbctemplate.getDataSource().getConnection();
			CallableStatement cs=con.prepareCall(procedureCall);
			cs.setString(1, "LogIn");
			cs.setString(2, email);
			ResultSet rs=cs.executeQuery();
			if(rs.next()){
				if(rs.getString("password").equals(pass))
				{	flag=1;
			System.out.println("valid user");
				}
			else{
				flag=2;
				System.out.println("password not correct");
				}}
			else{
				flag=0;
				System.out.println("emailid not ragister");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return flag;
		
		
	}

}
