<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="./assets/libraries/jquery.js"></script>
    <link rel="stylesheet" href="./assets/libraries/bootstrap.css">
    <script src="./assets/libraries/bootstrap.js"></script>

    <script src="./assets/libraries/sweetAlert.js"></script>

    <title>Insumos</title>
</head>

<body>
    <div class="container-fluid">
        <div class="row align-items-center justify-content-center" style="height: 100vh;">
            <script>
                <?php
                if (isset($_REQUEST["error"])) {
                ?>
                    Swal.fire({
                        icon: 'error',
                        title: 'Has ingresado una contraseña incorrecta',
                        text: 'Por favor, inténtalo de nuevo',
                        footer: 'Si necesitas ayuda, escríbe un correo a: cadavid4003@gmail.com',
                        showConfirmButton: false,
                        html: '<a href=\'index.php\' class=\'btn btn-primary\'>' +
                            'Continuar' +
                            '</a>'
                    });
                <?php
                } else {
                ?>
                    Swal.fire({
                        title: 'Ingresa tu contraseña porfavor',
                        html: '<form method=\'POST\' action=\'./view/insumos.php\'>' +
                            '<input type=\'password\' name=\'contrasena\' class=\'form-control\' required>' +
                            '<br>' +
                            '<input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\'>' +
                            '</form>',
                        showConfirmButton: false,
                        showCloseButton: false,
                        allowOutsideClick: false
                    });
                <?php
                }
                ?>
            </script>
        </div>
    </div>
</body>

</html>