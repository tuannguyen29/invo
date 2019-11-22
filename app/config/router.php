<?php

$router = $application->router;

// Define your routes here.
$router->add('/users/edit/{id}', [
    'controller' => 'users',
    'action'     => 'edit',
]);

$router->add('/users/create', [
    'controller' => 'users',
    'action'     => 'new',
]);

$router->handle();
