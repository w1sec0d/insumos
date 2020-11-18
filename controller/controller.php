<?php
require_once '../model/database.php';

if (isset($_REQUEST["entradaInsumo"])) {
    $idInsumo = $_REQUEST["idInsumo"];
    $cantidadEntrada = $_REQUEST["cantidadEntrada"];
    $seccionInsumo = $_REQUEST["seccionInsumo"];

    $queryEntrada = "CALL MODIFICAR_CANTIDAD('$idInsumo',$cantidadEntrada)";
    $resultadoQueryEntrada = mysqli_query($connection, $queryEntrada);
    if ($resultadoQueryEntrada) {
        header("Location: ../view/insumos.php?ingresoExitoso=true#$seccionInsumo");
    }
} else if (isset($_REQUEST["salidaInsumo"])) {
    $idInsumo = $_REQUEST["idInsumo"];
    $cantidadEntrada = $_REQUEST["cantidadSalida"];
    $seccionInsumo = $_REQUEST["seccionInsumo"];

    $queryEntrada = "CALL MODIFICAR_CANTIDAD('$idInsumo',-$cantidadEntrada)";
    $resultadoQueryEntrada = mysqli_query($connection, $queryEntrada);
    if ($resultadoQueryEntrada) {
        header("Location: ../view/insumos.php?salidaExitosa=true#$seccionInsumo");
    }
}
