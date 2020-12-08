<?php
session_start();
require_once '../model/database.php';
if (!$_SESSION["admin"]) {
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

    <link rel="stylesheet" href="../assets/css/style.css">

    <style>
        table tbody tr:hover {
            background-color: whitesmoke !important;
        }
    </style>
    <title>Gestión de insumos JDR</title>
</head>

<body>
    <?php require_once 'navbar.php'; ?>
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center" id="cabecera">
            <div class="col-12 align-items-center justify-content-center">
                <h1 class="text-center" id="titulo-centro"><i class="fas fa-user-shield"></i> Sección Administrador</h1>
                <br>
            </div>
            <div class="col-12 align-items-center justify-content-center">
                <h3>Filtrar por hospital</h3>
            </div>
            <div class="col-12">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a onclick="mostrar('#seccionSimon')"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0 0 0.25rem;">H. Simón Bolívar</button></a>
                    <a onclick="mostrar('#seccionTunal')"><button type="button" class="btn btn-secondary">H. Tunal</button></a>
                    <a onclick="mostrar('#seccionSantaClara')"><button type="button" class="btn btn-secondary">H. Santa Clara</button></a>
                    <a onclick="mostrar('#seccionKennedy')"><button type="button" class="btn btn-secondary" style="border-radius: 0 0.25rem 0.25rem 0;">H. Kennedy</button></a>
                </div>
                <br><br>
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a onclick="mostrar('#seccionGeneral')"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0.25rem 0.25rem 0.25rem;">Inventario General</button></a>
                </div>
            </div>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="" style="background: rgb(250, 250, 250);">
            <div id="seccionSimon">
                <table class="table table-striped" id="tablaSimon">
                    <h2 class="titulo-seccion w-100"><i class="fas fa-dolly-flatbed"></i> Inventario H. Simón Bolívar</h2>
                    <thead class="thead-dark">
                        <tr>
                            <th>Insumo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE ID_CENTRO = 1";
                        $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                        while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                        ?>
                            <tr>
                                <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                                <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <div id="seccionTunal">
                <table class="table table-striped" id="tablaTunal">
                    <h2 class="titulo-seccion w-100"><i class="fas fa-dolly-flatbed"></i> Inventario H. Tunal</h2>
                    <thead class="thead-dark">
                        <tr>
                            <th>Insumo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE ID_CENTRO = 2";
                        $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                        while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                        ?>
                            <tr>
                                <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                                <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <div id="seccionSantaClara">
                <table class="table table-striped" id="tablaSantaClara">
                    <h2 class="titulo-seccion w-100"><i class="fas fa-dolly-flatbed"></i> Inventario H. Santa Clara</h2>
                    <thead class="thead-dark">
                        <tr>
                            <th>Insumo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE ID_CENTRO = 3";
                        $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                        while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                        ?>
                            <tr>
                                <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                                <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <div id="seccionKennedy">
                <table class="table table-striped" id="tablaKennedy">
                    <h2 class="titulo-seccion w-100"><i class="fas fa-dolly-flatbed"></i> Inventario H. Kennedy</h2>
                    <thead class="thead-dark">
                        <tr>
                            <th>Insumo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE ID_CENTRO = 4";
                        $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                        while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                        ?>
                            <tr>
                                <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                                <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
            <div id="seccionGeneral">
                <table class="table table-striped" id="tablaGeneral">
                    <h2 class="titulo-seccion w-100"><i class="fas fa-dolly-flatbed"></i> Inventario General</h2>
                    <thead class="thead-dark">
                        <tr>
                            <th>Insumo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $selectInsumos = "SELECT * FROM VISTA_GENERAL_INSUMOS";
                        $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                        while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                        ?>
                            <tr>
                                <td><?php echo $arraySelectInsumos["NOMBRE"] ?></td>
                                <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <?php require_once 'footer.php' ?>
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

    //Data tables

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
    //FitText

    $("#titulo-centro").fitText(1, {
        minFontSize: '40px',
        maxFontSize: '60px'
    });
    $(".titulo-seccion").fitText(2, {
        minFontSize: '20px',
        maxFontSize: '30px'
    });
    window.onload = function() {
        $('#seccionSimon').hide();
        $('#seccionTunal').hide();
        $('#seccionSantaClara').hide();
        $('#seccionKennedy').hide();
    }

    function mostrar(elemento) {
        $('#seccionSimon').hide();
        $('#seccionTunal').hide();
        $('#seccionSantaClara').hide();
        $('#seccionKennedy').hide();
        $('#seccionGeneral').hide();
        $(elemento).show();
        $([document.documentElement, document.body]).animate({
            scrollTop: $(elemento).offset().top
        }, 1200);
    }
</script>

</html>