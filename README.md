# warehouse_shipments

## How the App Works
- Create an order list as a hash object with the size of the mattress as key and the qty of it as value
- Send the order list to create a record of the new Order
- Find the warehouse that has the inventory for this order
- Send the order to that warehouse
- Once the warehouse receives the order, it creates a new Shipment which adds products from the warehouse's inventory
- Once the shipment removes products from the warehouse's inventory and into itself, the warehouse updates its inventory

## How to Run the App
- To download: Unzip the files and in your terminal, go to that downloaded directory
- To see how this is possible without a view, run the tests by using the command line `rake spec`. 
- If the tests are passing but you don't see any information on which tests passed, use this command instead `rspec spec --format documentation`
- Typically to run the app, you can use the command `rails server`
- To play around with the app, you can use the command `rails console` and create your own instances of the class objects. 