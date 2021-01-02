<?php
require_once '../model/database.php';
session_start();

if (isset($_REQUEST["entradaInsumo"])) {
    $idInsumo = $_REQUEST["idInsumo"];
    $idCentro = $_REQUEST["idCentro"];
    $cantidadEntrada = $_REQUEST["cantidadEntrada"];
    if (isset($_REQUEST["seccionInsumo"])) {
        $seccionInsumo = $_REQUEST["seccionInsumo"];
    } else if (isset($_REQUEST["busqueda"])) {
        $busqueda = $_REQUEST["busqueda"];
    }

    $queryEntrada = "CALL MODIFICAR_CANTIDAD('$idInsumo','$idCentro',$cantidadEntrada)";
    $resultadoQueryEntrada = mysqli_query($connection, $queryEntrada);
    if ($resultadoQueryEntrada) {
        $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('ENTRADA',$cantidadEntrada,NOW(),'$idCentro','$idInsumo')";
        $resultadoInsert = mysqli_query($connection, $insertTransaccion);
        if ($resultadoQueryEntrada) {
            if (isset($_REQUEST["busqueda"])) {
                header("Location: ../view/insumos.php?ingresoExitoso=true&busqueda=$busqueda");
            } else if (isset($_REQUEST["seccionInsumo"])) {
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
    $cantidadSalida = $_REQUEST["cantidadSalida"];
    if (isset($_REQUEST["seccionInsumo"])) {
        $seccionInsumo = $_REQUEST["seccionInsumo"];
    } else if (isset($_REQUEST["busqueda"])) {
        $busqueda = $_REQUEST["busqueda"];
    }

    $queryExistencias = "SELECT CANTIDAD FROM INVENTARIO WHERE ID_INSUMO = '$idInsumo' AND ID_CENTRO = '$idCentro'";
    $resultadoExistencias = mysqli_query($connection, $queryExistencias);
    $arrayExistencias = mysqli_fetch_array($resultadoExistencias);
    $existencias = $arrayExistencias["CANTIDAD"];

    if (($existencias - $cantidadSalida) < 0) {
        if (isset($_REQUEST["seccionInsumo"])) {
            header("Location: ../view/insumos.php?inventarioInsuficiente=true&seccionInsumo=$seccionInsumo");
        } else if (isset($_REQUEST["busqueda"])) {
            header("Location: ../view/insumos.php?inventarioInsuficiente=true&busqueda=$busqueda");
        }
    } else {
        $querySalida = "CALL MODIFICAR_CANTIDAD('$idInsumo','$idCentro',-$cantidadSalida)";
        $resultadoQuerySalida = mysqli_query($connection, $querySalida);

        if ($resultadoQuerySalida) {
            if (isset($_REQUEST["servicio"]) && isset($_REQUEST["persona"])) {
                $persona = $_REQUEST["persona"];
                $servicio = $_REQUEST["servicio"];
                $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,SERVICIO,PERSONA,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadSalida,'$justificacion','$servicio','$persona',NOW(),'$idCentro','$idInsumo')";
            } else if (isset($_REQUEST["servicio"]) && !isset($_REQUEST["persona"])) {
                $servicio = $_REQUEST["servicio"];
                $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,SERVICIO,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadSalida,'$justificacion','$servicio',NOW(),'$idCentro','$idInsumo')";
            } else if (!isset($_REQUEST["servicio"]) && isset($_REQUEST["persona"])) {
                $persona = $_REQUEST["persona"];
                $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,PERSONA,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadSalida,'$justificacion','$persona',NOW(),'$idCentro','$idInsumo')";
            } else {
                $insertTransaccion = "INSERT INTO TRANSACCION(TIPO,CANTIDAD,JUSTIFICACION,FECHA,ID_CENTRO,ID_INSUMO) VALUES ('SALIDA',$cantidadSalida,'$justificacion',NOW(),'$idCentro','$idInsumo')";
            }
            $resultadoInsert = mysqli_query($connection, $insertTransaccion);
            if ($resultadoInsert) {
                if (isset($_REQUEST["seccionInsumo"])) {
                    header("Location: ../view/insumos.php?salidaExitosa=true&seccionInsumo=$seccionInsumo");
                } else if (isset($_REQUEST["busqueda"])) {
                    header("Location: ../view/insumos.php?salidaExitosa=true&busqueda=$busqueda");
                }
            }
        } else {
            echo $querySalida;
        }
    }
} else if (isset($_REQUEST["cerrarSesion"])) {
    session_destroy();
    session_abort();
    header("Location:../index.php?sesionCerrada=true");
}
