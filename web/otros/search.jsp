<?php
include('conexion.php');
if($_POST)
{

$q=$_POST['palabra'];//se recibe la cadena que queremos buscar
$mysqli = conectarse();
$consulta = "select * from persona where UsuPer like '%$q%'";
$sql_res = $mysqli->query($consulta);
while($row = $sql_res->fetch_array(MYSQLI_ASSOC))
{
$id=$row['NumEmp'];
$nombre=$row['NomPer'];
$apepat=$row['ApePat'];
$apemat=$row['ApeMat'];
$usuario=$row['UsuPer'];

?>
<a href="usuario_completo.php?id=<?php echo $id; ?>" style="text-decoration:none;" >
<div class="display_box" align="left">
<div style="margin-right:6px;"><b><?php echo $nombre." ".$apepat." ".$apemat; ?></b></div>
<div style="margin-right:6px; font-size:14px;" class="desc"><?php echo $usuario; ?></div></div>
</a>

<?php
}

}
else
{

}


?>
