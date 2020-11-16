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
            <h1 class="text-center w-100" id="titulo-centro">Centro hospitalario</h1>
            <br>
            <div class="select-container">
                <h2>Selecciona tu tipo de insumo</h2>
                <select class="form-control">
                    <option value='0'>-TOCA AQUÍ PARA SELECCIONAR UN TIPO-</option>
                    <option value="bolsas">BOLSAS</option>
                    <option value="liquidos">LÍQUIDOS</option>
                    <option value="cafeteria">CAFETERIA</option>
                    <option value="herramientas">HERRAMIENTAS</option>
                    <option value="insumo">INSUMO GENERAL</option>
                    <option value="epp">PROTECCIÓN PERSONAL</option>
                    <option value="otros">OTROS</option>
                </select>
            </div>

            <div class="table-container">
                <table class="table table-striped" id="table">
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
                                <td>
                                    <?php
                                    $color = $arraySelectInsumos["COLOR"];
                                    $colorMinuscula = $color;
                                    echo $color + " <div class=\'color color-$color\'></div>"
                                    ?>
                                </td>
                                <td><?php echo $arraySelectInsumos["DIMENSIONES"] ?></td>
                                <td><?php echo $arraySelectInsumos["CANTIDAD"] ?></td>
                                <td>
                                    <div class="btn btn-primary boton align-items-center justify-content-center" onclick="entrada(<?php echo $arraySelectInsumos['ID'] ?>,'<?php echo $arraySelectInsumos['NOMBRE'] ?>')">
                                        <i class="fas fa-sign-in-alt"></i>
                                        <p>
                                            Entrada
                                        </p>
                                    </div>
                                    <div class="btn btn-danger boton align-items-center justify-content-center">
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
    $(document).ready(function() {
        $('#table').DataTable({
            language: spanishTable, //establece el idioma
            fixedHeader: true,
            colReorder: true,
            responsive: true
        });
    });

    // funciones entrada/salida

    function entrada(idInsumo, nombreInsumo) {
        nombreInsumo = nombreInsumo.toLowerCase();
        Swal.fire({
            title: '¿Cuanto del insumo "' + nombreInsumo + "\" ingresó?",
            html: '<form method=\'POST\'>' +
                '<input type=\'number\' class=\'form-control\' name=\'cantidadEntrada\' min=\'1\' max=\'999999\' required>' +
                '<input type=\'submit\' class=\'btn btn-primary boton\' value=\'Continuar\' name=\'entradaInsumo\'>' +
                '</form>',
            showConfirmButton: false,
            showCloseButton: true
        });
    }
</script>

</html>