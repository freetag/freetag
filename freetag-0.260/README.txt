Gordon Luk's Freetag for PHP4 - v0.260
(c) 2004-2006 Gordon Luk (gluk at getluky dot net)
http://www.getluky.net
Released under both BSD and GNU Lesser GPL library license.
For complete licensing terms, read license.txt

----------------------------------------------------

Description

Freetag is an easy tagging and folksonomy-enabled plugin for use with MySQL-PHP applications. 
It allows you to create tags on existing database schemas, and access and manage your tags through
a robust API. 

----------------------------------------------------

Requirements / Suitability

Freetag is designed for applications running on the LAMP (Linux, Apache, MySQL, PHP) stack.
Theoretically, as long as you're using MySQL and PHP, it should work. If it does, let me know!

See below for tested versions.

Freetag should fit in well with most database schemas that have an integer as a primary key,
but you should know the following limitations before you begin:
 * Freetag expects to reference single primary keys for both objects to tag, and users who
   tag them.
 * Freetag expects to reference integers for the two above as well.


----------------------------------------------------

Installing New / Usage

To install Freetag, download http://www.getluky.net/projects/freetag/freetag-latest.tar.gz. 
Unzip the file to an include directory outside of your public web structure.
> tar xzvf freetag-latest.tar.gz

There will be two files of major interest:
  * freetag.class.php <- The class file, which includes the freetag api.
  * freetag.sql <- A SQL script file to use to create your freetag tables in a MySQL database.

You can either use an existing database, or create a new database to store the tag information.
Editing freetag.class.php with your own database parameters is deprecated. See
below for how to pass your connection parameters to the constructor.

Import the table definitions by running the freetag.sql script file:
> mysql -u <username> -p <databasename> < freetag.sql

After it runs, you're ready to include the freetag class in your PHP application!

Freetag now supports passing all startup parameters via the freetag()
constructor. You can construct an array of parameters and pass them as shown
below:

	require_once("freetag/freetag.class.php");

	$freetag_options = array (
		'debug' => FALSE,
		'db_user' => '<username>',
		'db_pass' => '<password>',
		'db_host' => 'localhost',
		'db_name' => '<databasename>'
		'table_prefix' => '<prefix>'
		);

	$freetag = new freetag($freetag_options);

This is useful because you can install future versions of freetag without
needing to re-edit the classfile with your instance's parameters!

To install multiple Freetag instances on the same db, install the original
tables, then rename them to have a different prefix. Set up your constructor
options with an appropriate 'table_prefix' setting, and it should use your
renamed tables.

For a complete listing of statup parameters, see the documentation for the
constructor at:

http://getluky.net/projects/freetag/doc/freetag_api/freetag.html#freetag

You should identify the integer primary keys for the objects and users you want to tag with, and
you will be ready to start using the API.

Read through the phpdocumentor-generated documentation in doc/ for information about the API functions.

----------------------------------------------------

Upgrading

FROM > v02.02 to v0.260:
  * Simply unzip the tarfile over the existing version.

FROM v02.20 to v0.230 and v0.231:
  * Simply unzip the tarfile over the existing v0.220 version.

FROM v02.10 to v0.220:
  * Simply unzip the tarfile over the existing v0.210 version.

FROM v0.202 to v0.210:
  * Simply unzip the tarfile over the existing v0.201 version.

FROM v0.201 to v0.202:
  * Untar the package to a directory.
  * Change your include() statements to the new directory.
  * Run the  update_0.201_to_0.202.sql script on your freetag database to add the new indexes.
> mysql -u <username> -p <databasename> <  update_0.201_to_0.202.sql
  * You're all set! Email me if you run into probs.

----------------------------------------------------

Plans & Issues

Please see Freetag's JIRA install at http://getluky.net:8080/ to see future plans and
current issues for Freetag.

----------------------------------------------------

Tested On:

 * RHEL ES3, PHP 4, MySQL 3.23
 * Debian GNU/Linux, PHP4, MySQL 4.1.12

----------------------------------------------------

Changes:

v0.260
  * $tagger_sql variable not set in safe_tag method sometimes
  * Functions to support tag pagination
  * Handling integer tags 
  * Doc bug: Change @param to @var in member variables
v0.250
  * Tag multiple objects at once
  * Add user restriction to similar_tags
  * Optionally support mysqli driver for ADOdb
  * Return list of objects sorted by timestamp with get_most_recent_objects
  * Fixed a documentation error
v0.240
  * Many quick bugfixes for doc and API errors
  * Update functionality in tag_object
  * New, simpler get_tag_cloud_* methods
  * New similar_objects method
v0.231
  * Quick bugfix for $prefix missing in get_*tag_id methods.
v0.230
  * Small Freetag badge for posting on your website! Spread the word!
  * New Runtime Configuration options:
    * Table Prefix
	* Allow multiuser tag on object
	* Switch normalizing on/off
  * Improved Implementation Guide PDF
  * Added delete_all_object_tags_for_user utility function
v0.220
  * Added a real constructor that accepts various instance parameters, including:
    * Database connection parameters
	* A set of characters to use for tag normalization (allows your own
	  normalization for tags!)
  * Tag combinations are now supported via get_objects_with_tag_combo()!
v0.210 
  * Added similar_tags contribution from Myles Grant
  * Fix bug with tagging for get_magic_quotes_gpc() off.
v0.202 - Small fixes:
  * Initialize $tagger_sql in all functions to avoid PHP warnings. (Thanks, Gabriel!)
  * Added 3-column primary key and column indexes to table
	`freetagged_objects`
v0.201 - Small fix to retain SQL quote escapes through tag_object
v0.2 - Revision and API function edits 
  * Support for raw tags
  * Added quoted-phrase support for tag creation
  * Added silly_list function for generating zeitgeist-like pages.
  * Fixed various bugs
v0.1 - Initial version created for eatlunch.at in 2004

----------------------------------------------------

Documentation / for more info:

Try the FreetagImplementationGuide.pdf included with the distribution for
implementation sample code and explanation.

Mailing lists can be found at http://getluky.net/mailman/listinfo.

For up-to-date news and information, see
http://getluky.net/tags/tech/freetag/.

Regarding the ADODB Library used by Freetag:

>> ADODB Library for PHP4
>> (c) 2000-2004 John Lim (jlim@natsoft.com.my)
>> Released under both BSD and GNU Lesser GPL library license. 
This means you can use it in proprietary products.
>> For more info about ADOdb, visit http://adodb.sourceforge.net/
>> Please read the rest of the ADODB license terms in adodb/license.txt
