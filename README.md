This sets out what we will do in Boris Bikes. 

classes = bike, users, docking station, van, garage
methods/actions = rent, return, break, fix, move, hold


CRC 

### Class - Bike
Responsibilites             | Collaborators
----------------------------|------------------
Be rented                   | User, Station
Be returned                 | User, Station
Be broken                   | User
Be moved                    | Van
Be fixed                    | Garage

### Class - User
Responsibilites     | Collaborators
--------------------|------------------------
Rent                |  Bike, Station
Break               |  Bike
Return              |  Bike, Station

### Class - Station 
Responisibilites        |Collaborators
------------------------|------------------
Be rented               |  User, Bike
Be returned             |  User, Bike
Holding                 |  Bikes

### Class - Van 
Responisibilites        |Collaborators
------------------------|------------------
Receive                 |  Bike, Station, Garage
Move                    |  Bike
Eject                   |  Bike, Station, Garage
Holding                 |  Bike


### Class - Garage 
Responisibilites        |Collaborators
------------------------|------------------
Fix                     |  Bike
Hold                    |  Bike
