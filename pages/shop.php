<?php
require_once(__DIR__ . '/../scripts/db.php');
require_once(__DIR__ . '/../scripts/functions.php');
if (!isset($_SESSION)) {
    session_start();
}

$sort = 'default';
if (isset($_GET['sort'])) {
    $sort = ($_GET['sort']);
} else {
}

// $imageData = null;

//         if (isset($_FILES['productImage']) && $_FILES['productImage']['error'] === UPLOAD_ERR_OK) {
//             $imageData = file_get_contents($_FILES['productImage']['tmp_name']);
//         }

try {
    $conn = new PDO("mysql:host=$servername;dbname=id21523447_db", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
try {

    if ($sort == 'low') {
        $stmt = $conn->prepare("SELECT * FROM Products ORDER BY productPrice ASC;");
        $stmt->execute();

        $result = $stmt->fetchAll();
    } elseif ($sort == 'high') {
        $stmt = $conn->prepare("SELECT * FROM Products ORDER BY productPrice DESC;");
        $stmt->execute();

        $result = $stmt->fetchAll();
    } else {
        $stmt = $conn->prepare("SELECT * FROM Products;");
        $stmt->execute();

        $result = $stmt->fetchAll();
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <link rel="icon" href="../assets/images/Logo.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/18f68d3a93.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/shop.css">
</head>

<body>
    <?= templateNavBar() ?>

    <div id="underNavBar" style="background:#061A39; color:white; padding-bottom: 10px; margin-bottom:3.5rem;">
        <h1 class="display-5 text-center">Shop</h1>
        <h2 class="lead text-center">Give your self a unique look</h2>
    </div>
    <div class="container-fluid">
        <div class="row align-items-start w-100 mx-auto">
            <div class="col-12 col-md-3 col-lg-2 text-center" style="min-width: 120px;">
                <!-- Sidebar -->
                <h3>Sort By:</h3>
                <div class="d-flex flex-column justify-content-center text-center my-3">
                    <a href="shop" class="my-2 mx-auto px-2 sortButton">Default</a>
                    <a href="shop?sort=low" class="my-2 mx-auto sortButton">Low to High</a>
                    <a href="shop?sort=high" class="my-2 mx-auto sortButton">High to low</a>
                </div>
            </div>
            <div class="col">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 gy-5 gx-5">
                    <?php foreach ($result as $row) : ?>
                        <div class="col">
                            <a href="shopOpen?id=<?php echo $row['productID'] ?>">
                                <div class="card custom-card h-100 text-center">
                                    <br>

                                    <?php
                                        if (strlen($row['productImage']) < 80) {
                                            $imagePath = ($row['productImage']);
                                        } else {
                                            $imagePath = 'data:image/jpeg;base64,' . base64_encode($row['productImage']);
                                        }
                                        ?>
                                        <img src="<?= $imagePath ?>" alt="<?= $row['productName'] ?>" class="card-img-top">
                                                      
                                    <div class="card-body d-flex flex-column align-items-center">
                                        <h5 class="card-title text-uppercase"><?= $row['productName'] ?></h5>
                                        <p class="card-text">$<?= $row['productPrice'] ?></p>
                            </a>
                        </div>
                </div>
            </div>
        <?php endforeach; ?>
        </div>
    </div>

    <!-- Footer section -->
    <?= templateFooter() ?>

    <script src="../assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>