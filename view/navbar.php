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
                <button class="nav-link btn btn-light" style="font-weight:bold; margin-right:5px" onclick="mostrar('#seccionHospitales')">
                    <i class="fas fa-hospital"></i> Gestión de hospitales
                </button>
            </li>
            <li class="nav-item">
                <button class="nav-link btn btn-light" style="font-weight:bold; margin-right:5px" onclick="mostrar('#seccionHospitales')">
                    <i class="fas fa-dolly"></i> Gestión de Insumos
                </button>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-primary" href="../controller/controller.php?cerrarSesion=true" style="color: white; font-weight:bold">
                    <i class="fas fa-sign-in-alt" aria-hidden="true"></i> Cerrar sesión
                </a>
            </li>
        </ul>
    </div>
</nav>