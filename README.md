Freetag
=======

Freetag is a simple tagging library for PHP/MySQL applications.

Getting started
----------------

* Copy files into a subdirectory on your server
* Load the mysql schema from freetag.sql

Then load the library like this:

	require_once("freetag/freetag.class.php");

	$freetag_options = array (
		'db_user' => '<username>',
		'db_pass' => '<password>',
		'db_host' => 'localhost',
		'db_name' => '<databasename>'
		'table_prefix' => '<prefix>'
		);

	$freetag = new freetag($freetag_options);

Documentation
--------------

* See FreetagImplementationGuide.pdf for explanations and sample code
* Full documentation can be found in the doc directory

Tested on
----------

 * RHEL ES3, PHP 4, MySQL 3.23
 * Debian GNU/Linux, PHP4, MySQL 4.1.12

Upgrading
----------

From > v02.02 to v0.260:

* Simply unzip the tarfile over the existing version

From v02.20 to v0.230 and v0.231:

* Simply unzip the tarfile over the existing v0.220 version

From v02.10 to v0.220:

* Simply unzip the tarfile over the existing v0.210 version

From v0.202 to v0.210:

* Simply unzip the tarfile over the existing v0.201 version

From v0.201 to v0.202:

* Untar the package to a directory
* Change your include() statements to the new directory
* Run the  update_0.201_to_0.202.sql script on your freetag database to add the new indexes: <code>mysql -u <username> -p <databasename> <  update_0.201_to_0.202.sql</code>

Licensing
---------

Freetag
&copy; 2004-2006 Gordon Luk (gluk at getluky dot net)
http://www.getluky.net/
Released under both BSD and GNU Lesser GPL library license.
For complete Freetag licensing terms, see license.txt

ADOdb library
&copy; 2000-2004 John Lim (jlim at natsoft dot com dot my)
http://adodb.sourceforge.net/
Released under both BSD and GNU Lesser GPL library license. 
For complete ADOdb licensing terms, see adodb/license.txt
