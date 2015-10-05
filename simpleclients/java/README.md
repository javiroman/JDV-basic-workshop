Simple Java Client for Teiid server
===================================

This is a derivated work from 
Source: <https://github.com/teiid/teiid-quickstarts>

What is it?
-----------

Simpleclient quickstart demonstrates how to make a connection to Teiid using both a Driver
and a DataSource.

The JDBCClient.java is the example code that shows a developer the basic connection logic that
can be used to connect to a Teiid instance running in a JBoss AS server.

The program expects four arguments <host> <port> <vdb> <sql-command>.  The pom.xml defines these arguments in
the pom.xml:

....
			<mainClass>JDBCClient</mainClass>
			<arguments>
				<argument>localhost</argument>  <!-- host -->
				<argument>31000</argument>   <!--  port -->
				<argument>${vdb}</argument>
				<argument>${sql}</argument>
			</arguments>
....

Notice that the <host> and <port> are preset. To point to a different server and/or port, 
change "localhost" and/or "31000" arguments, respectively, in the pom.xml.

#############
#  Build
#############
First, build the project by running

	mvn clean install


#############
#  Execution
#############
To execute a sql query using the simpleclient, use the following format:

		   mvn install -Dvdb="<vdb>" -Dsql="<sql>"

Example:   mvn install -Dvdb="twitter" -Dsql="select * from tweet where query= 'jboss'" -Dusername="teiidUser" -Dpassword="pwd"

Note that the query is in quotes so that it is understood as a single argument.

You can see an execution example in "run.sh" helper.




