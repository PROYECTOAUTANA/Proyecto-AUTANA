<?php  
Class Conexion extends PDO{
	private $user = 'postgres';
	private $pass = '123456';
	private $dbname = 'autana';
	private $port = 5432;
	private $host = 'localhost';

	function __construct(){

		try
			{	
				$this->dbh = parent::__construct("pgsql:host=$this->host;port=$this->port;dbname=$this->dbname;user=$this->user;password=$this->pass");
				parent::setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
				Conexion::cerrarConexion();
			
			}catch(Exception $e){
				
				echo 'ERROR : '.$e->getMessage();
			}

	}
	
	function cerrarConexion() {
	 
	     $this->dbh = null; 
	}
}
?>