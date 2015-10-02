system echo "List of model information on earch car in shop for sale"
system echo "-------------------------------------------------------"

USE carsales;

SELECT carID, 
       models.* 
FROM shopModels 
LEFT JOIN models ON models.modID = shopModels.modID;


