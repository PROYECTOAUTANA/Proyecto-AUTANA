/**
**ARCHIVO ajax.js nos manejara toda la logica del cliente para hacer multiples consultas 
**/
//VARIABLES GLOBALES
var idTrabajoGlobal;
//BUSCAR UN USUARIO
function buscar1(){
	var n=document.getElementById('bus').value
	var url  = "?controller=usuario&action=buscar";

	$.ajax({
		type: "post",
		url: url,
		data:{n:n},
		success:function(resultado){
		$("#tabla").hide();
		$("#resultado").html(resultado);
		}		
	})
}

//BUSCAR UN TRABAJO
function buscar2(){

	var filtro=document.getElementById('bus').value;
	var url  = "?controller=trabajo&action=buscar";
	
	$.ajax({
		type: "post",
		url: url,
		data:{filtro},
		success:function(resultado){
		$(".outer_div").html(resultado);
		}		
	})
}
//VALIDA SI EL CORREO EXISTE
function validar(){

	var c=document.getElementById('email').value;
	var url  = "?controller=usuario&action=validar_correo";	

	$.ajax({
		type: "post",
		url: url,
		data:{c},
		success:function(resultado){
		$('#email').val("");
		$("#result").html(resultado);
		}		
	})
}
//LOGIN
function log(){

	var usuario=document.getElementById('user').value
	var password=document.getElementById('password').value
	var url  = "?controller=usuario&action=login";
	var datos = {u:usuario,p:password};

	$.ajax({
		type: "post",
		url: url,
		data : datos,
		beforeSend: function () {
            $("#botonloguear").val("Procesando, espere por favor...");
        }  		
	}).done(function(result){
		if (result.estado == true) {
			window.location.href = '?controller=front&action=inicio';
		}else{
			var usuario=document.getElementById('user').value=""
			var password=document.getElementById('password').value=""
			$("#botonloguear").val("Entrar");
			$("#resultados").html('<div class="alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Error!</strong> Usuario o clave incorrecta</div>')
		}
	})
}
//REGISTRA EL TRABAJO
function registrarTrabajo(){
 	var titulo=$("#titulo").val()
 	var proceso=$("#proceso").val()
 	var fecha_pp=$("#fecha_pp").val()
 	var linea=document.getElementById('linea_t').value
 	var fase=document.getElementById('fase_t').value
 	var observacion=$("#observacion").val()

    var url  = "?controller=trabajo&action=registrar_trabajo"; 
    var datos = {"titulo":titulo,"proceso":proceso,"fecha_pp":fecha_pp,"linea":linea,"fase":fase,"observacion":observacion};
    $.ajax({
        type: "post",
        url: url,
        data : datos, 
        success:function(result){
		if (result.estado === true) {
	        	$("#titulo").val("")
				$("#proceso").val("")
				$("#fecha_pp").val("")
				$("#linea_t").val("")
				$("#fase_t").val("")
				$("#observacion").val("")
				$("#botonregistrartrabajo").val("Listo...");
				
			    window.location.href = '?controller=front&action=detalles_trabajo&id_trabajo='+result.id;   
				
	    	}else{
	    		alert("error");
	    	}
		} 
    })
}



//CONSULTA SI EL DOCENTE EXISTE PARA AGREGARLO AL TRABAJO
function consultardocente(){

	var docente=document.getElementById('docentet').value
  	var url  = "?controller=usuario&action=buscar_docente"; 

    $.ajax({
       	type: "post",
        url: url,
        data : {docente:docente}, 
        success: function(result) {
            $("#docentelist").html(result);  
        }   
   	}) 
}
//INCLUYE EL DOCENTE AL TRABAJO
function incluirdocente(){

	var id_trabajo=$("#id_trabajo").val();
	var vinculo=$("#vinculo").val();
 	var id_docente=document.getElementById("radio").value
    var url  = "?controller=usuarioTrabajo&action=vincular_usuario"; 

    var datos = {"id_trabajo":id_trabajo,"id_docente":id_docente,"vinculo":vinculo};
	    	$.ajax({
		        type: "post",
		        url: url,
		        data : datos, 
		        beforeSend: function () {
		            $("#botonincluirdocente").val("Procesando, espere por favor...");
		        }  
	    	}).done(function(result){	
				if (result.estado === true) {
					$("#botonincluirdocente").val(result.mensajeboton);
					$("#respuestadocentes").html(result.mensajeoperacion);
					$("#radio").val("")
					$("#docentet").val("")
					window.location.href = '?controller=front&action=detalles_trabajo&id_trabajo='+id_trabajo;

				}else if (result.estado === false) {
					$("#respuestadocentes").html(result.mensajeoperacion);
				}
			})
    
}
function cambiarFase(){

	var id_trabajo2=$("#id_trabajo2").val();
	var id_fase2=$("#id_fase2").val();
    var url  = "?controller=trabajoFase&action=cambiar_fase"; 

    var datos = {id_trabajo:id_trabajo2,id_fase:id_fase2};
	    	$.ajax({
				type: "post",
				url: url,
				data:datos,
				success:function(resultado){
					$("#respuestacambiarfase").html(resultado.mensajeoperacion);
					 window.location.href = '?controller=front&action=detalles_trabajo&id_trabajo='+id_trabajo2;   

				}		
			})
    
}