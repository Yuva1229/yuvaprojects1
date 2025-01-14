from logic import *

dbconnection()

if login() == True:
    while True:
        print("\n--- ---- Main Menu ---- ---")
        print("Press 1 to view restaurants")
        print("Press 2 to order the items")
        print("Press 3 to track the delivery")
        print("Press 4 for delivery status")
        print("pres 5 to cancel the order")
        print("Press 6 to Exit")
        print("\n---- ----- ---- ----")
        cho = input("Enter a choice: ")

        if cho == '1':
            viewresturant()

        elif cho == '2':
            user_id = int(input("Enter your user ID: "))
            restaurant_id = int(input("Enter the restaurant ID: "))

            
            items_ordered = {}  

            while True:
                try:
                    
                    item_id = int(input("Enter the menu item ID (or type 0 to finish): "))
                    if item_id == 0:  
                        break
                    quantity = int(input("Enter the quantity: "))

                    if item_id not in items_ordered:
                        items_ordered[item_id] = quantity
                    else:
                        items_ordered[item_id] += quantity  
                except ValueError:
                    print("Please enter valid item ID and quantity")

           
            if items_ordered:
                place_order(user_id, restaurant_id, items_ordered)  
            else:
                print("No items ordered, please add items before placing the order.")

        elif cho == '3':
            order_id = int(input("Enter your order ID to track: "))
            track(order_id)

        elif cho == '4':
            delivery_status()
        elif cho=='5':
            id=int(input("enter a id to delete"))
            sure=input("sure are you wiling to cancel the order yes/no")
            if(sure=="yes"):
                delete(id)
            else:
                print("Thank you your order will be reached you")

            
        elif cho == '6':
            print("----- -----THANK YOU! VISIT AGAIN.----- -----")
            break

        else:
            print("Invalid choice, please select the correct option.")


    