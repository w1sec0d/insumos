<?php
session_start();
require_once '../model/database.php';

if (isset($_SESSION["password"])) {
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

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <link rel="stylesheet" href="../assets/libraries/datatables.css">
    <script src="../assets/libraries/datatables.js"></script>

    <!-- Carga FontAwesome-->
    <script src="https://kit.fontawesome.com/482fb72b25.js" crossorigin="anonymous"></script>

    <script src="../assets/libraries/jquery.fittext.js"></script>

    <link rel="shortcut icon" href="../assets/other/logo.ico" type="image/x-icon">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Ubuntu:wght@700&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" /> <!-- select 2-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <link rel="stylesheet" href="../assets/css/style.css">

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" /> <!-- select 2-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

    <title>Gestión de insumos JDR</title>

    <style>
        .ENTRADA:hover {
            background: rgb(238, 251, 252) !important;
        }

        .SALIDA:hover {
            background: rgb(255, 240, 240) !important;
        }
    </style>

    <title>Gestión de insumos JDR</title>
</head>

<body class="container-fluid">
    <?php
    require_once 'navbar.php';
    $idCentro = $_SESSION["idCentro"];
    $idInsumo = $_REQUEST["idInsumo"];

    $queryNombreInsumo = "SELECT * FROM VISTA_TRANSACCION WHERE ID_INSUMO = $idInsumo AND ID_CENTRO = $idCentro LIMIT 1";
    $resultadoNombreInsumo = mysqli_query($connection, $queryNombreInsumo);
    $arrayNombreInsumo = mysqli_fetch_array($resultadoNombreInsumo);
    if (is_null($arrayNombreInsumo)) {
        echo "
        <script>
        Swal.fire({
            icon: 'warning',
            title: 'Este insumo no tiene ningún movimiento por ahora',
            text: 'Intenta consultando otro insumo',
            footer: 'Si necesitas ayuda, escríbe un correo a: cadavid4003@gmail.com',
            showConfirmButton: false,
            html: '<a href=\'insumos.php\' class=\'btn btn-primary\'>' +
                'Volver a gestión de insumos' +
                '</a>'
            });
        </script>
        ";
    } else {
        $nombreInsumo = $arrayNombreInsumo["NOMBRE_INSUMO"];

        $queryInsumo = "SELECT * FROM VISTA_TRANSACCION WHERE ID_INSUMO = $idInsumo AND ID_CENTRO = $idCentro";
        $resultadoQueryInsumo = mysqli_query($connection, $queryInsumo);
    ?>
        <div class="row containerCabecera align-items-center justify-content-center" style="height:initial;">
            <div class="row align-items-center justify-content-center" id="cabecera">
                <div class="col-12 align-items-center justify-content-center">
                    <h1 id="titulo-pagina">Movimiento de Insumos</h1>
                </div>
                <div class="col-12 align-items-center justify-content-center">
                    <h2 class="text-center" id="titulo-centro"><i class="fas fa-hospital"></i> <?php echo $_SESSION["nombreCentro"] ?></h2>
                    <br>
                </div>
                <a href="insumos.php">
                    <button class="btn btn-primary boton">Volver a gestión de insumos</button>
                </a>
            </div>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionInsumo">
            <table class="table table-striped" id="tablaInsumo">
                <h2 class="titulo-seccion w-100">Movimientos del insumo <i>"<?php echo strtolower($nombreInsumo) ?>"</i></h2>
                <thead class="thead-dark">
                    <tr>
                        <th>Tipo</th>
                        <th>Fecha</th>
                        <th>Cantidad</th>
                        <th>Persona</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($array = $resultadoQueryInsumo->fetch_assoc()) {
                    ?>
                        <tr class="<?php echo $array["TIPO"] ?>">
                            <td><?php echo $array["TIPO"] ?></td>
                            <td><?php echo $array["FECHA"] ?></td>
                            <td><?php echo $array["CANTIDAD"] ?></td>
                            <td>
                                <?php
                                if (isset($array["PERSONA"])) {
                                    $persona = $array["PERSONA"];
                                    echo "$persona";
                                }
                                ?>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>

    <?php
    }
    require_once 'footer.php'
    ?>
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
                    window.location.href = "../controller/controller.php?entradaInsumo=true&idInsumo=" + idInsumo + "&cantidadEntrada=" + cantidadEntrada + "&seccionInsumo=" + seccionInsumo + "&idCentro=<?php echo $idCentro ?>" + "&busqueda=" + busqueda;
                }
            })
        }

        function confirmarSalida(idInsumo, nombreInsumo, seccionInsumo) {
            var cantidadSalida = parseInt(document.getElementById("cantidadSalida").value);
            var justificacion = document.getElementById("justificacion").value;
            var busqueda = document.getElementById("inputBusqueda").value;

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
                        window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>&servicio=" + servicio + "&busqueda=" + busqueda;
                    }
                })
            } else if (isInPage(document.getElementById("persona"))) {
                var persona = (document.getElementById("persona")).value;
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
                        window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>" + "&persona=" + persona + "&busqueda=" + busqueda;
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
                        window.location.href = "../controller/controller.php?salidaInsumo=true&idInsumo=" + idInsumo + "&cantidadSalida=" + cantidadSalida + "&seccionInsumo=" + seccionInsumo + "&justificacion=" + justificacion + "&idCentro=<?php echo $idCentro ?>" + "&busqueda=" + busqueda;
                    }
                })
            }
        }

        window.onload = function() {
            $('#tablaInsumo').DataTable({
                language: spanishTable, //establece el idioma
                colReorder: true,
                responsive: true,
                "order": [1, "desc"],
                dom: 'ftlp', // Establece los elementos a mostrar en la tabla
            });
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