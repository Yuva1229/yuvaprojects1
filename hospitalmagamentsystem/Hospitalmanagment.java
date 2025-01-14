package jdbc;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class Hospitalmanagment {

	public static void main(String[] args) throws SQLException {
		Hospitallog h=new Hospitallog();
		Scanner s=new Scanner(System.in);
		System.out.println("enter a username");
		String user=s.nextLine();
		System.out.println("enter a password");
		String pass=s.nextLine();
		boolean r=h.login(user, pass);
		while(true)
		{
			if(r==true)
			{
				System.out.println("**************************welcome user*****************************");
				System.out.println("-------------------------");
				System.out.println("1-Add Patients Details");
				System.out.println("2-View Patient Details ");
				System.out.println("3-Add Doctors Details");
				System.out.println("4-View Doctors Details");
				System.out.println("5-Book Appotiments");
				System.out.println("6-Canacel Appoiments");
				System.out.println("7-shuducle doctors");
				System.out.println("8-Create Bill");
				System.out.println("9-paytment update");
				System.out.println("10-View Bill");
				System.out.println("11-add patient reports");
				System.out.println("12-View reports");
				System.out.println("13-Exit");
				System.out.println("ENTER A CHOICE:  ");
				System.out.println("--------------------------");
				int opt=s.nextInt();
				
				if(opt==1)
				{
					System.out.println("Enter a Patient name");
					s.nextLine();
					String name=s.nextLine();
					System.out.println("Enter a Patient gender(Male/female/other)");
					String gen=s.nextLine();
					System.out.println("Enter a Patient contact");
					String contact=s.nextLine();
					System.out.println("Enter a Patient age");
					int age=s.nextInt();
					h.addpatient(name, gen, contact, age);
				}
				else if(opt==2)
				{
					h.viewpatient();
				}
				else if(opt==3)
				{
					System.out.println("Enter a doctor name");
					s.nextLine();
					String name=s.nextLine();
					System.out.println("Enter a specialty in doctor");
					String gen=s.nextLine();
					System.out.println("Enter a doctor contact");
					String contact=s.nextLine();
					h.adddoctor(name, gen, contact);
				}
				else if(opt==4)
				{
					h.viewdoctor();
				}
				else if(opt==5)
				{
					System.out.print("Enter patient ID: ");
                    int patientId = s.nextInt();
                    System.out.print("Enter doctor ID: ");
                    int doctorId = s.nextInt();
                    System.out.print("Enter appointment date (YYYY-MM-DD): ");
                    String appointmentDate = s.next();
                    h.bookAppointment(patientId, doctorId, appointmentDate);
                    
				}
				else if(opt==6) 
				{
					h.deleteappoiments();
				}
				else if(opt==7)
				{
					h.viewappiments();
				}
				else if(opt==8)
				{
					System.out.print("enter a patient id");
					int patientid=s.nextInt();
					System.out.print("enter a appiotment id");
					int appiotmentid=s.nextInt();
					System.out.print("enter a patient amount");
					float totalamount=s.nextFloat();
					h.createbille(patientid, appiotmentid, totalamount);
					
				}
				else if(opt==9)
				{
					
					h.updatebill();
					
				}
				else if(opt==10)
				{
					h.viewbill();
				}
				else if (opt == 11) {
	                System.out.println("Enter a patient ID:");
	                int pid = s.nextInt();

	                System.out.println("Enter a doctor ID:");
	                int doid = s.nextInt();

	                
	                s.nextLine(); 

	                
	                 if(h.hasAppointment(pid, doid));
	                		 {
	                        System.out.println("Enter a visit date (YYYY-MM-DD):");
	                        String visitDate = s.nextLine();

	                        System.out.println("Enter a diagnosis:");
	                        String diagnosis = s.nextLine();

	                        System.out.println("Enter a treatment:");
	                        String treatment = s.nextLine();

	                        h.addMedicalReports(pid, doid, visitDate, diagnosis, treatment);
	                    }
				}
	                 
	                
	            
			
				else if(opt==12)
				{
					System.out.println("enter a patient_id to view the repots ");
					int pid=s.nextInt();
					h.viewrecords(pid);
				}
				
				else if(opt==13)
				{
					System.out.println("********************************THANK YOU************************************");
					break;
				}
				else
				{
					System.out.println("invalid choice........");
				}
				}
		}
		
    
}
}



