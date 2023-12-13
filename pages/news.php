<?php
require_once(__DIR__ . '/../scripts/db.php');
require_once(__DIR__ . '/../scripts/functions.php');
require_once(__DIR__ . '/../scripts/verifyUsers.php');

$apiKey = "ee4bfe68aaa34a8aaf6e439622b58ffb";
$language = "en";
$query = "fashion";
$pageSize = 2;
$sortBy = "relevancy";

$maxPage = 50;
$randomPage = rand(1, $maxPage);

$url = "https://newsapi.org/v2/everything?apiKey=$apiKey&language=$language&q=$query&pageSize=$pageSize&sortBy=$sortBy&page=$randomPage";

$ch = curl_init();
$config['useragent'] = 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:17.0) Gecko/20100101 Firefox/17.0';
curl_setopt($ch, CURLOPT_USERAGENT, $config['useragent']);
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$output = curl_exec($ch);

$result = json_decode($output, true);

if (curl_getinfo($ch, CURLINFO_HTTP_CODE) !== 200) {

    var_dump($output);
}

curl_close($ch);

$rand = $result['articles'][\array_rand($result['articles'])];


$f_title = $rand['title'];
$f_desc = $rand['description'];
$f_link = $rand['url'];

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News</title>
    <link rel="icon" href="../assets/images/Logo.png" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/18f68d3a93.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/thread.css">

</head>

<body>
    <?= templateNavBar() ?>

    <div id="underNavBar" style="background:#061A39; color:white; padding-bottom: 10px; margin-bottom:3.5rem;">
        <h1 class="display-5 text-center">News</h1>
        <h2 class="lead text-center">Stay Stylish with the Latest Fashion Trends and Headlines</h2>
    </div>
    <br>

    <div style="min-height: 45vh;">
    <div class="fact-box card" style="padding:20px;margin-bottom:10px;">
        <h6 class="text-title"><?= $f_title ?></h6>
        <p class="text-body"><?= $f_desc ?></p>
        <a target="_blank" class="" href="<?= $f_link ?>">Read more here</a>
    </div> 


    <div class="text-center" style="padding:20px;margin:10px;">
        <a style="margin:5px;"class="btn btn-warning" href="thread">Talk about it in our Discussion Forum!</a>
        <a style="margin:5px;"class="btn btn-danger" href="news">Get a new news topic</a>
    </div> 
    </div>
    
    <?= templateFooter() ?>

    <script src="../assets/js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>