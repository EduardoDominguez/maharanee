var inicio=function () {
	$(".cantidad").keyup(function(e){
		if($(this).val()!=''){
			if(e.keyCode==13 ){
				var id=$(this).attr('data-id');
				var precio=$(this).attr('data-precio');
				var cantidad=$(this).val();
				$(this).parents("tr").find('.subtotal').text((precio*cantidad));
				$.post('../js/modificarDatos.php',{
					Id:id,
					Precio:precio,
					Cantidad:cantidad,
					PrecioProd: precio*cantidad
				},function(e){
						$("#subt").text(e);
				});
				$.post('../js/modificarDatos3.php',{
					Id:id,
					Precio:precio,
					Cantidad:cantidad,
					PrecioProd: precio*cantidad
				},function(e){
						$("#descuent").text(e+"%");
				});
				$.post('../js/modificarDatos2.php',{
					Id:id,
					Precio:precio,
					Cantidad:cantidad,
					PrecioProd: precio*cantidad
				},function(e){
						$("#total").text(e);
				});
			}
		}
	});
}
$(document).on('ready',inicio);
//COmentario