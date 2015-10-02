system echo "List of model information on earch car in shop for sale"

USE carsales;

SELECT carID, 
       models.* 
FROM shopModels 
LEFT JOIN models ON models.modID = shopModels.modID;


