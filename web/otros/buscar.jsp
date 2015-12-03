<?php
include('conexion.php');
if($_POST)
{

$q=$_POST['palabra'];//se recibe la cadena que queremos buscar
$mysqli = conectarse();
$consulta = "select * from producto where NomPro like '%$q%'";
$sql_res = $mysqli->query($consulta);
while($row = $sql_res->fetch_array(MYSQLI_ASSOC))
{
$id=$row['IdProd'];
$nombre=$row['NomPro'];
$foto=$row['ImaGra'];
$codigo=$row['CodPro'];

?>
<a href="producto_completo.php?id=<?php echo $id; ?>" style="text-decoration:none;" >
<div class="display_box" align="left">
<div style="float:left; margin-right:6px;"><img src="<?php echo "../img/Aretes/".$foto?>" width="60" height="60" /></div> 
<div style="margin-right:6px;"><b><?php echo $nombre; ?></b></div>
<div style="margin-right:6px; font-size:14px;" class="desc"><?php echo $codigo; ?></div></div>
</a>
<?php
}

}
else
{

}


?>
