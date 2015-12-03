$(document).ready(function(){
     $('#FormC').validate({
     		rules:{
     			nombre:{
     				required:true
     			},
     			asunto:{
     				required:true
     			},
     			email:{
     				required:true,
     				email:true
     			},
     			mensaje:{
     				required:true
     			}
     		},
     		messages:{
     			nombre:{
     					required:"Campo obligatorio."
     			},
     			asunto:{
     					required:"Campo obligatorio."
     			},
     			email:{
     					required:"Campo obligatorio.",
     					email:"Ingrese un correo válido."
     			},
     			mensaje:{
     					required:"Campo obligatorio."
     			}
     		}
     });
	});