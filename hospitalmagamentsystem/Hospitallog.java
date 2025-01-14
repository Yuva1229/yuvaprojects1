package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Hospitallog {
	String url="jdbc:mysql://localhost:3306/project1";
	String user="root";
	String pass="yuvakesh";
	
	static Connection con;
	Scanner s=new Scanner(System.in);
	Hospitallog() throws SQLException
	{
		con=DriverManager.getConnection(url,user,pass);
	}
	
	public boolean login(String user,String pass) throws SQLException
	{
		boolean res =false;
		String q="select * from user where name=? and password=?";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setString(1, user);
		pst.setString(2, pass);
		ResultSet re=pst.executeQuery();
		while(re.next())
		{
			res=true;
		}
		return res;
	}
	public void addpatient(String patientname,String gender,String contact,int age) throws SQLException
	{
		
			String q="insert into patient(patientname,gender,contact,age)values(?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,patientname);
			pst.setString(2,gender);
			pst.setString(3,contact);
			pst.setInt(4,age);
			int r=pst.executeUpdate();
			if(r>=1)
			{
				System.out.println("added");
				}
			else
			{
				System.out.println("not added");
			}
	
	}
 public void viewpatient() throws SQLException
 {
		String q="select * from patient";
		PreparedStatement pst=con.prepareStatement(q);
		ResultSet rs= pst.executeQuery();
		System.out.println("--------------------------------------------");
		System.out.println("ID | patientName  | gender  | conatct  | age");
		System.out.println("--------------------------------------------");
        while (rs.next()) {
        	{
        	
  			  int id=rs.getInt(1);
  			  String name=rs.getString(2);
  			  String gender=rs.getString(3);
  			  String contact=rs.getString(4);
  			  int age=rs.getInt(5);
  			  System.out.println(id+"\t"+name+"\t"+gender+"\t"+contact+"\t"+age);
  		  }
            System.out.println("----------------------------------------");
}
 }
 
 public void adddoctor(String doctorname,String specialty ,String contact) throws SQLException
	{
		
			String q="insert into doctor(name,specialty,contact)values(?,?,?)";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1,doctorname);
			pst.setString(2,specialty);
			pst.setString(3,contact);
			int r=pst.executeUpdate();
			if(r>=1)
			{
				System.out.println("added");
				}
			else
			{
				System.out.println("not added");
			}
	
	}
public void viewdoctor() throws SQLException
{
		String q="select * from doctor";
		PreparedStatement pst=con.prepareStatement(q);
		ResultSet rs= pst.executeQuery();
		System.out.println("----------------------------------------");
		System.out.println("ID | doctorName  | specialty  | conatct");
		System.out.println("----------------------------------------");
     while (rs.next()) {
     	{
     	
			  int id=rs.getInt(1);
			  String name=rs.getString(2);
			  String specialty=rs.getString(3);
			  String contact=rs.getString(4);
			  
			  System.out.println(id+"\t"+name+"\t"+specialty+"\t"+contact);
		  }
         System.out.println("--------------------------------------------");
}
}


       public void bookAppointment(int patientId, int doctorId, String appointmentDate) throws SQLException {
        String q = "INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES (?, ?, ?)";
             PreparedStatement pst = con.prepareStatement(q); 
            pst.setInt(1, patientId);
            pst.setInt(2, doctorId);
            pst.setString(3, appointmentDate);
            int r=pst.executeUpdate();
            {
            	if(r>=1)
            	{
            		System.out.println("booked appioment");
            	}
            	else
            	{
            		System.out.println("sorry either patient or doctor are missing");
            	}
            }
            	
        }
    

    public void viewappiments() throws SQLException
    {
    	String q="select * from appointments";
    	PreparedStatement pst=con.prepareStatement(q);
    	ResultSet rs=pst.executeQuery();
    	System.out.println("------------------------------------------------");
    	System.out.println("ID | PATIENT_ID  | DOCTOR_ID  | APPOIMENTS_DATE |");
    	System.out.println("------------------------------------------------");
    	while(rs.next())
    	{
    		int id=rs.getInt(1);
    		int pid=rs.getInt(2);
    		int did=rs.getInt(3);
    		String date=rs.getString(4);
    		System.out.println(id+"\t"+pid+"\t"+did+"\t"+date);
    	}
    	System.out.println("----------------------------------------------");
    	
    }
    
    public void createbille(int patientid,int appiotmentid,float totalamount) throws SQLException
    {
    	String q="insert into billamount(patient_id,appointment_id,total_amount)values(?,?,?)";
    	PreparedStatement pst=con.prepareStatement(q);
    	pst.setInt(1, patientid);
    	pst.setInt(2, appiotmentid);
    	pst.setFloat(3, totalamount);
    	int r=pst.executeUpdate();
    	if(r>=1)
    	{
    		System.out.println("bill is created");
    	}
    	else
    	{
    		System.out.println("some issuess......");
    	}
    }
    	
 
    public void updatebill() throws SQLException{
    String q="update billamount set payment_status=? where billno=? and patient_id=? ";
	   PreparedStatement pst=con.prepareStatement(q);
	   
	   System.out.println("enter a stuts");
	   String sas=s.nextLine();
	  System.out.println("enter a billno");
	   int app=s.nextInt();
	   System.out.println("enter a patientid");
	   int pid=s.nextInt();
	   pst.setString(1,sas);
	   pst.setInt(2,app);
	   pst.setInt(3, pid);
	   int r=pst.executeUpdate();
	   if(r>=1)
	   {
		   System.out.println("paytment sucessfully updated");
	   }
	   else
	   {
		   System.out.println("not updateded");
	   }
	   
	   
 }


    public void viewbill() throws SQLException
    {
 	   String q="select * from billamount";
 	   PreparedStatement pst=con.prepareStatement(q);
 	   ResultSet rs=pst.executeQuery();
 	  System.out.println("---------------------------------------------------------------");
 	   System.out.println("BILLNO | PATIENT_ID | APPOTIMENT_ID | AMOUNT | PAYMENT_STATUS");
 	  System.out.println("---------------------------------------------------------------");
 	   while(rs.next())
 	   {
 		   int id=rs.getInt(1);
 		   int pid=rs.getInt(2);
 		   int aid=rs.getInt(3);
 		   float amo=rs.getFloat(4);
 		   String paymentst=rs.getString(5);
 		   System.out.println(id+"\t"+pid+"\t"+aid+"\t"+amo+"\t"+paymentst);
 		   
 	}
 	   System.out.println("-----------------------------------------------------------------");
  
    }

   public void deleteappoiments() throws SQLException
   {
	   String q="delete from appointments where patient_id=?";
	   PreparedStatement pst=con.prepareStatement(q);
	   System.out.println("enter a patient id to cancel a appoiment");
	   int pid=s.nextInt();
	   pst.setInt(1, pid);
	   int r=pst.executeUpdate();
	   if(r>=1)
	   {
		   System.out.println("removed sucesfully");
	   }
	   else
	   {
		   System.out.println("please try again somthing wrong in patient id");
		   }
	   
	   
   }
   public boolean hasAppointment(int pid, int did) throws SQLException {
	   boolean res=false;
       String query = "SELECT COUNT(*) FROM appointments WHERE patient_id = ? AND doctor_id = ?";
       PreparedStatement pst = con.prepareStatement(query);
           pst.setInt(1, pid);
           pst.setInt(2, did);
           
           ResultSet rs = pst.executeQuery();
           if (rs.next()) {
               res=true;
           }
       
       return true; 
   }

   
   public void addMedicalReports(int pid, int did, String visitDate, String diagnosis, String treatment) throws SQLException {
       String query = "INSERT INTO medicalrecords(patient_id, doctor_id, visit_date, diagnosis, treatment) VALUES (?, ?, ?, ?, ?)";
       PreparedStatement pst = con.prepareStatement(query);
           pst.setInt(1, pid);
           pst.setInt(2, did);
           pst.setString(3, visitDate);
           pst.setString(4, diagnosis);
           pst.setString(5, treatment);
           
           int rowsAffected = pst.executeUpdate();
           if (rowsAffected >= 1) {
               System.out.println("Insert successful");
           } 
           else {
               System.out.println("No records inserted");
           }
       }
   
  public void viewrecords(int pid) throws SQLException
   {
	   String q="select * from  medicalrecords where patient_id=?";
	   PreparedStatement pst=con.prepareStatement(q);
	   pst.setInt(1, pid);
	   ResultSet rs=pst.executeQuery();
	   System.out.println("-----------------------------------------------------------------------");
	   System.out.println("Report_iD | Patient_id | Doctor_id | visit_date | Diagnosis | Treatment");
	   System.out.println("-----------------------------------------------------------------------");
	   while(rs.next())
	   {
		   int id=rs.getInt(1);
		   int paid=rs.getInt(2);
		   int doid=rs.getInt(3);
		   String vist=rs.getString(4);
		   String dis=rs.getString(5);
		   String trea=rs.getString(6);
		   System.out.println(id+"\t"+paid+"\t"+doid+"\t"+vist+"\t"+dis+"\t"+trea);
		   }
	   System.out.println("-------------------------------------------------------------------------------------");
	   
   }
 
   
   
}
    
    
    

	


 


