<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:25
 */

class database {
	public function __construct($db_name){

	}
	public function init($params = '')
	{

		// Load the DB config file if a DSN string wasn't passed
		if (is_string($params) AND strpos($params, '://') === FALSE)
		{
			// Is the config file in the environment folder?
			if ( ! defined('ENVIRONMENT') OR ! file_exists($file_path = APP_PATH.'config/'.ENVIRONMENT.'/database'.EXT))
			{
				if ( ! file_exists($file_path = APP_PATH.'config/database'.EXT))
				{
					show_error('The configuration file database'.EXT.' does not exist.');
				}
			}


			if ( ! isset(oo::$config['database']) OR count(oo::$config['database']) == 0){
				show_error('No database connection settings were found in the database config file.');
			}

			if ($params != ''){
				$active_group = $params;
			}

			if ( ! isset($active_group) OR ! isset(oo::$config['database'][$active_group])){
				show_error('You have specified an invalid database connection group.');
			}

			$params = oo::$config['database'][$active_group];
		}elseif (is_string($params)){

			/* parse the URL from the DSN string
			 *  Database settings can be passed as discreet
			 *  parameters or as a data source name in the first
			 *  parameter. DSNs must have this prototype:
			 *  $dsn = 'driver://username:password@hostname/database';
			 */

			if (($dns = @parse_url($params)) === FALSE){
				show_error('Invalid DB Connection String');
			}

			$params = array(
				'dbdriver'	=> $dns['scheme'],
				'hostname'	=> (isset($dns['host'])) ? rawurldecode($dns['host']) : '',
				'username'	=> (isset($dns['user'])) ? rawurldecode($dns['user']) : '',
				'password'	=> (isset($dns['pass'])) ? rawurldecode($dns['pass']) : '',
				'database'	=> (isset($dns['path'])) ? rawurldecode(substr($dns['path'], 1)) : ''
			);

			// were additional config items set?
			if (isset($dns['query'])){
				parse_str($dns['query'], $extra);

				foreach ($extra as $key => $val){
					// booleans please
					if (strtoupper($val) == "TRUE"){
						$val = TRUE;
					}
					elseif (strtoupper($val) == "FALSE"){
						$val = FALSE;
					}

					$params[$key] = $val;
				}
			}
		}

		// No DB specified yet?  Beat them senseless...
		if ( ! isset($params['dbdriver']) OR $params['dbdriver'] == ''){
			show_error('You have not selected a database type to connect to.');
		}

		// Load the DB classes.  Note: Since the active record class is optional
		// we need to dynamically create a class that extends proper parent class
		// based on whether we're using the active record class or not.
		// Kudos to Paul for discovering this clever use of eval()

		$driver_name = $params['dbdriver'].'_driver';
		return  new $driver_name($params);
	}
}