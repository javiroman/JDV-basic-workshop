mvn -q install -Dvdb="myVDB" -Dsql="select * from carshop" -Dusername="user" -Dpassword="@123user"

#
# Testing Dynamic VDB
#

# Simple SQL select:
# mvn install -Dvdb="CarSalesDatabase" -Dsql="select * from carshop" -Dusername="user" -Dpassword="@123user"

# SQL join:
# mvn -q install -Dvdb="CarSalesDatabase" -Dsql="SELECT carID,models.* FROM shopModels LEFT JOIN models ON models.modID = shopModels.modID;" -Dusername="user" -Dpassword="@123user"
