<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
function verify() {

    if (isset($_SESSION['username'])) {
        $currentUsername = $_SESSION['username'];
    } else {
        return null; 
    }

    $customSalt = 10;

    $expectedCookieValue = hash('sha256', $currentUsername . $customSalt);

    if ($currentUsername && isset($_COOKIE['UID'])) {
        if ($_COOKIE['UID'] === $expectedCookieValue) {
            echo 'User is authenticated.';
            header("Location: /");
        } else {
            echo 'User is not authenticated.';
            header("Location: login");
        }
    } else {
        echo 'User is not authenticated.';
        header("Location: login");
    }
}

function logout() {

        session_unset();
        session_destroy();

        if (isset($_COOKIE['UID'])) {
            setcookie('UID', '', time() - 3600, '/'); 
        }

        header("Location: login");
        exit();
}

function getUsername() {
    if (isset($_SESSION['username'])) {
        return $_SESSION['username'];
    } else {
        header("Location: login");
        exit();
    }
}
?>
