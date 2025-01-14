from adimpage import *
dbconnection()
if(adminlogin()==True):
    while True:
        print("press 1 to add resutant")
        print("press 2 to add menu items")
        print("press 3 to view resturant")
        print("press 4 to view menu and prices")
        print("press 5 to view the orders")
        print("press 6 to delete the resutant")
        print("press 7 to delte the menu ")
        print("press 8 to exit")
        cho=int(input("enter a choice"))
        if(cho==1):
            addres()
        elif(cho==2):
            menu()
        elif(cho==3):
            view()
        elif(cho==4):
            view1()
        elif(cho==5):
            vieworders()
        elif(cho==6):
            res=int(input("enter a resturant id"))
            su=input("surely want to delte this resturant(yes/no)")
            if(su=="yes"):
                delteres(res)
            else:
                print("continue")
        elif(cho==7):
            de=int(input("enter a menu id"))
            g=input("surely want to delte(yes/no)")
            if(g=="yes"):
                mendel(de)
            else:
                print("continue")
        
        elif(cho==8):
            print("THANK YOU")
            break
        else:
            print("press the crt choice")

        