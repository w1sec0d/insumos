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

    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

    <!-- Carga FontAwesome-->
    <script src="https://kit.fontawesome.com/482fb72b25.js" crossorigin="anonymous"></script>

    <script src="../assets/libraries/jquery.fittext.js"></script>

    <link rel="shortcut icon" href="../assets/other/logo.ico" type="image/x-icon">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" /> <!-- select 2-->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

    <title>Gestión de insumos JDR</title>
</head>

<body class="container-fluid">
    <?php require_once 'navbar.php'; ?>

    <div class="row containerCabecera align-items-center justify-content-center" style="height:initial;">
        <div class="col align-items-center justify-content-center" id="cabecera">
            <div class="col-12 align-items-center justify-content-center">
                <h1 class="text-center" id="titulo-centro"><i class="fas fa-user-shield"></i> Sección Administrador</h1>
                <br>
            </div>
            <div class="col-12">
                <h3>Filtrar por hospital</h3>
                <select id="selectHospitales" onchange="filtroHospital()">
                    <?php
                    $queryCentros = "SELECT * FROM CENTRO";
                    $resultadoCentros = mysqli_query($connection, $queryCentros);
                    ?>
                    <option value="0">--HAS CLICK AQUÍ PARA SELECCIONAR UN HOSPITAL--</option>
                    <?php
                    while ($arrayCentros = mysqli_fetch_array($resultadoCentros)) {
                    ?>
                        <option value="<?php echo $arrayCentros['ID'] ?>"><?php echo $arrayCentros["NOMBRE"] ?></option>
                    <?php
                    }
                    ?>
                </select>
            </div>
            <div class="btn-group" role="group" style="margin-top: 5vh;">
                <a onclick="mostrar('#seccionGeneral')"><button type="button" class="btn btn-secondary" style="border-radius: 0.25rem 0.25rem 0.25rem 0.25rem;">Reporte General</button></a>
            </div>
        </div>
    </div>

    <div class="row seccion align-items-center justify-content-center">
        <?php
        $queryCentros = "SELECT * FROM CENTRO";
        $resultadoCentros = mysqli_query($connection, $queryCentros);
        while ($arrayCentros = mysqli_fetch_array($resultadoCentros)) {
        ?>
            <div id="seccion<?php echo $arrayCentros["ID"] ?>">
                <table class="table table1 table-striped" id="tabla<?php echo $arrayCentros["ID"] ?>">
                    <h2 class="titulo-seccion w-100"><i class="fas fa-dolly-flatbed"></i> Inventario <?php echo $arrayCentros["ABREVIATURA"] ?></h2>
                    <thead>
                        <tr>
                            <th>Insumo</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $idCentro = $arrayCentros["ID"];
                        $selectInsumos = "SELECT * FROM VISTA_INSUMOS WHERE ID_CENTRO = '$idCentro'";
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
                <?php
                $id = $arrayCentros["ID"];
                $queryNombreInsumo = "SELECT * FROM VISTA_TRANSACCION WHERE ID_CENTRO = '$id'";
                $resultadoQueryInsumo = mysqli_query($connection, $queryNombreInsumo);
                ?>
                <table class="table table2 table-striped" id="tablaTransacciones<?php echo $arrayCentros["ID"] ?>">
                    <h2 class="titulo-seccion w-100" style="margin-top: 40px;"><b><i class="fas fa-exchange-alt"></i> Movimientos de insumos</b></h2>
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
                        while ($array = $resultadoQueryInsumo->fetch_assoc()) {
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
        <?php
        }
        ?>
        <div id="seccionGeneral">
            <table class="table table1 table-striped" id="tablaInventarioGeneral">
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
            <?php
            $queryNombreInsumo = "SELECT * FROM VISTA_TRANSACCION";
            $resultadoQueryInsumo = mysqli_query($connection, $queryNombreInsumo);
            ?>
            <table class="table table2 table-striped" id="tablaTransaccionesGeneral">
                <h2 class="titulo-seccion w-100" style="margin-top: 40px;"><b><i class="fas fa-exchange-alt"></i> Movimientos de insumos</b></h2>
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
        <div id="seccionHospitales">
            <table class="table table3 table-striped" id="tablaHospitales">
                <h2 class="titulo-seccion w-100"><i class="fas fa-hospital"></i> Gestión Hospitales</h2>
                <thead class="thead-dark">
                    <tr>
                        <th>Nombre</th>
                        <th>Abreviatura</th>
                        <th>Contraseña</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $selectCentro = "SELECT * FROM CENTRO";
                    $resultadoSelectCentro = mysqli_query($connection, $selectCentro);

                    while ($arraySelectCentro = mysqli_fetch_array($resultadoSelectCentro)) {
                    ?>
                        <tr>
                            <td><?php echo $arraySelectCentro["NOMBRE"] ?></td>
                            <td><?php echo $arraySelectCentro["ABREVIATURA"] ?></td>
                            <td><?php echo $arraySelectCentro["PASS"] ?></td>
                            <td>
                                <div class="btn btn-primary">
                                    <a href="admin.php?editarHospital=<?php echo $arraySelectCentro['ID'] ?>&NOMBRE=<?php echo $arraySelectCentro['NOMBRE'] ?>&ABREVIATURA=<?php echo $arraySelectCentro['ABREVIATURA'] ?>&PASS=<?php echo $arraySelectCentro['PASS'] ?>" class="boton-editar" style="border-radius:5px">
                                        <span style="color: White;">
                                            <i class="fas fa-edit fa-fw"></i> Editar
                                        </span>
                                    </a>
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

        window.onload = function() {
            <?php
            $queryCentros = "SELECT * FROM CENTRO";
            $resultadoCentros = mysqli_query($connection, $queryCentros);
            while ($arrayCentros = mysqli_fetch_array($resultadoCentros)) {
            ?>
                $('#seccion<?php echo $arrayCentros["ID"] ?>').hide();
            <?php
            }
            ?>
            $('#seccionHospitales').hide();
            $('#selectHospitales').select2({
                language: "es",
                width: '80%'
            });
            <?php
            if (isset($_REQUEST["crearCentro"]) or isset($_REQUEST["hospitalCreado"])) {
            ?>
                mostrar('#seccionHospitales');
            <?php
            }
            ?>
        }

        function mostrar(elemento) {
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
            $([document.documentElement, document.body]).animate({
                scrollTop: $(elemento).offset().top
            }, 1200);
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
        }
        ?>
    </script>
</body>

</html>