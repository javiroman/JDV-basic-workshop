# query -> List the car models with engines reparations

SQL=$(cat <<EOF

SELECT \* FROM carshopworks;

EOF
)

run=$(echo mvn -q install \
	-Dvdb="CarSalesRepairsDatabase" \
	-Dsql=\"$SQL\" \
	-Dusername=\"user\" \
	-Dpassword=\"@123user\")

eval $run
