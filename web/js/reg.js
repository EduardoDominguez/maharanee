var exprMail = /^[Z0-9-a-zA_\-\.]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
var exprTel=/^([0-9])*$/;
var exprNom=/^[A-Za-zƒŠŒŽšœžŸÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ… áéêëìíîïðñòóôõöøùúûüýþÿ]*$/;
var comprobar;
var minix;

function validarchk(){
	var chk = document.getElementById('itOtros');
	var txt = document.getElementById('itOtro');
	if(chk.checked){
    	txt.disabled='';
	}else{
    	txt.value='';
    	txt.disabled='disabled';
	}
}
	
function handleUser(error){
	comprobar=error;
	return comprobar;
}
	
function handleAjax(con){
	$.ajax({
		async: false,
		type: "POST",
		url: "../model/comprobar.php",
		data: "b="+con,
		dataType: "html",
		error: function(){
			alert("error petición ajax");
		},
		success: function (data){
			var entity = data;
			//alert(entity);
			handleUser(entity);
			}
	});
}

$(document).ready(function(){
	$("#enviar").click(function(){
		/*var nombre=$("#itNombre").val();
		var Apepat=$("#itApepat").val();
		var Apemat=$("#itApemat").val();
		var cb = $("input[type = 'checkbox']:checked");
		var Others=$("#itOtro").val();*/
		var Usuario=$("#UserU").val();
		/*var Password=$("#itPassword").val();
		var Password2=$("#itPassword2").val();
		var Mail=$("#itMail").val();
		var Aviso=$("#itAviso").is(":checked");
		var Imagen=$("#itImagen").val();
		var typeImg=Imagen.split('.').pop().toLowerCase();
		var consulta;
		var Ocu=$("#itOcu").val();*/
		
		//alert('click');
		
		/*$("#ErrorNombre").fadeOut();
		$("#ErrorApepat").fadeOut();
		$("#ErrorApemat").fadeOut();
		$("#ErrorIntereses").fadeOut();
		$("#ErrorUsuario").fadeOut();
		$("#ErrorOcu").fadeOut();
		$("#resultado").fadeOut();
		$("#ErrorPassword").fadeOut();
		$("#ErrorPassword2").fadeOut();
		$("#ErrorMail").fadeOut();
		$("#ErrorType").fadeOut();
		$("#ErrorType").fadeOut();
		$("#ErrorAviso").fadeOut();*/
		$("#res").fadeOut();
		$("#ErrorUserU").fadeOut();

		/*if(nombre=="" || !exprNom.test(nombre)){
			$("#ErrorNombre").fadeIn();
			$("#itNombre").focus();
			return false;
		} else{
			$("#ErrorNombre").fadeOut();
			if(Apepat=="" || !exprNom.test(Apepat)){
				$("#ErrorApepat").fadeIn();
				$("#itApepat").focus();
				return false;
			} else{
				$("#ErrorApepat").fadeOut();
				if(Apemat=="" || !exprNom.test(Apemat)){
					$("#ErrorApemat").fadeIn();
					$("#itApemat").focus();
					return false;
				} else{
					$("#ErrorApemat").fadeOut();
					if(Ocu=='' )
						$("#ErrorIntereses").fadeOut();
						if($("#itOtros").is(":checked") == true){
							if(Others == ""){
								$("#ErrorIntereses").fadeIn();
				      				$("#itOtros").focus();
								return false;
							}
						}*/
						if(Usuario==""){
							$("#ErrorUserU").fadeIn();
							$("#UserU").focus();
							return false;
						} else{
							$("#ErrorUserU").fadeOut();
							$("#UserU").focus();
							consulta = $("#UserU").val();
							
							handleAjax(consulta);
							if(handleUser(comprobar)=="Repetido"){
								$("#res").fadeIn();
								$("#UserU").focus();
								return false;
							} else{
								$("#res").fadeOut();
							}
						}
							/*if(Password==""){
								$("#ErrorPassword").fadeIn();
								$("#itPassword").focus();
								return false;
							} else{
								$("#ErrorPassword").fadeOut();
								if(Password2=="" || Password2!=Password){
									$("#ErrorPassword2").fadeIn();
									$("#itPassword2").focus();
									return false;
								} else{
									$("#ErrorPassword2").fadeOut();
									if(Mail==""|| !exprMail.test(Mail)){
										$("#ErrorMail").fadeIn();
										$("#itMail").focus();
										return false;
									} else{
										$("#ErrorMail").fadeOut();
										if($("#itAviso").is(":checked") == false){
											$("#ErrorAviso").fadeIn();
											$("#itAviso").focus();
											return false;
										} else{
											$("#ErrorAviso").fadeOut();
											handleAjaxImage(typeImg);
											if(comp=="Denegado"){
												$("#ErrorType").fadeIn();
												$("#itImagen").focus();
												return false;
											} else{
												$("#ErrorType").fadeOut();
												handleSize();
												if(sf=="Denied"){
													$("#ErrorType").fadeIn();
													$("#itImagen").focus();
													return false;
												} else{
													$("#ErrorType").fadeOut();
												}
											}
										}
									} 
								}
							}
						}
				}	
			}
		}*/
	});
});
