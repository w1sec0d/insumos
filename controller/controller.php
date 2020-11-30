<?php
require_once '../model/database.php';

if (isset($_REQUEST["entradaInsumo"])) {
    $idInsumo = $_REQUEST["idInsumo"];
    $idCentro = $_REQUEST["idCentro"];
    $cantidadEntrada = $_REQUEST["cantidadEntrada"];
    $seccionInsumo = $_REQUEST["seccionInsumo"];

    $queryEntrada = "CALL MODIFICAR_CANTIDAD('$idInsumo',$cantidadEntrada)";
    $resultadoQueryEntrada = mysqli_query($connection, $queryEntrada);
    if ($resultadoQueryEntrada) {
        $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('ENTRADA',$cantidadEntrada,NOW(),'$idCentro','$idInsumo')";
        $resultadoInsert = mysqli_query($connection, $insertTransaccion);
        if ($resultadoQueryEntrada) {
            header("Location: ../view/insumos.php?ingresoExitoso=true#$seccionInsumo");
        } else {
            echo $resultadoInsert;
        }
    }
} else if (isset($_REQUEST["salidaInsumo"])) {
    $idInsumo = $_REQUEST["idInsumo"];
    $idCentro = $_REQUEST["idCentro"];
    $justificacion = $_REQUEST["justificacion"];
    $cantidadEntrada = $_REQUEST["cantidadSalida"];
    $seccionInsumo = $_REQUEST["seccionInsumo"];
    $querySalida = "CALL MODIFICAR_CANTIDAD('$idInsumo',-$cantidadEntrada)";
    $resultadoQuerySalida = mysqli_query($connection, $querySalida);

    if ($resultadoQuerySalida) {
        if (isset($_REQUEST["servicio"])) {
            $servicio = $_REQUEST["servicio"];
            $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,SERVICIO,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadEntrada,'$justificacion','$servicio',NOW(),'$idCentro','$idInsumo')";
        } else {
            $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadEntrada,'$justificacion',NOW(),'$idCentro','$idInsumo')";
        }
        $resultadoInsert = mysqli_query($connection, $insertTransaccion);
        if ($resultadoInsert) {
            header("Location: ../view/insumos.php?salidaExitosa=true#$seccionInsumo");
        }
    } else {
        echo $querySalida;
    }
}
