<?php
require_once '../model/database.php';
session_start();

if (isset($_REQUEST["entradaInsumo"])) {
    $idInsumo = $_REQUEST["idInsumo"];
    $idCentro = $_REQUEST["idCentro"];
    $cantidadEntrada = $_REQUEST["cantidadEntrada"];
    $seccionInsumo = $_REQUEST["seccionInsumo"];
    $busqueda = $_REQUEST["busqueda"];

    $queryEntrada = "CALL MODIFICAR_CANTIDAD('$idInsumo','$idCentro',$cantidadEntrada)";
    $resultadoQueryEntrada = mysqli_query($connection, $queryEntrada);
    if ($resultadoQueryEntrada) {
        $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('ENTRADA',$cantidadEntrada,NOW(),'$idCentro','$idInsumo')";
        $resultadoInsert = mysqli_query($connection, $insertTransaccion);
        if ($resultadoQueryEntrada) {
            if (isset($seccionInsumo)) {
                header("Location: ../view/insumos.php?ingresoExitoso=true&busqueda=$busqueda");
            } else {
                header("Location: ../view/insumos.php?ingresoExitoso=true&seccionInsumo=$seccionInsumo");
            }
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
    $busqueda = $_REQUEST["busqueda"];

    $querySalida = "CALL MODIFICAR_CANTIDAD('$idInsumo','$idCentro',-$cantidadEntrada)";
    $resultadoQuerySalida = mysqli_query($connection, $querySalida);

    if ($resultadoQuerySalida) {
        if (isset($_REQUEST["servicio"]) && isset($_REQUEST["persona"])) {
            $persona = $_REQUEST["persona"];
            $servicio = $_REQUEST["servicio"];
            $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,SERVICIO,PERSONA,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadEntrada,'$justificacion','$servicio','$persona',NOW(),'$idCentro','$idInsumo')";
        } else if (isset($_REQUEST["servicio"]) && !isset($_REQUEST["persona"])) {
            $servicio = $_REQUEST["servicio"];
            $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,SERVICIO,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadEntrada,'$justificacion','$servicio',NOW(),'$idCentro','$idInsumo')";
        } else if (!isset($_REQUEST["servicio"]) && isset($_REQUEST["persona"])) {
            $persona = $_REQUEST["persona"];
            $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,PERSONA,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadEntrada,'$justificacion','$persona',NOW(),'$idCentro','$idInsumo')";
        } else {
            $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadEntrada,'$justificacion',NOW(),'$idCentro','$idInsumo')";
        }
        $resultadoInsert = mysqli_query($connection, $insertTransaccion);
        if ($resultadoInsert) {
            if (empty($seccionInsumo)) {
                header("Location: ../view/insumos.php?salidaExitosa=true&busqueda=$busqueda");
            } else {
                header("Location: ../view/insumos.php?salidaExitosa=true&seccionInsumo=$seccionInsumo");
            }
        }
    } else {
        echo $querySalida;
    }
} else if (isset($_REQUEST["cerrarSesion"])) {
    session_destroy();
    session_abort();
    header("Location:../index.php?sesionCerrada=true");
}
