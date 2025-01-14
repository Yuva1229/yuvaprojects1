import pymysql
con = None
def dbconnection():
    global con
    try:
        con = pymysql.connect(
            host="localhost",
            user="root",
            password="yuvakesh",
            port=3306,
            db="food_delivery"
        )
        print("Connected to the database")
    except Exception as e:
        print(f"Error connecting to database: {e}")
def adminlogin():
    try:
        use=input("enter a user adminname")
        pas=input("enter a password")
        
        q="select * from admin where user_name=%s and password=%s"
        cr=con.cursor()
        cr.execute(q,(use,pas))
        result=cr.fetchone()
        if result:
            print("login sucesfully")
            print("welcome admin")
            return True
        else:
            print("incorect username or password ")
            return False
    except Exception as e:
        print(e)
def addres():
    try:
        Resutant=input("enter a Resutant Name")
        location=input("enter a location")
        contact=input("enter a contact")
        q="insert into restaurants(Restaurants_name,location,contact)values(%s,%s,%s)"
        cr=con.cursor()
        cr.execute(q,(Resutant,location,contact))
        con.commit()
        print("saved")
    except Exception as e:
        print(e)
def menu():
    try:
        resid=int(input("enter a restaurant_id"))
        item=input("enter a menu items")
        price=float(input("enter a price"))
        q="insert into menu_items (Restaurants_id,item_name,price)values(%s,%s,%s)"
        cr=con.cursor()
        cr.execute(q,(resid,item,price))
        con.commit()
        print("saved")
    except Exception as e:
        print(e)
def view():
    try:
        q="select * from restaurants"
        cr=con.cursor()
        cr.execute(q)
        if(cr.rowcount>=1):
            for i in cr:
                print(i)
        else:
               print("no data")
    except Exception as e:
          print(e)

def view1():
    try:
        q="select * from menu_items"
        cr=con.cursor()
        cr.execute(q)
        if(cr.rowcount>=1):
            for i in cr:
                print(i)
        else:
            print("no data")
            
    except Exception as e:
        print(e)
def vieworders():
    try:
        q="select * from orders"
        cr=con.cursor()
        cr.execute(q)
        if(cr.rowcount>=1):
            for i in cr :
                print(i)
        else:
            print("no data")
            
    except Exception as e:
        print(e)

def delteres(id):
    try:

        q="delete from restaurants where Restaurants_id=%s "
        cr=con.cursor()
        cr.execute(q,id)
        con.commit()
        if cr.rowcount==0:
            print("not delted check the number")
        else:
            print("delted")
    except Exception as e:
        print(e)
def mendel(de):
    try:
        q="delete from menu_items where item_id=%s"
        cr=con.cursor()
        cr.execute(q,de)
        con.commit()
        if(cr.rowcount==0):
            print("pls check the id ")
        else:
            print("delted")
            
    except Exception as e:
        print(e)