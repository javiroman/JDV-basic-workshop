# query -> List the car models with engines reparations

SQL=$(cat <<EOF

SELECT shopModels.carID,models.model FROM shopModels \
	LEFT JOIN models ON models.modID = shopModels.modID;

EOF
)

run=$(echo mvn -q install \
	-Dvdb="CarSalesRepairsDatabase" \
	-Dsql=\"$SQL\" \
	-Dusername=\"user\" \
	-Dpassword=\"@123user\")

eval $run
