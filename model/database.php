<?php
$connection = mysqli_connect('localhost', 'root', '', 'INSUMOS');
if ($connection->connect_error) {
    die($connection->connect_errno);
}
