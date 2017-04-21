<?php require_once "app/database/conexion.php";
class Usuario{

	private $pdo;

	public function __construct(){
	
		$this->pdo = new Conexion();
	}

	public function registrar_usuario($id_usuario,$cedula,$nombre,$apellido,$sexo,$telefono,$correo,$direccion,$usuario,$clave,$categoria_actual){

		try
			{	
				$sql = $this->pdo->prepare("INSERT INTO usuario(id_usuario,usuario_cedula,usuario_nombre, usuario_apellido,sexo, usuario_telefono, usuario_correo, usuario_direccion, usuario_fecha_registro, usuario_usuario, clave, fk_categoria) VALUES('$id_usuario','$cedula','$nombre','$apellido','$sexo','$telefono','$correo','$direccion',null,'$usuario','$clave','$categoria_actual')");
				$result = $sql->execute();
				return $result;
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}		
	}

	public function eliminar_usuario($id_usuario){

		try
			{	
				$sql = $this->pdo->prepare("DELETE FROM usuario WHERE id_usuario ='$id_usuario'");
				$result = $sql->execute();
				return $result;
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}		
	}

	public function login($usuario,$password){
   		
		try
			{	
				$sql = $this->pdo->prepare("SELECT * FROM usuario , usuario_rol , rol WHERE usuario.usuario_usuario = '$usuario' AND usuario.clave = '$password' AND usuario_rol.fk_rol=rol.id_rol AND usuario_rol.fk_usuario=usuario.id_usuario");
        		$sql->execute(); 
    			$datosDB = $sql->fetch(PDO::FETCH_ASSOC);
    			return $datosDB;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}		
	}

	public function validaCorreo($email){
		try
			{	
				$sql = $this->pdo->prepare("SELECT * FROM usuario WHERE usuario_correo = '$email'");
        		$sql->execute(); 
    			$datosDB = $sql->fetch(PDO::FETCH_ASSOC);
    			return $datosDB;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}			
	}

	public function cambio_clave($id_usuario,$new_pass){
		try
			{	
				$sql = $this->pdo->prepare("UPDATE usuario SET clave = '$new_pass' WHERE id_usuario='$id_usuario'");
        		$sql->execute(); 
    			$datosDB = $sql->fetchAll();
    			return $datosDB;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}			
	}


	public function consultar_id($id_usuario){
		try
			{	
				$sql = $this->pdo->prepare("SELECT * FROM usuario , usuario_departamento , departamento , categoria , usuario_rol ,rol WHERE usuario_departamento.fk_departamento = departamento.id_departamento AND usuario_departamento.fk_usuario = usuario.id_usuario AND usuario.fk_categoria = categoria.id_categoria AND usuario_rol.fk_rol = rol.id_rol AND usuario_rol.fk_usuario = usuario.id_usuario  AND usuario.id_usuario = '$id_usuario'");
        		$sql->execute(); 
    			$datosDB = $sql->fetch(PDO::FETCH_ASSOC);
    			return $datosDB;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}			
	}

	public function consultar_cedula($usuario_cedula){
		try
			{	
				$sql = $this->pdo->prepare("SELECT * FROM usuario , usuario_departamento , departamento , categoria , usuario_rol ,rol WHERE usuario_departamento.fk_departamento = departamento.id_departamento AND usuario_departamento.fk_usuario = usuario.id_usuario AND usuario.fk_categoria = categoria.id_categoria AND usuario_rol.fk_rol = rol.id_rol AND usuario_rol.fk_usuario = usuario.id_usuario  AND usuario.usuario_cedula = '$usuario_cedula'");
        		$sql->execute(); 
    			$datosDB = $sql->fetch(PDO::FETCH_ASSOC);
    			return $datosDB;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}			
	}


	public function buscar($filtro){
		try
			{	
				$sql = $this->pdo->prepare("SELECT * FROM usuario , usuario_departamento , departamento , categoria , usuario_rol ,rol WHERE usuario_departamento.fk_departamento = departamento.id_departamento AND usuario_departamento.fk_usuario = usuario.id_usuario AND usuario.fk_categoria = categoria.id_categoria AND usuario_rol.fk_rol = rol.id_rol AND usuario_rol.fk_usuario = usuario.id_usuario AND usuario.usuario_nombre LIKE '$filtro%'");
        		$sql->execute(); 
    			$datosDB = $sql->fetchAll();
    			$cant = $sql->rowCount();
    			$result = array('datos' => $datosDB, 'cantidad' => $cant);
    			return $result;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}			
	}

	public function listar(){
		try
			{	
				$sql = $this->pdo->prepare("SELECT * FROM usuario , usuario_departamento , departamento , categoria , usuario_rol ,rol WHERE  usuario_departamento.fk_departamento = departamento.id_departamento AND usuario_departamento.fk_usuario = usuario.id_usuario AND usuario.fk_categoria = categoria.id_categoria AND usuario_rol.fk_rol = rol.id_rol AND usuario_rol.fk_usuario = usuario.id_usuario");
        		$sql->execute(); 
    			$datosDB = $sql->fetchAll();
    			$cant = $sql->rowCount();
    			$result = array('datos' => $datosDB, 'cantidad' => $cant);
    			return $result;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}			
	}

	public function listar_usuarios($offset,$per_page){
	
		try
			{	
				$query = $this->pdo->prepare("SELECT * FROM usuario , usuario_departamento , departamento , categoria , usuario_rol ,rol WHERE  usuario_departamento.fk_departamento = departamento.id_departamento AND usuario_departamento.fk_usuario = usuario.id_usuario AND usuario.fk_categoria = categoria.id_categoria AND usuario_rol.fk_rol = rol.id_rol AND usuario_rol.fk_usuario = usuario.id_usuario ORDER BY id_usuario LIMIT :per_page OFFSET :offset");
				$query->execute(array(':offset' => $offset, ':per_page' => $per_page));
				$resultado = $query->fetchAll();
				return $resultado;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}	
	}

	public function numero_de_usuarios(){
	
		try
			{	
				$sql   = $this->pdo->query("SELECT COUNT(*) FROM usuario , usuario_departamento , departamento , categoria , usuario_rol ,rol WHERE  usuario_departamento.fk_departamento = departamento.id_departamento AND usuario_departamento.fk_usuario = usuario.id_usuario AND usuario.fk_categoria = categoria.id_categoria AND usuario_rol.fk_rol = rol.id_rol AND usuario_rol.fk_usuario = usuario.id_usuario");
				$numrows = $sql->fetchColumn();
    			return $numrows;
				parent::setAttribute(PDO::ATTR_ERRMODE,-PDO::ERRMODE_EXCEPTION);
			
		}catch(Exception $e){	
				echo 'ERROR : '.$e->getMessage();
		}	
	}
}
?>