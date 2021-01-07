<?php
require_once '../model/database.php';
$query = "SELECT * FROM VISTA_INSUMOS_ESCASOS";
$resultado = mysqli_query($connection, $query);

while ($array = mysqli_fetch_array($resultado)) {
    $asunto = "Bajo inventario en " . $array["NOMBRE_CENTRO"] . " | " . $array["CANTIDAD"] . " " . $array["NOMBRE"];
    $mensaje = "La cantidad mínima para el insumo '" . $array["NOMBRE"] . "' es de " . $array["CANTIDAD_MINIMA "] . ". Pero actualmente hay " . $array["CANTIDAD"] . " unidades";
    mail("cadavid4003@gmail.com", $asunto, $mensaje, "admin@insumosjdr.atwebpages.com");
}
