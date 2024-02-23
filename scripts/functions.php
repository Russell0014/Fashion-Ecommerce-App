<?php
require_once 'db.php';

function templateNavBar()
{
 
    if (isset($_SESSION['username'])) {
        $user = $_SESSION['username'];

        $user = '"' . $user . '"';
        $servername = "db";
        $username = "id21523447_db";
        $password = getenv('DBpassword');
        
        $conn = new PDO("mysql:host=$servername;dbname=id21523447_db", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $conn->prepare("SELECT * FROM User WHERE userName = " . $user);
        $stmt->execute();
        $results = $stmt->fetch();
        $uAdmin = $results['isAdmin'];

        $adminLink = $uAdmin == 1 ? '<a class="dropdown-item" href="/admin">Admin Page</a>' : '';
        $accountLink = '<a class="dropdown-item" href="/profile">View Account</a>';
        $logoutLink = '<a class="dropdown-item" href="/logout">Log Out</a>';
        $loginLink = '';
    } else {
        $accountLink = '';
        $logoutLink = '';
        $loginLink = '<a class="dropdown-item" href="/login">Login</a>';
        $adminLink = '';
    }

    echo <<<EOT
    <nav class="navbar navbar-expand-sm navbar-dark content-wrapper">
        <!-- Logo -->
        <a href="/"><img class="navbar-brand logo" src="../assets/images/Logo.png" alt="Brand Logo"></a>

        <!-- Links -->
        <ul class="navbar-nav mx-auto">
            <li class="nav-item">
                <a href="/" class="nav-link">Home</a>
            </li>
            <li class="nav-item">
                <a href="/shop" class="nav-link">Shop</a>
            </li>
            <li>
                <a href="/aboutUs" class="nav-link">About Us</a>
            </li>
            <li>
                <a href="/thread" class="nav-link">Discussion</a>
            </li>
            <li>
                <a href="/news" class="nav-link">News</a>
            </li>
        </ul>

        <!-- Dropdown -->
        <ul class="navbar-nav ml-auto" id="dropdownNavbar">
            <li class="nav-item">
                <a class="nav-link" href="/cart" id="navbarCart" role="button">
                    <i class="fa-solid fa-cart-shopping" style="color: #ffbf00;"></i>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarAccount" role="button" data-bs-toggle="dropdown">
                    <i class="fa-solid fa-user" style="color: #ffb400;"></i>
                </a>
                
                <div class="dropdown-menu position-absolute start-50 translate-middle-x">
                    <a class="dropdown-item" href="/cart">My Cart</a>
                    $accountLink
                    $loginLink
                    $adminLink
                    $logoutLink
                </div>
            </li>
        </ul>
    </nav>
EOT;
}

function templateFooter()
{
    echo <<<EOT
    <div class="footer">
                <div class="footer-left">
                    <p><strong>Deluxe Society</strong></p>
                    <p><a href="/">Home</a>
                    <p><a href="/shop">Shop</a>
                    <p><a href="/thread">Discussion</a>
                    <p><a href="/aboutUs">About Us</a></p>
                </div>

                <div class="footer-center">
                    <p><strong>Shopping</strong></p>
                    <p><a href="/shop">Products</a>
                    <p><a href="/shop">T-shirts</a></p>
                    <p><a href="/aboutUs">Customer Service</a>
                    <p><a href="/shop">Exclusive items</a>
                    <p><br>© 2023 Deluxe Society</p>
                </div>

                <div class="footer-right">
                    <p><strong>My Account</strong></p>
                    <p><a href="/login">Login/Sign in</a></p>
                    <p><a href="/cart">My cart</a></p>
                    <p><a href="/profile">View/Update Details</a></p>
                    <p><a href="/profile">Change Theme</a></p>
                </div>
    </div>
EOT;
}


function getCurrentUserID($conn) {
    if (isset($_SESSION['username'])) {
        $userName = $_SESSION['username'];
        $stmt = $conn->prepare("SELECT userID FROM User WHERE userName = :userName");
        $stmt->bindParam(':userName', $userName);
        $stmt->execute();
        $result = $stmt->fetch();
        return $result['userID'];
    } else {
        return null;
        exit();
    }
}

function getPostUserID($conn, $threadID) {
    try {
        $stmt = $conn->prepare("SELECT userID FROM Thread WHERE threadID = $threadID");
        $stmt->execute();
        $result = $stmt->fetch();
        return $result['userID'];
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
