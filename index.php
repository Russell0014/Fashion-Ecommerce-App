<?php

$request = $_SERVER['REQUEST_URI'];
$routes = [
    '~^/shopOpen\?id=(\d+)$~' => function ($id) {
        require __DIR__ . '/pages/shopOpen.php';
    },
    '~^/shop$~' => function () {
        require __DIR__ . '/pages/shop.php';
    },
    '~^/shop\?sort=(\w+)$~' => function ($sort) {
        require __DIR__ . '/pages/shop.php';
    },
    '~^/aboutUs$~' => function () {
        require __DIR__ . '/pages/aboutUs.php';
    },
    '~^/$~' => function () {
        require __DIR__ . '/pages/home.php';
    },
    '~^/threadOpen\?id=(\d+)$~' => function ($id) {
        require __DIR__ . '/pages/threadOpen.php';
    },
    '~^/thread$~' => function () {
        require __DIR__ . '/pages/thread.php';
    },
    '~^/thread\?sort=(\w+)$~' => function ($sort) {
        require __DIR__ . '/pages/thread.php';
    },
    '~^/thread\?search=(\w+)$~' => function ($search) {
        require __DIR__ . '/pages/thread.php';
    },
    '~^/login$~' => function () {
        require __DIR__ . '/pages/login.php';
    },
    '~^/logout$~' => function () {
        require __DIR__ . '/pages/logout.php';
    },
    '~^/profile$~' => function () {
        require __DIR__ . '/pages/profile.php';
    },
    '~^/cart$~' => function () {
        require __DIR__ . '/pages/cart.php';
    },
    '~^/thankYou$~' => function () {
        require __DIR__ . '/pages/thankYou.php';
    },
    '~^/admin$~' => function () {
        require __DIR__ . '/pages/admin.php';
    },
    '~^/news$~' => function () {
        require __DIR__ . '/pages/news.php';
    },
    // add more routes here
];

foreach ($routes as $pattern => $callback) {
    if (preg_match($pattern, $request, $matches)) {
        array_shift($matches); // remove the full match
        $callback(...$matches); // pass the captured groups to the callback
        break;
    }
}