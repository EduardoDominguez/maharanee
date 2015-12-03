<?php

 error_reporting(E_ALL ^ E_NOTICE );  
 	if($_POST["reactivar_btn"]){
    $categoria = $_POST["nombre_cat_txt"];
    
    include("conexion.php");
    $consulta = "SELECT * from categoria where NomCat='$categoria'";
    $ejecutar_consulta = $conexion->query($consulta);
    $num_regs = $ejecutar_consulta->num_rows;

    if($num_regs==1)
    {


        $consulta = "UPDATE categoria set EstCat ='A' where  NomCat = '$categoria'";
        $ejecutar_consulta = $conexion->query(utf8_encode($consulta));

        if($ejecutar_consulta)
        {
            $mensaje = "Se ha reactivado la categoría.";
        }

    }
    else
    {
        $mensaje= "No se pudo reactivar la categoría.";
    }
    $conexion->close();
    header("Location: agregar-eliminar-categorias.php?mensaje3=$mensaje");
    }

    if($_POST["baja_btn"]){

        $categoria = $_POST["categoria_slc"];
    
    include("conexion.php");
    $consulta = "SELECT * from categoria where NomCat='$categoria'";
    $ejecutar_consulta = $conexion->query($consulta);
    $num_regs = $ejecutar_consulta->num_rows;

    if($num_regs==1)
    {


        $consulta = "UPDATE categoria set EstCat ='B' where  NomCat = '$categoria'";
        $ejecutar_consulta = $conexion->query(utf8_encode($consulta));

        if($ejecutar_consulta)
        {
            $mensaje = "Se ha dado de baja la categoría.";
        }

    }
    else
    {
        $mensaje= "No se pudo dar de baja la categoría.";
    }
    $conexion->close();
    header("Location: agregar-eliminar-categorias.php?mensaje2=$mensaje");

    }
?>