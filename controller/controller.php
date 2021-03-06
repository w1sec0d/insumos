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
} else if (isset($_REQUEST["crearHospital"])) {
    $NOMBRE = $_REQUEST["NOMBRE"];
    $ABREVIATURA = $_REQUEST["ABREVIATURA"];
    $PASS = $_REQUEST["PASS"];

    $queryHospital = "INSERT INTO CENTRO(NOMBRE,ABREVIATURA,PASS) VALUES ('$NOMBRE', '$ABREVIATURA', '$PASS')";
    $resultadoHospital = mysqli_query($connection, $queryHospital);
    if ($resultadoHospital) {
        $queryID = "SELECT MAX(ID) AS ID FROM CENTRO";
        $resultadoQueryID = mysqli_query($connection, $queryID);
        $arrayID = mysqli_fetch_array($resultadoQueryID);

        $ID = $arrayID["ID"];

        $queryInventarioHospital = "CALL INVENTARIO_CENTRO($ID)";
        $resultadoInventarioHospital = mysqli_query($connection, $queryInventarioHospital);
        if ($resultadoInventarioHospital) {
            header("Location: ../view/admin.php?hospitalCreado=true");
        } else {
            echo $queryInventarioHospital;
        }
    }
} else if (isset($_REQUEST["editarHospital"])) {
    $ID = $_REQUEST["editarHospital"];
    $NOMBRE = $_REQUEST["NOMBRE"];
    $ABREVIATURA = $_REQUEST["ABREVIATURA"];
    $PASS = $_REQUEST["PASS"];

    $queryUpdate = "UPDATE CENTRO SET NOMBRE = '$NOMBRE', ABREVIATURA = '$ABREVIATURA', PASS = '$PASS' WHERE ID = '$ID'";
    $resultadoUpdate = mysqli_query($connection, $queryUpdate);
    if ($resultadoUpdate) {
        header("Location:../view/admin.php?hospitalEditado=true");
    }
} else if (isset($_REQUEST["editarMinimoInsumo"])) {
    $ID = $_REQUEST["editarMinimoInsumo"];
    $CANTIDAD_MINIMA = $_REQUEST["minimo"];
    $mostrarSeccion = $_REQUEST["mostrarSeccion"];
    $queryUpdate = "UPDATE INVENTARIO SET CANTIDAD_MINIMA = $CANTIDAD_MINIMA WHERE ID = '$ID'";
    $resultadoUpdate = mysqli_query($connection,$queryUpdate);
    if($resultadoUpdate){
        header("Location:../view/admin.php?cantidadMinimaEditada=true&mostrarSeccion=$mostrarSeccion");
    }
} else if (isset($_REQUEST["cerrarSesion"])) {
    session_destroy();
    session_abort();
    header("Location:../index.php?sesionCerrada=true");
}
