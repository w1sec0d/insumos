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
                            '<div class=\'input-group\'>' +
                            '   <input type=\'password\' name=\'contrasena\' id=\'x\' class=\'form-control\' required>' +
                            '   <div class="input-group-prepend">' +
                            '       <div class="input-group-text" onclick="mostrarContrasena()" style=\'border-radius: 0 5px 5px 0\'>' +
                            '           <svg width=\'1em\' height=\'1em\' viewBox=\'0 0 16 16\' class=\'bi bi-eye-fill\' fill=\'currentColor\' xmlns=\'http://www.w3.org/2000/svg\' id=\'iconoVerContrasena\' style=\'display: block;\'><path d=\'M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z\' /><path fill-rule=\'evenodd\' d=\'M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z\'/></svg>' +
                            '           <svg width=\'1em\' height=\'1em\' viewBox=\'0 0 16 16\' class=\'bi bi-eye-slash-fill\' fill=\'currentColor\' xmlns=\'http://www.w3.org/2000/svg\' style=\'display: none;\' id=\'iconoOcultarContrasena\'><path d=\'M10.79 12.912l-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7.029 7.029 0 0 0 2.79-.588zM5.21 3.088A7.028 7.028 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474L5.21 3.089z\' /><path d=\'M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829l-2.83-2.829zm4.95.708l-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829z\' /><path fill-rule=\'evenodd\' d=\'M13.646 14.354l-12-12 .708-.708 12 12-.708.708z\' /></svg>' +
                            '       </div>' +
                            '   </div>' +
                            '</div>' +
                            '<input type=\'submit\' value=\'Continuar\' class=\'btn btn-primary\' style=\'margin-top:5px\'>' +
                            '</form>',
                        showConfirmButton: false,
                        showCloseButton: false,
                        allowOutsideClick: false
                    });
                <?php
                }
                ?>

                function mostrarContrasena() { // Se encarga de mostrar/ocultar la contraseña cambiando el input
                    const inputContrasena = document.getElementById("inputContrasena");
                    const iconoVerContrasena = document.getElementById("iconoVerContrasena");
                    const iconoOcultarContrasena = document.getElementById("iconoOcultarContrasena");

                    if (inputContrasena.type === "password") {
                        inputContrasena.type = "text";
                        iconoVerContrasena.style.display = "none";
                        iconoOcultarContrasena.style.display = "block";
                    } else {
                        inputContrasena.type = "password";
                        iconoVerContrasena.style.display = "block";
                        iconoOcultarContrasena.style.display = "none";
                    }
                }
            </script>
        </div>
    </div>
</body>

</html>