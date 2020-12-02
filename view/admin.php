<?php
session_start();
require_once '../model/database.php';
if (!$_SESSION["admin"]) {
    header("Location: ../index.php?error=true");
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

    <link rel="stylesheet" href="../assets/css/style.css">

    <style>
        table tbody tr:hover {
            background-color: whitesmoke !important;
        }
    </style>
    <title>Gestión de insumos JDR</title>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <?php require_once 'navbar.php'; ?>
        </div>
        <div class="row align-items-center justify-content-center" id="cabecera">
            <div class="col-12 align-items-center justify-content-center">
                <h1 class="text-center" id="titulo-centro"><i class="fas fa-user-shield"></i> Sección Administrador</h1>
                <br>
            </div>
        </div>

        <div class="row seccion align-items-center justify-content-center" id="" style="background: rgb(250, 250, 250);">
            <table class="table table-striped" id="tablaSimon">
                <h2 class="titulo-seccion w-100"><i class="fas fa-hospital"></i> H. Simón Bolívar</h2>
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>Fecha y hora</th>
                        <th>Tipo</th>
                        <th>Insumo</th>
                        <th>Color</th>
                        <th>Cantidad</th>
                        <th>Justificacion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $idCentro = $_SESSION["idCentro"];
                    $selectInsumos = "SELECT * FROM VISTA_TRANSACCION WHERE ID_CENTRO = 1";
                    $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                    while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                    ?>
                        <tr class="<?php echo $arraySelectInsumos["TIPO"] ?>">
                            <td><?php echo $arraySelectInsumos["TIPO"] ?></td>
                            <td><?php echo $arraySelectInsumos["FECHA"] ?></td>
                            <td><?php echo $arraySelectInsumos["TIPO_INSUMO"] ?></td>
                            <td><?php echo $arraySelectInsumos["NOMBRE_INSUMO"] ?></td>
                            <td class="justify-content-center align-items-center">
                                <?php
                                $color = $arraySelectInsumos["COLOR"];
                                $colorMinuscula = strtolower($color);
                                echo "<p>" . $color . "</p> <div class='color color-$colorMinuscula'></div>"
                                ?>
                            </td>
                            <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            <td><?php echo $arraySelectInsumos["JUSTIFICACION"] ?></td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
            <table class="table table-striped" id="tablaTunal">
                <h2 class="titulo-seccion w-100"><i class="fas fa-hospital"></i> H. Tunal</h2>
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>Fecha y hora</th>
                        <th>Tipo</th>
                        <th>Insumo</th>
                        <th>Color</th>
                        <th>Cantidad</th>
                        <th>Justificacion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $idCentro = $_SESSION["idCentro"];
                    $selectInsumos = "SELECT * FROM VISTA_TRANSACCION WHERE ID_CENTRO = 2";
                    $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                    while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                    ?>
                        <tr class="<?php echo $arraySelectInsumos["TIPO"] ?>">
                            <td><?php echo $arraySelectInsumos["TIPO"] ?></td>
                            <td><?php echo $arraySelectInsumos["FECHA"] ?></td>
                            <td><?php echo $arraySelectInsumos["TIPO_INSUMO"] ?></td>
                            <td><?php echo $arraySelectInsumos["NOMBRE_INSUMO"] ?></td>
                            <td class="justify-content-center align-items-center">
                                <?php
                                $color = $arraySelectInsumos["COLOR"];
                                $colorMinuscula = strtolower($color);
                                echo "<p>" . $color . "</p> <div class='color color-$colorMinuscula'></div>"
                                ?>
                            </td>
                            <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            <td><?php echo $arraySelectInsumos["JUSTIFICACION"] ?></td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
            <table class="table table-striped" id="tablaSantaClara">
                <h2 class="titulo-seccion w-100"><i class="fas fa-hospital"></i> H. Santa Clara</h2>
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>Fecha y hora</th>
                        <th>Tipo</th>
                        <th>Insumo</th>
                        <th>Color</th>
                        <th>Cantidad</th>
                        <th>Justificacion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $idCentro = $_SESSION["idCentro"];
                    $selectInsumos = "SELECT * FROM VISTA_TRANSACCION WHERE ID_CENTRO = 3";
                    $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                    while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                    ?>
                        <tr class="<?php echo $arraySelectInsumos["TIPO"] ?>">
                            <td><?php echo $arraySelectInsumos["TIPO"] ?></td>
                            <td><?php echo $arraySelectInsumos["FECHA"] ?></td>
                            <td><?php echo $arraySelectInsumos["TIPO_INSUMO"] ?></td>
                            <td><?php echo $arraySelectInsumos["NOMBRE_INSUMO"] ?></td>
                            <td class="justify-content-center align-items-center">
                                <?php
                                $color = $arraySelectInsumos["COLOR"];
                                $colorMinuscula = strtolower($color);
                                echo "<p>" . $color . "</p> <div class='color color-$colorMinuscula'></div>"
                                ?>
                            </td>
                            <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            <td><?php echo $arraySelectInsumos["JUSTIFICACION"] ?></td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
            <table class="table table-striped" id="tablaKennedy">
                <h2 class="titulo-seccion w-100"><i class="fas fa-hospital"></i> H. Kennedy</h2>
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th>Fecha y hora</th>
                        <th>Tipo</th>
                        <th>Insumo</th>
                        <th>Color</th>
                        <th>Cantidad</th>
                        <th>Justificacion</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $idCentro = $_SESSION["idCentro"];
                    $selectInsumos = "SELECT * FROM VISTA_TRANSACCION WHERE ID_CENTRO = 4";
                    $resultadoSelectInsumos = mysqli_query($connection, $selectInsumos);

                    while ($arraySelectInsumos = mysqli_fetch_array($resultadoSelectInsumos)) {
                    ?>
                        <tr class="<?php echo $arraySelectInsumos["TIPO"] ?>">
                            <td><?php echo $arraySelectInsumos["TIPO"] ?></td>
                            <td><?php echo $arraySelectInsumos["FECHA"] ?></td>
                            <td><?php echo $arraySelectInsumos["TIPO_INSUMO"] ?></td>
                            <td><?php echo $arraySelectInsumos["NOMBRE_INSUMO"] ?></td>
                            <td class="justify-content-center align-items-center">
                                <?php
                                $color = $arraySelectInsumos["COLOR"];
                                $colorMinuscula = strtolower($color);
                                echo "<p>" . $color . "</p> <div class='color color-$colorMinuscula'></div>"
                                ?>
                            </td>
                            <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                            <td><?php echo $arraySelectInsumos["JUSTIFICACION"] ?></td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>
        <?php require_once 'footer.php' ?>
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

    //Data tables

    $('.table').DataTable({
        language: spanishTable, //establece el idioma
        colReorder: true,
        responsive: true,
        dom: 'fBtlp', // Establece los elementos a mostrar en la tabla
        "order": [
            [1, "desc"]
        ],
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
</script>

</html>