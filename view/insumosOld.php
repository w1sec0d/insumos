<?php
session_start();
require_once '../model/database.php';

if (!isset($_REQUEST["contrasena"])) {
    if (!isset($_SESSION["autenticado"])) {
        header("Location: ../index.php?error=true");
    }
} else {
    if ($_REQUEST["contrasena"] == 123) {
        $_SESSION["autenticado"] = true;
        $_SESSION["idCentro"] = 1;
        $_SESSION["nombreCentro"] = "Hospital Simón Bolivar";
    } else if ($_REQUEST["contrasena"] == 321) {
        header("Location: ./admin.php");
    } else {
        header("Location: ../index.php?error=true");
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="../assets/libraries/jquery.js"></script>
    <link rel="stylesheet" href="../assets/libraries/bootstrap.css">
    <script src="../assets/libraries/bootstrap.js"></script>

    <script src="../assets/libraries/sweetAlert.js"></script>

    <link rel="stylesheet" href="../assets/libraries/datatables.css">
    <script src="../assets/libraries/datatables.js"></script>

    <!-- Carga FontAwesome-->
    <script src="https://kit.fontawesome.com/482fb72b25.js" crossorigin="anonymous"></script>

    <script src="../assets/libraries/jquery.fittext.js"></script>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">

    <title>Gestión de insumos JDR</title>
</head>

<body>
    <div class="container-fluid">

        <div class="row align-items-center justify-content-center" id="cabecera">
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
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a href="insumos.php#seccionBolsas"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;"><i class="fas fa-shopping-bag"></i> Bolsas</button></a>
                    <a href="insumos.php#seccionToallas"><button type="button" class="btn btn-secondary"><i class="fas fa-toilet-paper"></i> Toallas</button></a>
                    <a href="insumos.php#seccionLiquidos"><button type="button" class="btn btn-secondary"><i class="fas fa-pump-soap"></i> Líquidos</button></a>
                    <a href="insumos.php#seccionCafeteria"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;"><i class="fas fa-coffee"></i> Cafetería</button></a>
                </div>
            </div>
            <div class="col-12">
                <div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 1vh;">
                    <a href="insumos.php#seccionHerramientas"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;"><i class="fas fa-broom"></i> Herramientas</button></a>
                    <a href="insumos.php#seccionInsumos"><button type="button" class="btn btn-secondary"><i class="fas fa-soap"></i> Insumos</button></a>
                    <a href="insumos.php#seccionEPP"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;"><i class="fas fa-hard-hat"></i> EPP</button></a>
                </div>
            </div>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionBolsas" style="background: rgb(250, 250, 250);">
            <table class="table table-striped" id="tablaBolsas">
                <h2 class="titulo-seccion w-100"><i class="fas fa-shopping-bag"></i> Bolsas</h2>
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
                            <td><?php echo $arraySelectInsumos["DIMENSIONES"] ?></td>
                            <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            <td>
                                <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionBolsas')">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <p>
                                        Entrada
                                    </p>
                                </div>
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionBolsas')">
                                    <i class=" fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
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
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','seccionToallas',true)">
                                    <i class=" fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionLiquidos" style="background: rgb(250, 250, 250);">
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
                                <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaLiquidos')">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <p>
                                        Entrada
                                    </p>
                                </div>
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaLiquidos',false)">
                                    <i class="fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
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
                                <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaCafeteria')">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <p>
                                        Entrada
                                    </p>
                                </div>
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaCafeteria',false)">
                                    <i class="fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionHerramientas" style="background: rgb(250, 250, 250);">
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
                                <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaHerramientas')">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <p>
                                        Entrada
                                    </p>
                                </div>
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaHerramientas',true)">
                                    <i class="fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
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
                                <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaInsumos',false)">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <p>
                                        Entrada
                                    </p>
                                </div>
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaInsumos')">
                                    <i class="fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionEPP" style="background: rgb(250, 250, 250);">
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
                                <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaEPP')">
                                    <i class="fas fa-sign-in-alt"></i>
                                    <p>
                                        Entrada
                                    </p>
                                </div>
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaEPP',false)">
                                    <i class="fas fa-sign-out-alt"></i>
                                    <p>
                                        Salida
                                    </p>
                                </div>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>

        <script>
            function isInPage(node) {
                return (node === document.body) ? false : document.body.contains(node);
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

            function salida(idInsumo, nombreInsumo, seccionInsumo, mostrarServicio) {
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
                            '       <select class=\'form-control\' id=\'servicio\' required>' +
                            '           <option value=\'1\'>Servicio 1</option>' +
                            '           <option value=\'2\'>Servicio 2</option>' +
                            '           <option value=\'3\'>Servicio 3</option>' +
                            '           <option value=\'4\'>Servicio 4</option>' +
                            '           <option value=\'5\'>Servicio 5</option>' +
                            '       </select>' +
                            '   </div>' +
                            '   <div class=\'col-12\'>' +
                            '       <input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\'>' +
                            '   </div>' +
                            '</div>' +
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
            }

            function confirmarSalida(idInsumo, nombreInsumo, seccionInsumo) {
                var cantidadSalida = parseInt(document.getElementById("cantidadSalida").value);
                var justificacion = document.getElementById("justificacion").value;

                if (isInPage(document.getElementById("servicio"))) {
                    var servicio = (document.getElementById("servicio")).value;
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
                } else {
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
                }
            }

            window.onload = function() {
                $('.table').DataTable({
                    language: spanishTable, //establece el idioma
                    colReorder: true,
                    responsive: true,
                    dom: 'fBtlp', // Establece los elementos a mostrar en la tabla
                    buttons: [{
                            extend: 'excelHtml5',
                            text: '<i class="fas fa-file-excel fa-fw"></i> Exportar Excel ',
                            titleAttr: 'Exportar a Excel',
                            className: 'boton boton-excel'
                        },
                        {
                            extend: 'print',
                            text: '<i class="fas fa-print fa-fw"></i> Imprimir',
                            titleAttr: 'Imprimir',
                            className: 'boton boton-imprimir'
                        }
                    ]
                });
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
    </div>
</body>

</html>