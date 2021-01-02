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

    <script src="../assets/libraries/sweetAlert.js"></script>

    <link rel="stylesheet" href="../assets/libraries/datatables.css">
    <script src="../assets/libraries/datatables.js"></script>

    <!-- Carga FontAwesome-->
    <script src="https://kit.fontawesome.com/482fb72b25.js" crossorigin="anonymous"></script>

    <script src="../assets/libraries/jquery.fittext.js"></script>

    <link rel="shortcut icon" href="../assets/other/logo.ico" type="image/x-icon">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">

    <title>Gestión de insumos JDR</title>
</head>

<body>
    <?php
    require_once 'navbar.php';
    $queryNombreInsumo = "SELECT * FROM VISTA_TRANSACCION";
    $resultadoQueryInsumo = mysqli_query($connection, $queryNombreInsumo);
    ?>
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center" id="cabecera">
            <div class="col-12 align-items-center justify-content-center">
                <h1 id="titulo-pagina">Movimiento de Insumos</h1>
            </div>
            <div class="col-12 align-items-center justify-content-center">
                <br>
            </div>
            <a href="insumos.php">
                <button class="btn btn-primary boton">Volver a gestión de insumos</button>
            </a>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="seccionInsumo" style="background: rgb(250, 250, 250);">
            <table class="table table-striped" id="tablaInsumo">
                <h2 class="titulo-seccion w-100">Movimientos de insumos</h2>
                <thead class="thead-dark">
                    <tr>
                        <th>Tipo movimiento</th>
                        <th>Fecha</th>
                        <th>Tipo Insumo</th>
                        <th>Nombre Insumo</th>
                        <th>Cantidad</th>
                        <th>Centro</th>
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
                            <td><?php echo $array["TIPO_INSUMO"] ?></td>
                            <td><?php echo $array["NOMBRE_INSUMO"] ?></td>
                            <td><?php echo $array["CANTIDAD"] ?></td>
                            <td><?php echo $array["NOMBRE"] ?></td>
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

            window.onload = function() {
                $('#tablaInsumo').DataTable({
                    language: spanishTable, //establece el idioma
                    colReorder: true,
                    responsive: true,
                    "order": [1, "desc"],
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
    </div>

    <?php
    require_once 'footer.php' ?>
</body>

</html>