<?php
session_start();
require_once '../model/database.php';
if (!isset($_SESSION["admin"])) {
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
        .loader-page {
            position: fixed;
            z-index: 25000;
            background: rgb(255, 255, 255);
            left: 0px;
            top: 0px;
            height: 100%;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all .3s ease;
        }

        .loader-page::before {
            content: "";
            position: absolute;
            border: 2px solid rgb(50, 150, 176);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            box-sizing: border-box;
            border-left: 2px solid rgba(50, 150, 176, 0);
            border-top: 2px solid rgba(50, 150, 176, 0);
            animation: rotarload 1s linear infinite;
            transform: rotate(0deg);
        }

        @keyframes rotarload {
            0% {
                transform: rotate(0deg)
            }

            100% {
                transform: rotate(360deg)
            }
        }

        .loader-page::after {
            content: "";
            position: absolute;
            border: 2px solid rgba(50, 150, 176, .5);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            box-sizing: border-box;
            border-left: 2px solid rgba(50, 150, 176, 0);
            border-top: 2px solid rgba(50, 150, 176, 0);
            animation: rotarload 1s ease-out infinite;
            transform: rotate(0deg);
        }
    </style>
</head>

<body class="container-fluid">
    <div class="loader-page"></div>
    <script>
        $(window).on('load', function() {
            $(".loader-page").css({
                visibility: "hidden",
                opacity: "0"
            })
        });
    </script>
    <nav class="row navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
            <img src="../assets/img/logo.jpeg" width="40" height="30" class="d-inline-block align-top" alt="">
            <b>JDR Asistenciamos E.U</b>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse navbar-expand-md" id="navbarNav">
            <ul class="navbar-nav mr-auto align-items-center text-center">
                <li class="nav-item">
                    <a href="./admin.php" class="btn btn-light" style="margin-right: 5px;">
                        <i class="fas fa-hospital"></i> Gestión de hospitales
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-primary" href="../controller/controller.php?cerrarSesion=true" style="color: white; font-weight:bold">
                        <i class="fas fa-sign-in-alt" aria-hidden="true"></i> Cerrar sesión
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="row containerCabecera align-items-center justify-content-center" style="height:initial;">
        <div class="col align-items-center justify-content-center" id="cabecera">
            <div class="col-12 align-items-center justify-content-center">
                <h1 class="text-center" id="titulo-centro"><i class="fas fa-user-shield"></i> Sección Administrador</h1>
                <br>
            </div>
        </div>
    </div>

    <div class="row seccion align-items-center justify-content-center">
        <?php
        $id = $_REQUEST["idTransacciones"];
        $queryCentro = "SELECT * FROM CENTRO WHERE ID = '$id'";
        $resultadoQueryCentro = mysqli_query($connection, $queryCentro);
        $arrayCentro = mysqli_fetch_array($resultadoQueryCentro);


        $queryTransacciones = "SELECT * FROM VISTA_TRANSACCION WHERE ID_CENTRO = '$id'";
        $resultadoQueryTransacciones = mysqli_query($connection, $queryTransacciones);
        ?>
        <a href="./admin.php" class="btn btn-primary">
            Volver a inicio administrador
        </a>
        <div id="seccion<?php echo $id ?>">
            <table class="table table2 table-striped" id="tablaTransacciones<?php echo $id ?>">
                <h2 class="titulo-seccion w-100" style="margin-top: 40px;"><b><i class="fas fa-exchange-alt"></i> Movimientos de insumos <?php echo $arrayCentro["ABREVIATURA"] ?></b></h2>
                <thead class="thead-dark">
                    <tr>
                        <th>Tipo movimiento</th>
                        <th>Fecha</th>
                        <th>Tipo Insumo</th>
                        <th>Nombre Insumo</th>
                        <th>Cantidad</th>
                        <th>Persona</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($array = $resultadoQueryTransacciones->fetch_assoc()) {
                    ?>
                        <tr class="<?php echo $array["TIPO"] ?>">
                            <td><?php echo $array["TIPO"] ?></td>
                            <td><?php echo $array["FECHA"] ?></td>
                            <td><?php echo $array["TIPO_INSUMO"] ?></td>
                            <td><?php echo $array["NOMBRE_INSUMO"] ?></td>
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
    </div>

    <?php require_once 'footer.php' ?>

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

        $('.table1').DataTable({
            language: spanishTable, //establece el idioma
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
        $('.table2').DataTable({
            language: spanishTable, //establece el idioma
            colReorder: true,
            responsive: true,
            dom: 'fBtlp', // Establece los elementos a mostrar en la tabla
            order: [
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
        $('.table3').DataTable({
            language: spanishTable, //establece el idioma
            colReorder: true,
            responsive: true,
            dom: 'fBtlp', // Establece los elementos a mostrar en la tabla
            order: [
                [1, "desc"]
            ],
            buttons: [{
                    text: '<a onclick="crearHospital()"><i class="fas fa-plus-square"></i> Crear Centro</a> ',
                    titleAttr: 'Crear centro',
                    className: 'boton boton-crear'
                },
                {
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

        function mostrar(elemento, animacion = true) {
            <?php
            $queryCentros = "SELECT * FROM CENTRO";
            $resultadoCentros = mysqli_query($connection, $queryCentros);
            while ($arrayCentros = mysqli_fetch_array($resultadoCentros)) {
            ?>
                $('#seccion<?php echo $arrayCentros["ID"] ?>').hide();
            <?php
            }
            ?>
            $('#seccionGeneral').hide();
            $('#seccionHospitales').hide();
            $(elemento).show();
            if (animacion) {
                $([document.documentElement, document.body]).animate({
                    scrollTop: $(elemento).offset().top
                }, 1200);
            }
        }

        function filtroHospital() {
            var filtro = (document.getElementById("selectHospitales")).value;
            if (filtro == 0) {
                mostrar('#seccionGeneral');
            } else {
                var seccion = "#seccion" + filtro;
                mostrar(seccion);
            }
        }

        function crearHospital() {
            window.location.href = "admin.php?crearCentro=true";
        }

        <?php
        if (isset($_REQUEST["editarHospital"])) {
            $ID = $_REQUEST["editarHospital"];
            $NOMBRE = $_REQUEST["NOMBRE"];
            $ABREVIATURA = $_REQUEST["ABREVIATURA"];
            $PASS = $_REQUEST["PASS"];
        ?>
            Swal.fire({
                width: '60%',
                title: 'Editar Hospital',
                showCloseButton: true,
                allowOutsideClick: false,
                showConfirmButton: false,
                html: '<form action=\'../controller/controller.php?editarHospital=<?php echo $ID ?>\' method=\'POST\'>' +
                    '<div class=\'row\'>' +
                    '   <div class=\'col-sm-12 col-md-6 form-group\'>' +
                    '       <label for=\'NOMBRE\'>Nombre</label>' +
                    '       <input type=\'text\' name=\'NOMBRE\' class=\'form-control\' value=\'<?php echo $NOMBRE ?>\' required>' +
                    '   </div>' +
                    '   <div class=\'col-sm-12 col-md-6 form-group\'>' +
                    '       <label for=\'ABREVIATURA\'>Abreviatura</label>' +
                    '       <input type=\'text\' name=\'ABREVIATURA\' class=\'form-control\' value=\'<?php echo $ABREVIATURA ?>\' required>' +
                    '   </div>' +
                    '   <div class=\'col-12 form-group\'>' +
                    '       <label for=\'PASS\'>Contraseña</label>' +
                    '       <input type=\'text\' name=\'PASS\' class=\'form-control\' value=\'<?php echo $PASS ?>\' required>' +
                    '   </div>' +
                    '   <div class=\'col-12 form-group\'>' +
                    '       <input type=\'submit\' name=\'actualizar\' class=\'btn btn-primary btn-lg\' value=\'Actualizar Hospital\'>' +
                    '   </div>' +
                    '</div>' +
                    '</form>'
            });
        <?php
        } else if (isset($_REQUEST["crearCentro"])) {
        ?>
            Swal.fire({
                width: '60%',
                title: 'Crear Hospital',
                showCloseButton: true,
                allowOutsideClick: false,
                showConfirmButton: false,
                html: '<form action=\'../controller/controller.php?crearHospital=true\' method=\'POST\'>' +
                    '<div class=\'row\'>' +
                    '   <div class=\'col-sm-12 col-md-6 form-group\'>' +
                    '       <label for=\'NOMBRE\'>Nombre</label>' +
                    '       <input type=\'text\' name=\'NOMBRE\' class=\'form-control\' required>' +
                    '   </div>' +
                    '   <div class=\'col-sm-12 col-md-6 form-group\'>' +
                    '       <label for=\'ABREVIATURA\'>Abreviatura</label>' +
                    '       <input type=\'text\' name=\'ABREVIATURA\' class=\'form-control\' required>' +
                    '   </div>' +
                    '   <div class=\'col-12 form-group\'>' +
                    '       <label for=\'PASS\'>Contraseña</label>' +
                    '       <input type=\'text\' name=\'PASS\' class=\'form-control\' required>' +
                    '   </div>' +
                    '   <div class=\'col-12 form-group\'>' +
                    '       <input type=\'submit\' name=\'actualizar\' class=\'btn btn-primary btn-lg\' value=\'Crear Hospital\'>' +
                    '   </div>' +
                    '</div>' +
                    '</form>'
            });
        <?php
        } else if (isset($_REQUEST["editarMinimoInsumo"])) {
        ?>
            Swal.fire({
                width: '60%',
                title: 'Editar cantidad mínima insumo "<?php echo $_REQUEST["nombreInsumo"] ?>"',
                showCloseButton: true,
                allowOutsideClick: false,
                showConfirmButton: false,
                html: '<form action=\'../controller/controller.php?editarMinimoInsumo=<?php echo $_REQUEST["editarMinimoInsumo"] ?>\' method=\'POST\'>' +
                    '<div class=\'row\'>' +
                    '   <div class=\'col-12 form-group\'>' +
                    '       <label for=\'minimo\'>Cantidad Mínima</label>' +
                    '       <input type=\'number\' name=\'minimo\' min="0" class=\'form-control\' value="<?php echo $_REQUEST["cantidadInsumo"] ?>" required>' +
                    '       <input type=\'number\' name=\'mostrarSeccion\' class=\'form-control\' value="<?php echo $_REQUEST["mostrarSeccion"] ?>" style=\'display:none;\'>' +
                    '   </div>' +
                    '   <div class=\'col-12 form-group\'>' +
                    '       <input type=\'submit\' name=\'Continuar\' class=\'btn btn-primary btn-lg\' value=\'Continuar\'>' +
                    '   </div>' +
                    '</div>' +
                    '</form>'
            });
        <?php
        } else if (isset($_REQUEST["hospitalEditado"])) {
        ?>
            Swal.fire({
                icon: 'success',
                title: 'Hospital editado correctamente',
                timer: 10000,
                showCloseButton: true
            });
            mostrar('#seccionHospitales');
        <?php
        } else if (isset($_REQUEST["hospitalCreado"])) {
        ?>
            Swal.fire({
                icon: 'success',
                title: 'Hospital creado correctamente',
                timer: 10000,
                showCloseButton: true
            });
            mostrar('#seccionHospitales');
        <?php
        } else if (isset($_REQUEST["cantidadMinimaEditada"])) {
        ?>
            Swal.fire({
                icon: 'success',
                title: 'Cantidad mínima editada correctamente',
                timer: 10000,
                showCloseButton: true
            });
            mostrar('#seccionHospitales');
        <?php
        }
        ?>
    </script>
</body>

</html>