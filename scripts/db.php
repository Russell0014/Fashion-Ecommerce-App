<?php
$envFilePath = '.env';

$envVariables = parse_ini_file($envFilePath);

// Set the environment variables
foreach ($envVariables as $key => $value) {
    putenv("$key=$value");
    $_ENV[$key] = $value;
    $_SERVER[$key] = $value;
}

$servername = "db";
$dbname = "id21523447_db";
$username = "id21523447_db";
$password = getenv('DBpassword');

?>