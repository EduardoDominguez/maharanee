<?php error_reporting(E_ALL ^ E_NOTICE );   ?>
<?php
$d1 = $_POST["d1_txt"];
$d2 = $_POST["d2_txt"];

include("conexion.php");
    $consulta = "SELECT * from descuento where IdDesc='1'";
    $ejecutar_consulta = $conexion->query($consulta);
    $num_regs = $ejecutar_consulta->num_rows;

    $consulta = "UPDATE descuento set DesUno =$d1, DesDos=$d2 where IdDesc='1'";
        $ejecutar_consulta = $conexion->query(utf8_encode($consulta));

        if($ejecutar_consulta)
        {
            $mensaje = "Se han modificado los descuentos.";
        }
        $conexion->close();
       header("Location: descuentos.php?mensaje=$mensaje");
?>