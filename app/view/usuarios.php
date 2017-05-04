<?php 
session_start();
if(!$_SESSION){
    header("location: ?controller=front&action=home");
}
require_once "sections/head.php"; 
?>
<body>
<?php 
include("sections/navbar.php"); 
include("sections/menu.php"); 
?>

    <!-- contenido -->
        <div id="contenido">
            <div class="container-fluid">
                <div class="row">
                    <div class="contenido_1 col-md-12">
                      <div class="col-md-6 trabajos">
                        <h1><span class="glyphicon glyphicon-user"></span>  <?= $title_view  ?></h1>
                      </div>
                       <div class="col-md-6 col-xs-12 grupobotones">
                        <div class="col-xs-3">
                            <a href="#nuevo_usuario" data-toggle="modal" class="btn btn-default btn-block"><i class="glyphicon glyphicon-plus"></i></a>
                        </div>
                        <div class="col-xs-3">
                            <a href="?controller=front&action=usuarios" class="btn btn-info btn-block"><i class="glyphicon glyphicon-refresh"></i></a>
                        </div>
                        <div class="col-xs-3">
                            <a href="?controller=reporte&action=usuarios_pdf" target="_blank" data-toggle="modal" class="btn btn-danger btn-block"><i class="glyphicon glyphicon-print"></i> PDF</a>
                        </div>
                        <div class="col-xs-3">
                            <a href="?controller=reporte&action=usuarios_excel" data-toggle="modal" class="btn btn-success btn-block"><i class="glyphicon glyphicon-print"></i> Excel</a>
                        </div>
                      </div>
                    </div><br><br><br>
                     <div class="contenido_5 col-md-12">
                        <form>
                                <div class="form-group">
                                      <input type="text" name="filtro" id= "bus" autofocus onkeyup="buscar1();" autocomplete="off" required placeholder="Escribe algo.." class="form-control">
                                </div>
                          </form>
                        </div>
                      <div class="col-sm-12 tablas">
                        <div class="usuarios_paginados"></div>    
                      </div> 
                    </div>
                </div>
            </div>
        <!-- /contenido -->
<!--*****************************************SOLO MODALS*********************************************************-->
<?php 
include("sections/minimenu.php");
include("sections/modal.php"); 
include("sections/footer2.php");
?>
<script src="src/js/jquery.js"></script>
<script src="src/js/ajax.js"></script>
<script src="src/js/bootstrap.min.js"></script>
<script src="src/js/cargando.js"></script>
<script src="src/js/boton.js"></script>
<script src="src/js/fecha.js"></script>
<script src="src/js/hora.js"></script>
<script src="src/js/paginar_usuarios.js"></script>
</body>
</html> 