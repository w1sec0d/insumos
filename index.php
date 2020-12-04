<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="./assets/libraries/jquery.js"></script>
    <link rel="stylesheet" href="./assets/libraries/bootstrap.css">
    <script src="./assets/libraries/bootstrap.js"></script>

    <script src="./assets/libraries/sweetAlert.js"></script>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lato&family=Ubuntu:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/styleLogin.css">
    <title>Insumos</title>
</head>

<body>
    <div class="container-fluid">
        <form method='POST' action='./view/insumos.php'>
            <h1 class="text-center">Inicio de sesión</h1>
            <div class="input-group">
                <label for="password">Contraseña:</label>
                <input type='password' name='password' id="inputContrasena" class='form-control' required>
                <div class="input-group-prepend">
                    <div class="input-group-text" onclick="mostrarContrasena()" style='border-radius: 0 5px 5px 0'>
                        <svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-eye-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg' id='iconoVerContrasena' style='display: block;'>
                            <path d='M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z' />
                            <path fill-rule='evenodd' d='M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z' /></svg>
                        <svg width='1em' height='1em' viewBox='0 0 16 16' class='bi bi-eye-slash-fill' fill='currentColor' xmlns='http://www.w3.org/2000/svg' style='display: none;' id='iconoOcultarContrasena'>
                            <path d='M10.79 12.912l-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7.029 7.029 0 0 0 2.79-.588zM5.21 3.088A7.028 7.028 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474L5.21 3.089z' />
                            <path d='M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829l-2.83-2.829zm4.95.708l-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829z' />
                            <path fill-rule='evenodd' d='M13.646 14.354l-12-12 .708-.708 12 12-.708.708z' /></svg>
                    </div>
                </div>
            </div>
            <input type='submit' value='Continuar' class='btn btn-primary'>
        </form>
        <script>
            <?php
            if (isset($_REQUEST["sesionCaducada"])) {
            ?>
                Swal.fire({
                    icon: 'warning',
                    title: 'Tu sesión ha caducado',
                    showConfirmButton: false,
                    html: '<p>Porfavor, ingresa tu contraseña de nuevo</p>' +
                        '<a href=\'index.php\' class=\'btn btn-primary\'>' +
                        'Continuar' +
                        '</a>'
                });
            <?php
            } else if (isset($_REQUEST["error"])) {
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
            } else if (isset($_REQUEST["sesionCerrada"])) {
            ?>
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })

                Toast.fire({
                    icon: 'success',
                    title: 'Has cerrado sesión con éxito'
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

</body>

</html>