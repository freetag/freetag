Freetag
=======

Freetag is a simple tagging library for PHP/MySQL applications.

Getting started
----------------

* Copy files into a subdirectory on your server
* Load the mysql schema from freetag.sql

Then load the library like this:

```php
	require_once("freetag/freetag.class.php");

	$freetag_options = array (
		'db_user' => '<username>',
		'db_pass' => '<password>',
		'db_host' => 'localhost',
		'db_name' => '<databasename>'
		'table_prefix' => '<prefix>'
		);

	$freetag = new freetag($freetag_options);
```

Documentation
--------------

* See FreetagImplementationGuide.pdf for explanations and sample code
* Full documentation can be found in the doc directory

Tested on
----------

 * RHEL ES3, PHP 4, MySQL 3.23
 * Debian GNU/Linux, PHP4, MySQL 4.1.12