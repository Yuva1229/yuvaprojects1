package Logins;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Stack;

public class Logindb {
    String url = "jdbc:mysql://localhost:3306/inventry";
    String user = "root";
    String pass = "yuvakesh";
    Connection con;

    public Logindb() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean value(String user, String pass) throws SQLException {
        boolean res = false;
        String q = "SELECT * FROM users WHERE username=? AND password=?";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, user);
        pst.setString(2, pass);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            res = true;
        }
        return res;
    }

    public int add(String name, String pass, String role) throws SQLException {
        String q = "INSERT INTO users(username,password,role) VALUES(?,?,?)";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, name);
        pst.setString(2, pass);
        pst.setString(3, role);
        return pst.executeUpdate();
    }
    public int addp(String name, String cat, int qu,int pri,int sid) throws SQLException {
        String q = "INSERT INTO products(name,category,quantity,price,supplier_id) VALUES(?,?,?,?,?)";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, name);
        pst.setString(2, cat);
        pst.setInt(3, qu);
        pst.setInt(4, pri);
        pst.setInt(5, sid);
        return pst.executeUpdate();
    }
    public Stack<Storedat> view() throws SQLException
    {
    	Stack<Storedat> s=new Stack<Storedat>();
    	String q="select * from products";
    	PreparedStatement pst = con.prepareStatement(q);
    	ResultSet rs=pst.executeQuery();
    	while(rs.next())
    	{
    	   int id=rs.getInt(1);
    	   String name=rs.getString(2);
    	   String cat=rs.getString(3);
    	   int qu=rs.getInt(4);
    	   double pr=rs.getDouble(5);
    	   int sid=rs.getInt(6);
    	   Storedat d=new Storedat(id,name,cat,qu,pr,sid);
    	   s.push(d);
    	}
    	return s;
		
    }
    public int delete(int id) throws SQLException
    {
    	String q="delete from products where id=?";
    	PreparedStatement pst=con.prepareStatement(q);
    	pst.setInt(1, id);
    	int y=pst.executeUpdate();
    	return y;
    }
    public Stack<Storedat> select(int ids) throws SQLException
    {
    	Stack<Storedat> s=new Stack<Storedat>();
    	String q="select * from products where id=?";
    	PreparedStatement pst = con.prepareStatement(q);
    	pst.setInt(1, ids);
    	ResultSet rs=pst.executeQuery();
    	while(rs.next())
    	{
    	   int id=rs.getInt(1);
    	   String name=rs.getString(2);
    	   String cat=rs.getString(3);
    	   int qu=rs.getInt(4);
    	   double pr=rs.getDouble(5);
    	   int sid=rs.getInt(6);
    	   Storedat d=new Storedat(id,name,cat,qu,pr,sid);
    	   s.push(d);
    	}
    	return s; 
    } 
    public int update(String name, String cat, int qu,double pri,int sid,int id) throws SQLException
    {
    	String q="update products  set name=?,category=?,quantity=?,price=?,supplier_id=? where id=?";
    	PreparedStatement pst = con.prepareStatement(q);
    	pst.setString(1, name);
    	pst.setString(2, cat);
    	pst.setInt(3, qu);
    	pst.setDouble(4, pri);
    	pst.setInt(5, sid);
    	pst.setInt(6, id);
    	int s=pst.executeUpdate();
    	return s;
    }
    public Stack<Orders> orederstable() throws SQLException
    {
    	Stack<Orders> so=new Stack<Orders>();
    	String q="select * from orders";
    	PreparedStatement pst = con.prepareStatement(q);
    	ResultSet rs=pst.executeQuery();
    	while(rs.next())
    	{
    		int id=rs.getInt(1);
    		int pid=rs.getInt(2);
    		int qu=rs.getInt(3);
    		String da=rs.getString(4);
    		Orders o=new Orders(id,pid,qu,da);
    		so.push(o);
    	}
    	return so;
    }
    
    public int addsup(String name, String ph, String add) throws SQLException {
        String q = "INSERT INTO suppliers(name,contact,address) VALUES(?,?,?)";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setString(1, name);
        pst.setString(2, ph);
        pst.setString(3, add);
        return pst.executeUpdate();
    }
    public Stack<viewsuplliers> viewsupp() throws SQLException
    {
    	Stack<viewsuplliers> so=new Stack<viewsuplliers>();
    	String q="select * from suppliers";
    	PreparedStatement pst = con.prepareStatement(q);
    	ResultSet rs=pst.executeQuery();
    	while(rs.next())
    	{
    		int id=rs.getInt(1);
    		String name=rs.getString(2);
    		String ph=rs.getString(3);
    		String ad=rs.getString(4);
    		viewsuplliers o=new viewsuplliers(id,name,ph,ad);
    		so.push(o);
    	}
    	return so;
    }
    public int addship(int id,int quantity) throws SQLException {
        String q = "INSERT INTO shipments(product_id,quantity) VALUES(?,?)";
        PreparedStatement pst = con.prepareStatement(q);
        pst.setInt(1, id);
        pst.setInt(2, quantity);
        
        return pst.executeUpdate();
    }
    public Stack<Shipmentdata> viewship() throws SQLException
    {
    	Stack<Shipmentdata> yo=new Stack<Shipmentdata>();
    	String q="select * from shipments";
    	PreparedStatement pst = con.prepareStatement(q);
    	ResultSet rs=pst.executeQuery();
    	while(rs.next())
    	{
    		int id=rs.getInt(1);
    		int pid=rs.getInt(2);
    		int qu=rs.getInt(3);
    		String date=rs.getString(4);
    	     Shipmentdata o=new Shipmentdata(id,pid,qu,date);
    		yo.push(o);
    	}
    	return yo;
    }
    
}
