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
def login():
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


def viewresturant():
    try:
        q="select * from restaurants"
        cr=con.cursor()
        cr.execute(q)
        print("-------------------------------------------------------")
        print("Restaurants_id | Restaurants_name | location | contact")
        print("-------------------------------------------------------")
        if cr.rowcount>=1:
            for i in cr:
                print(i)
        else:
            print("no data")
        id=int(input("----enter  a Restaurants_id to view menus----"))
        q1="select * from menu_items where Restaurants_id=%s"
        cr=con.cursor()
        cr.execute(q1,id)
        print("-----------------------------------------------")
        print("item_id | Restaurants_id | item_name | price ")
        print("-----------------------------------------------")
        if cr.rowcount>=1:
            for i in cr:
                print(i)
        else:
            print("no data ")
    except Exception as e:
        print(e)


def place_order(user_id, restaurant_id, items_ordered):
    try:
        order_query = """
        INSERT INTO orders (user_id, restaurant_id, order_status, order_date, total_price)
        VALUES (%s, %s, 'pending', CURDATE(), 0)
        """
        cr = con.cursor()
        cr.execute(order_query, (user_id, restaurant_id))
        order_id = cr.lastrowid
        total_price = 0
        for item_id, quantity in items_ordered.items():
            price_query = "SELECT price FROM menu_items WHERE item_id = %s"
            cr.execute(price_query, (item_id,))
            item_price = cr.fetchone()[0]  
            total_item_price = item_price * quantity
            total_price += total_item_price
            order_item_query = "INSERT INTO order_items (order_id, item_id, quantity) VALUES (%s, %s, %s)"
            cr.execute(order_item_query, (order_id, item_id, quantity))
        update_price_query = "UPDATE orders SET total_price = %s WHERE order_id = %s"
        cr.execute(update_price_query, (total_price, order_id))

        
        con.commit()

        print(f"Order placed successfully! Your total price is: {total_price}")
        print(f"your order_id is:{order_id}")
    except Exception as e:
        print("Error:", e)
        con.rollback()  

def track(orderid):
    try:
        q="select * from orders where order_id =%s"
        cr=con.cursor()
        cr.execute(q,orderid)
        print("-----------------------------------------------------------------------------")
        print("order_id | user_id | restaurant_id | order_status | order_date | total_price ")
        print("-----------------------------------------------------------------------------")
        if cr.rowcount>=1:
            for i in cr:
                print(i)
        else:
            print("pls check that order_id is correct")
    except Exception as e:
        print(e)
def delivery_status():
    try:
        ord=int(input("enter a order_id"))
        st=str(input("enter a delivery status(delivered/not delivered)"))
        q="update orders set order_status=%s where order_id=%s"
        cr=con.cursor() 
        cr.execute(q,(st,ord))
        con.commit()
        if(st=="delivered"):
            print("Thank you enjoy your meal")
        elif(st=="not delivered"):
            print("kindly contact this number 044-890-098")
    except Exception as e:
        print(e)
    
def delete(id):
    try:
        q="delete from order_items where order_id=%s"
        q1="delete from orders where order_id=%s"
        cr=con.cursor()
        cr.execute(q,id)
        cr.execute(q1,id)
        con.commit()
        con.commit()
        if(cr.rowcount==0):
            print("pls check the order id")
        else:
            print("your order is cancelled")
    except Exception as e:
        print(e)


