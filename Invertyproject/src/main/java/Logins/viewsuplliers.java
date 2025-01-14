package Logins;

public class viewsuplliers {
         private int id;
         private String name;
         private String contact;
         private String addres;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getContact() {
			return contact;
		}
		public void setContact(String contact) {
			this.contact = contact;
		}
		public String getAddres() {
			return addres;
		}
		public void setAddres(String addres) {
			this.addres = addres;
		}
		public viewsuplliers(int id, String name, String contact, String addres) {
			super();
			this.id = id;
			this.name = name;
			this.contact = contact;
			this.addres = addres;
		}
         
}
