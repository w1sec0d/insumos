<?php
session_start();
require_once '../model/database.php';

if (isset($_REQUEST["password"])) { // si se intena iniciar sesión
    $_SESSION['tiempo'] = time();   // reestablece el tiempo para que se cierre sesión automáticamente
    $password = $_REQUEST["password"];
    if ($password == 'ad3810' or $password == 'Ad3810' or $password == 'AD3810') {
        $_SESSION["admin"] = true;
        $_SESSION["password"] = $_REQUEST["password"];
        header("Location: ./admin.php");
    } else {
        $queryCentro = "SELECT * FROM CENTRO WHERE PASS = '$password'";
        $resultadoCentro = mysqli_query($connection, $queryCentro);
        $arrayCentro = mysqli_fetch_array($resultadoCentro);
        if (!empty($arrayCentro)) {
            $_SESSION["idCentro"] = $arrayCentro["ID"];
            $_SESSION["nombreCentro"] = $arrayCentro["NOMBRE"];
            $_SESSION["password"] = $password;
        } else {
            header("Location: ../index.php?error=true");
        }
    }
} else if (isset($_SESSION["password"])) {
    if (time() - $_SESSION['tiempo'] > 600) {
        session_destroy();
        header("Location: ../index.php?sesionCaducada=true");
        die();
    } else {
        $_SESSION['tiempo'] = time();
    }
} else {
    header("Location: ../index.php?error=true");
}

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="../assets/libraries/jquery.js"></script>
    <link rel="stylesheet" href="../assets/libraries/bootstrap.css">
    <script src="../assets/libraries/bootstrap.js"></script>

    <script src="../assets/libraries/sweetAlert.js"></script>

    <link rel="stylesheet" href="../assets/libraries/datatables.css">
    <script src="../assets/libraries/datatables.js"></script>

    <script src="plotly-latest.min.js"></script>

    <!-- Carga FontAwesome-->
    <script src="https://kit.fontawesome.com/482fb72b25.js" crossorigin="anonymous"></script>

    <script src="../assets/libraries/jquery.fittext.js"></script>

    <link rel="shortcut icon" href="../assets/other/logo.ico" type="image/x-icon">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">

    <title>Gestión de insumos JDR</title>
</head>

<body class="container-fluid">
    <nav class="row navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="../assets/img/logo.jpeg" width="40" height="30" class="d-inline-block align-top" alt="">
            <b>JDR Asistenciamos E.U</b>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse navbar-expand-md" id="navbarNav">
            <ul class="navbar-nav ml-auto align-items-center text-center">
                <li class="nav-item">
                    <a class="nav-link btn btn-primary" href="../controller/controller.php?cerrarSesion=true" style="color: white; font-weight:bold">
                        <i class="fas fa-sign-in-alt" aria-hidden="true"></i> Cerrar sesión
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="row containerCabecera align-items-center justify-content-center">
        <div class="col align-items-center justify-content-center" id="cabecera">
            <div class="col-12 align-items-center justify-content-center">
                <h1 id="titulo-pagina">Inventario de Insumos</h1>
            </div>
            <div class="col-12 align-items-center justify-content-center">
                <h2 class="text-center" id="titulo-centro"><i class="fas fa-hospital"></i> <?php echo $_SESSION["nombreCentro"] ?></h2>
                <br>
            </div>
            <div class="col-12 align-items-center justify-content-center">
                <h3>Filtrar por tipo de insumo</h3>
            </div>
            <div class="col-12">
                <div class="btn-group" role="group">
                    <a onclick="mostrar('#seccionBolsas')"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;"><i class="fas fa-shopping-bag"></i> Bolsas</button></a>
                    <a onclick="mostrar('#seccionToallas')"><button type="button" class="btn btn-secondary"><i class="fas fa-toilet-paper"></i> Toallas de papel</button></a>
                    <a onclick="mostrar('#seccionLiquidos')"><button type="button" class="btn btn-secondary"><i class="fas fa-pump-soap"></i> Líquidos</button></a>
                    <a onclick="mostrar('#seccionCafeteria')"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;"><i class="fas fa-coffee"></i> Cafetería</button></a>
                </div>
            </div>
            <div class="col-12">
                <div class="btn-group" role="group" style="margin-top: 1vh;">
                    <a onclick="mostrar('#seccionHerramientas')"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;"><i class="fas fa-broom"></i> Herramientas</button></a>
                    <a onclick="mostrar('#seccionInsumos')"><button type="button" class="btn btn-secondary"><i class="fas fa-soap"></i> Insumos</button></a>
                    <a onclick="mostrar('#seccionEPP')"><button type="button" class="btn btn-secondary"><i class="fas fa-hard-hat"></i> EPP</button></a>
                    <a onclick="mostrar('#seccionPapeleria')"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;"><i class="fas fa-paperclip"></i> Papelería</button></a>
                </div>
            </div>
            <div class="col-12">
                <div class="btn-group" role="group" style="margin-top: 1vh;">
                    <a onclick="mostrar('#seccionActivosFijos')"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem"><i class="fas fa-car"></i> Activos Fijos</button></a>
                </div>
            </div>
            <div class="col-12 align-items-center justify-content-center" style="margin-top: 10px;">
                <h3>Buscar por nombre de insumo</h3>
                <input type="text" id="inputBusqueda" class="form-control">
                <button class="btn btn-primary" id="botonBusqueda" onclick="buscar()"><i class="fas fa-search"></i></button>
            </div>
        </div>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionBolsas">
        <table class="table table-striped" id="tablaBolsas">
            <h2 class="titulo-seccion w-100"><i class="fas fa-shopping-bag"></i> Bolsas</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Color</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $idCentro = $_SESSION["idCentro"];
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='BOLSAS' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td class="justify-content-center align-items-center">
                            <?php
                            $color = $arraySelectInsumos["COLOR"];
                            $colorMinuscula = strtolower($color);
                            echo "<p>" . $color . "</p> <div class='color color-$colorMinuscula'></div>"
                            ?>
                        </td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionBolsas')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionBolsas',false,false)">
                                <i class=" fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionToallas">
        <table class="table table-striped" id="tablaToallas">
            <h2 class="titulo-seccion w-100"><i class="fas fa-toilet-paper"></i> Toalla y papel</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $idCentro = $_SESSION["idCentro"];
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='TOALLAS' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionToallas')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionToallas',true,false)">
                                <i class=" fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionLiquidos">
        <table class="table table-striped" id="tablaLiquidos">
            <h2 class="titulo-seccion w-100"><i class="fas fa-pump-soap"></i> Líquidos</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='LIQUIDOS' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionLiquidos')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionLiquidos',false,false)">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionCafeteria">
        <table class="table table-striped" id="tablaCafeteria">
            <h2 class="titulo-seccion w-100"><i class="fas fa-coffee"></i> Cafetería</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='CAFETERIA' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionCafeteria')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionCafeteria',false,false)">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionHerramientas">
        <table class="table table-striped" id="tablaHerramientas">
            <h2 class="titulo-seccion w-100"><i class="fas fa-broom"></i> Herramientas</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='HERRAMIENTAS' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionHerramientas')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionHerramientas',true,false)">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionInsumos">
        <table class="table table-striped" id="tablaInsumos">
            <h2 class="titulo-seccion w-100"><i class="fas fa-soap"></i> Insumo General</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='INSUMOS_GENERALES' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionInsumos',false,false)">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionInsumos')">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionEPP">
        <table class="table table-striped" id="tablaEPP">
            <h2 class="titulo-seccion w-100"><i class="fas fa-hard-hat"></i> Protección personal</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='EPP' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionEPP')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionEPP',false,true)">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionPapeleria">
        <table class="table table-striped" id="tablaPapeleria">
            <h2 class="titulo-seccion w-100"><i class="fas fa-paperclip"></i> Papelería</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='PAPELERIA' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionPapeleria')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionPapeleria',false,true)">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionActivosFijos">
        <table class="table table-striped" id="tablaActivosFijos">
            <h2 class="titulo-seccion w-100"><i class="fas fa-car"></i> Activos Fijos</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='ACTIVOS_FIJOS' AND ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionActivosFijos')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionActivosFijos',false,true)">
                                <i class="fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <div class="row seccion align-items-center justify-content-center" id="seccionTotal">
        <table class="table table-striped" id="tablaTotal">
            <h2 class="titulo-seccion w-100">Listado de insumos</h2>
            <thead class="thead-dark">
                <tr>
                    <th>Nombre</th>
                    <th>Color</th>
                    <th>Dimensiones</th>
                    <th>Cantidad</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $idCentro = $_SESSION["idCentro"];
                $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE ID_CENTRO = '$idCentro';";
                $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                ?>
                    <tr>
                        <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                        <td class="justify-content-center align-items-center">
                            <?php
                            if (isset($arraySelectInsumos["COLOR"])) {
                                $color = $arraySelectInsumos["COLOR"];
                                $colorMinuscula = strtolower($color);
                                echo "<p>" . $color . "</p> <div class='color color-$colorMinuscula'></div>";
                            } else {
                                echo "---";
                            }
                            ?>
                        </td>
                        <td><?php if (isset($arraySelectInsumos["DIMENSIONES"])) {
                                echo $arraySelectInsumos["DIMENSIONES"];
                            } else {
                                echo "---";
                            } ?></td>
                        <td><?php
                            echo $arraySelectInsumos["CANTIDAD"];
                            ?></td>
                        <td>
                            <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>')">
                                <i class="fas fa-sign-in-alt"></i>
                                <p>
                                    Entrada
                                </p>
                            </div>
                            <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>',null,<?php if ($arraySelectInsumos['TIPO'] == 'HERRAMIENTAS' || $arraySelectInsumos['TIPO'] == 'TOALLAS') {
                                                                                                                                                                                                                        echo 'true';
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        echo 'false';
                                                                                                                                                                                                                    } ?>, <?php if ($arraySelectInsumos['TIPO'] == 'EPP') {
                                                                                                                                                                                                                                echo 'true';
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                echo 'false';
                                                                                                                                                                                                                            } ?>)">
                                <i class=" fas fa-sign-out-alt"></i>
                                <p>
                                    Salida
                                </p>
                            </div>
                            <a href="movimientos.php?idInsumo=<?php echo $arraySelectInsumos['ID'] ?>">
                                <div class="btn btn-dark boton align-items-center justify-content-center">
                                    <i class=" fas fa-eye"></i>
                                    <p>
                                        Ver movimientos
                                    </p>
                                </div>
                            </a>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>
    </div>

    <?php require_once 'footer.php' ?>

    <script>
        function isInPage(node) {
            return (node === document.body) ? false : document.body.contains(node);
        }

        function mostrar(elemento) {
            $('#seccionBolsas').hide();
            $('#seccionToallas').hide();
            $('#seccionCafeteria').hide();
            $('#seccionLiquidos').hide();
            $('#seccionHerramientas').hide();
            $('#seccionInsumos').hide();
            $('#seccionEPP').hide();
            $('#seccionPapeleria').hide();
            $('#seccionActivosFijos').hide();
            $('#seccionTotal').hide();
            $(elemento).show();
            $([document.documentElement, document.body]).animate({
                scrollTop: $(elemento).offset().top
            }, 1200);
        }

        function buscar() {
            $('#seccionBolsas').hide();
            $('#seccionToallas').hide();
            $('#seccionCafeteria').hide();
            $('#seccionLiquidos').hide();
            $('#seccionHerramientas').hide();
            $('#seccionInsumos').hide();
            $('#seccionEPP').hide();
            $('#seccionTotal').show(400, "swing");

            var text = document.getElementById("inputBusqueda").value;
            var table = $('#tablaTotal').DataTable();
            table.search(text).draw();
            $([document.documentElement, document.body]).animate({
                scrollTop: $('#seccionTotal').offset().top
            }, 1200);

        }

        var spanishTable = { // Variable que almacena la traduccion a español de la tabla
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Registros del _START_ al _END_ de un total de _TOTAL_ ",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            },
            "buttons": {
                "copy": "Copiar",
                "colvis": "Visibilidad"
            }
        }
        // funciones entrada/salida

        function entrada(idInsumo, nombreInsumo, seccionInsumo) {
            nombreInsumo = nombreInsumo.toLowerCase();
            Swal.fire({
                title: '¿Cuanto del insumo "' + nombreInsumo + "\" ingresó?",
                html: '<form onsubmit=\'confirmarEntrada(' + idInsumo + ",\"" + nombreInsumo + "\",\"" + seccionInsumo + '\")' + '\'>' +
                    '<input type=\'number\' class=\'form-control\' id=\'cantidadEntrada\' min=\'1\' max=\'999999\' required>' +
                    '<input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\' style=\'margin-top: 2vh\'>' +
                    '</form>',
                showConfirmButton: false,
                showCloseButton: true
            });
        }

        function salida(idInsumo, nombreInsumo, seccionInsumo, mostrarServicio, mostrarPersona) {
            nombreInsumo = nombreInsumo.toLowerCase();
            if (mostrarServicio) {
                Swal.fire({
                    title: 'Salida de insumo',
                    html: '<form onsubmit=\'confirmarSalida(' + idInsumo + ",\"" + nombreInsumo + "\",\"" + seccionInsumo + '\")' + '\'>' +
                        '<div class=\'row\'>' +
                        '   <div class=\'col-sm-12 col-md-6 form-group\'>' +
                        '       <label for=\'cantidadSalida\'>Cantidad</label>' +
                        '       <input type=\'number\' class=\'form-control\' id=\'cantidadSalida\' min=\'1\' max=\'999999\' required>' +
                        '   </div>' +
                        '   <div class=\'col-sm-12 col-md-6 form-group\'>' +
                        '       <label for=\'justificacion\'>Justificación</label>' +
                        '       <input type=\'text\' id=\'justificacion\' class=\'form-control\' required>' +
                        '   </div>' +
                        '   <div class=\'col-12 form-group\'>' +
                        '       <label for=\'servicio\'>Servicio</label>' +
                        '       <input type=\'text\' id=\'servicio\' class=\'form-control\'>' +
                        '   </div>' +
                        '   <div class=\'col-12\'>' +
                        '       <input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\'>' +
                        '   </div>' +
                        '</div>' +
                        '</form>',
                    showConfirmButton: false,
                    showCloseButton: true
                });
            } else if (mostrarPersona) {
                Swal.fire({
                    title: 'Salida de insumo',
                    html: '<form onsubmit=\'confirmarSalida(' + idInsumo + ",\"" + nombreInsumo + "\",\"" + seccionInsumo + '\")' + '\'>' +
                        '<div class=\'form-group\'>' +
                        '<label for=\'cantidadSalida\'>Cantidad</label>' +
                        '<input type=\'number\' class=\'form-control\' id=\'cantidadSalida\' min=\'1\' max=\'999999\' required>' +
                        '</div>' +
                        '<div class=\'form-group\'>' +
                        '<label for=\'justificacion\'>Justificación</label>' +
                        '<input type=\'text\' id=\'justificacion\' class=\'form-control\' required>' +
                        '</div>' +
                        '<div class=\'form-group\'>' +
                        '<label for=\'justificacion\'>Persona a quien se entrega:</label>' +
                        '<input type=\'text\' id=\'persona\' class=\'form-control\' required>' +
                        '</div>' +
                        '<input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\'>' +
                        '</form>',
                    showConfirmButton: false,
                    showCloseButton: true
                });
            } else {
                Swal.fire({
                    title: 'Salida de insumo',
                    html: '<form onsubmit=\'confirmarSalida(' + idInsumo + ",\"" + nombreInsumo + "\",\"" + seccionInsumo + '\")' + '\'>' +
                        '<div class=\'form-group\'>' +
                        '<label for=\'cantidadSalida\'>Cantidad</label>' +
                        '<input type=\'number\' class=\'form-control\' id=\'cantidadSalida\' min=\'1\' max=\'999999\' required>' +
                        '</div>' +
                        '<div class=\'form-group\'>' +
                        '<label for=\'justificacion\'>Justificación</label>' +
                        '<input type=\'text\' id=\'justificacion\' class=\'form-control\' required>' +
                        '</div>' +
                        '<input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\'>' +
                        '</form>',
                    showConfirmButton: false,
                    showCloseButton: true
                });
            }
        }

        function confirmarEntrada(idInsumo, nombreInsumo, seccionInsumo) {
            var cantidadEntrada = parseInt(document.getElementById("cantidadEntrada").value);
            var busqueda = document.getElementById("inputBusqueda").value;
            if (busqueda == "") {
                Swal.fire({
                    title: '¿Quieres registrar una entrada de ' + cantidadEntrada + ' "' + nombreInsumo + '"?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#007bff',
                    cancelButtonColor: '#dc3545',
                    confirmButtonText: 'Si, registrar',
                    cancelButtonText: "No, cancelar"
                }).then((result) => {
                    if (result.isConfirmed) {
                        <?php
                        $idCentro = $_SESSION["idCentro"];
                        ?>
                        window.location.href = "../controller/controller.php?entradaInsumo=true&idInsumo=" + idInsumo + "&cantidadEntrada=" + cantidadEntrada + "&seccionInsumo=" + seccionInsumo + "&idCentro=<?php echo $idCentro ?>";
                    }
                })
            } else if (busqueda != "") {
                Swal.fire({
                    title: '¿Quieres registrar una entrada de ' + cantidadEntrada + ' "' + nombreInsumo + '"?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#007bff',
                    cancelButtonColor: '#dc3545',
                    confirmButtonText: 'Si, registrar',
                    cancelButtonText: "No, cancelar"
                }).then((result) => {
                    if (result.isConfirmed) {
                        <?php
                        $idCentro = $_SESSION["idCentro"];
                        ?>
                        window.location.href = "../controller/controller.php?entradaInsumo=true&idInsumo=" + idInsumo + "&cantidadEntrada=" + cantidadEntrada + "&idCentro=<?php echo $idCentro ?>" + "&busqueda=" + busqueda;
                    }
                })
            }

        }

        function confirmarSalida(idInsumo, nombreInsumo, seccionInsumo) {
            var cantidadSalida = parseInt(document.getElementById("cantidadSalida").value);
            var justificacion = document.getElementById("justificacion").value;
            var busqueda = document.getElementById("inputBusqueda").value;

            if (isInPage(document.getElementById("servicio"))) {
                var servicio = (document.getElementById("servicio")).value;
                if (busqueda == "") {
                    Swal.fire({
                        title: '¿Quieres registrar una salida de ' + cantidadSalida + ' "' + nombreInsumo + '"?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#007bff',
                        cancelButtonColor: '#dc3545',
                        confirmButtonText: 'Si, registrar',
                        cancelButtonText: "No, cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>&servicio=" + servicio;
                        }
                    })
                } else if (busqueda != "") {
                    Swal.fire({
                        title: '¿Quieres registrar una salida de ' + cantidadSalida + ' "' + nombreInsumo + '"?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#007bff',
                        cancelButtonColor: '#dc3545',
                        confirmButtonText: 'Si, registrar',
                        cancelButtonText: "No, cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>&servicio=" + servicio + "&busqueda=" + busqueda;
                        }
                    })
                }

            } else if (isInPage(document.getElementById("persona"))) {
                var persona = (document.getElementById("persona")).value;
                if (busqueda == "") {
                    Swal.fire({
                        title: '¿Quieres registrar una salida de ' + cantidadSalida + ' "' + nombreInsumo + '" a la persona ' + persona + "?",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#007bff',
                        cancelButtonColor: '#dc3545',
                        confirmButtonText: 'Si, registrar',
                        cancelButtonText: "No, cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>" + "&persona=" + persona;
                        }
                    })
                } else if (busqueda != "") {
                    Swal.fire({
                        title: '¿Quieres registrar una salida de ' + cantidadSalida + ' "' + nombreInsumo + '" a la persona ' + persona + "?",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#007bff',
                        cancelButtonColor: '#dc3545',
                        confirmButtonText: 'Si, registrar',
                        cancelButtonText: "No, cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>" + "&persona=" + persona + "&busqueda=" + busqueda;
                        }
                    })

                }
            } else {
                if (busqueda == "") {
                    Swal.fire({
                        title: '¿Quieres registrar una salida de ' + cantidadSalida + ' "' + nombreInsumo + '"?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#007bff',
                        cancelButtonColor: '#dc3545',
                        confirmButtonText: 'Si, registrar',
                        cancelButtonText: "No, cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>";
                        }
                    })
                } else if (busqueda != "") {
                    Swal.fire({
                        title: '¿Quieres registrar una salida de ' + cantidadSalida + ' "' + nombreInsumo + '"?',
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#007bff',
                        cancelButtonColor: '#dc3545',
                        confirmButtonText: 'Si, registrar',
                        cancelButtonText: "No, cancelar"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>" + "&busqueda=" + busqueda;
                        }
                    })
                }

            }
        }

        window.onload = function() {
            $('#tablaBolsas').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp' // Establece los elementos a mostrar en la tabla
            });
            $('#tablaToallas').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaLiquidos').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaCafeteria').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaHerramientas').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaInsumos').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaEPP').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaPapeleria').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaActivosFijos').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
            $('#tablaTotal').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });

            $('#seccionBolsas').hide();
            $('#seccionToallas').hide();
            $('#seccionLiquidos').hide();
            $('#seccionCafeteria').hide();
            $('#seccionHerramientas').hide();
            $('#seccionInsumos').hide();
            $('#seccionEPP').hide();
            $('#seccionPapeleria').hide();
            $('#seccionActivosFijos').hide();
            $('#seccionTotal').hide();
            <?php
            if (isset($_REQUEST["seccionInsumo"])) {
                $seccionInsumo = $_REQUEST["seccionInsumo"];
                echo "mostrar('#$seccionInsumo');";
            }
            if (isset($_REQUEST["busqueda"])) {
                $busqueda = $_REQUEST["busqueda"];
            ?>
                var inputBusqueda = document.getElementById("inputBusqueda");
            <?php
                echo "inputBusqueda.value = '" . $busqueda . "';";
                echo "buscar()";
            }
            ?>
        }
        //Data tables
        //Alertas con parametros PHP
        <?php
        if (isset($_REQUEST["ingresoExitoso"])) {
        ?>
            Swal.fire({
                icon: 'success',
                title: '¡Ingreso de insumo registrado!',
                showCloseButton: true,
                timer: 7000
            });
        <?php
        } else if (isset($_REQUEST["salidaExitosa"])) {
        ?>
            Swal.fire({
                icon: 'success',
                title: '¡Salida de insumo registrada!',
                showCloseButton: true,
                timer: 7000
            });
        <?php
        } else if (isset($_REQUEST["inventarioInsuficiente"])) {
        ?>
            Swal.fire({
                icon: 'error',
                title: 'Inventario Insuficiente',
                text: 'La cantidad de insumo disponible es menor a la salida que intentaste registrar',
                footer: 'Si necesitas ayuda, escríbe un correo a: cadavid4003@gmail.com',
                showCloseButton: true
            });
        <?php
        }
        if (isset($_REQUEST["password"])) {
        ?>
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'success',
                title: 'Bienvenid@'
            });
        <?php
        }
        ?>

        //FitText
        $("h1").fitText(1, {
            minFontSize: '30px',
            maxFontSize: '55px'
        });
        $("h2").fitText(2, {
            minFontSize: '20px',
            maxFontSize: '30px'
        });
        $("h3").fitText(2, {
            minFontSize: '15px',
            maxFontSize: '25px'
        });
    </script>
</body>

</html>