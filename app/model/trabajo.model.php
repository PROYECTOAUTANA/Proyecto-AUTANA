<?php require "app/database/conexion.php";
class Usuario{

	private $pdo;
	private $tabla;

	public function __construct(){
		$this->pdo = new Conexion();
		$this->tabla = "trabajo";
	}

	public function nuevo($nombre,$cedula,$correo,$usuario,$password,$tipo){

		$sql = $this->pdo->prepare("INSERT INTO $this->tabla ");
        $sql->execute();		
	}
}
?>