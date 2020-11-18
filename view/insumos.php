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

    <link rel="stylesheet" href="../assets/css/style.css">

    <title>Insumos</title>
</head>

<body>
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center">
            <h1 class="text-center " id="titulo-centro">Centro hospitalario</h1>
        </div>
        <div class="row align-items-center justify-content-center">
            <h2>Selecciona tu tipo de insumo</h2>
        </div>
        <div class="row align-items-center justify-content-center">
            <div class="col-12">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a href="insumos.php#seccionBolsas"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;"><i class="fas fa-shopping-bag"></i> Bolsas</button></a>
                    <a href="insumos.php#seccionLiquidos"><button type="button" class="btn btn-secondary"><i class="fas fa-pump-soap"></i> Líquidos</button></a>
                    <a href="insumos.php#seccionCafeteria"><button type="button" class="btn btn-secondary"><i class="fas fa-coffee"></i> Cafetería</button></a>
                    <a href="insumos.php#seccionHerramientas"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;"><i class="fas fa-broom"></i> Herramientas</button></a>
                </div>
            </div>
            <div class="col-12">
                <div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 1vh;">
                    <a href="insumos.php#seccionInsumos"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;"><i class="fas fa-soap"></i> Insumo General</button></a>
                    <a href="insumos.php#seccionEpp"><button type="button" class="btn btn-secondary"><i class="fas fa-hard-hat"></i> Protección personal</button></a>
                    <a href="insumos.php#seccionOtros"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;"><i class="fas fa-plus-square"></i> Otros</button></a>
                </div>
            </div>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionBolsas" style="background: rgb(250, 250, 250);">
            <table class="table table-striped" id="tablaBolsas">
                <h2 class="titulo-seccion"><i class="fas fa-shopping-bag"></i> Bolsas</h2>
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
                    $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='BOLSAS';";
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
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaLiquidos')">
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

        <div class="row seccion align-items-center justify-content-center" id="seccionLiquidos">
            <table class="table table-striped" id="tablaLiquidos">
                <h2 class="titulo-seccion"><i class="fas fa-pump-soap"></i> Líquidos</h2>
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE TIPO='LIQUIDOS';";
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
                                <div class="btn btn-danger boton align-items-center justify-content-center" onclick="salida(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>','tablaLiquidos')">
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
    </div>
</body>
<script>
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

    function salida(idInsumo, nombreInsumo, seccionInsumo) {
        nombreInsumo = nombreInsumo.toLowerCase();
        Swal.fire({
            title: '¿Cuanto del insumo "' + nombreInsumo + "\" salió?",
            html: '<form onsubmit=\'confirmarSalida(' + idInsumo + ",\"" + nombreInsumo + "\",\"" + seccionInsumo + '\")' + '\'>' +
                '<input type=\'number\' class=\'form-control\' id=\'cantidadSalida\' min=\'1\' max=\'999999\' required>' +
                '<input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\' style=\'margin-top: 2vh\'>' +
                '</form>',
            showConfirmButton: false,
            showCloseButton: true
        });
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
                window.location.href = "../controller/controller.php?entradaInsumo=true&idInsumo=" + idInsumo + "&cantidadEntrada=" + cantidadEntrada + "&seccionInsumo=" + seccionInsumo;
            }
        })
    }

    function confirmarSalida(idInsumo, nombreInsumo, seccionInsumo) {
        var cantidadSalida = parseInt(document.getElementById("cantidadSalida").value);
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
                window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo;
            }
        })
    }

    $('#tablaBolsas').DataTable({
        language: spanishTable, //establece el idioma
        colReorder: true,
        responsive: true
    });
    $('#tablaLiquidos').DataTable({
        language: spanishTable, //establece el idioma
        colReorder: true,
        responsive: true
    });

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
</script>

</html>