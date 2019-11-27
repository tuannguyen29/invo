<?php

$config = new \Phalcon\Config([
    'database' => [
        'adapter'     => 'Mysql',
        'host'        => 'localhost',
        'username'    => 'tuannguyen',
        'password'    => 'Minhtuan@123',
        'dbname'      => 'invo',
        'charset'     => 'utf8',
    ],

    'application' => [
        'controllersDir' => 'app/controllers/',
        'modelsDir'      => 'app/models/',
        'viewsDir'       => 'app/views/',
        'pluginsDir'     => 'app/plugins/',
        'formsDir'       => 'app/forms/',
        'libraryDir'     => 'app/library/',
        'baseUri'        => '/',
    ],

    'session' => [
        'adapter'     => 'Database',
        'table'       => 'session_data',
        'maxlifetime' => '1440',
    ],

    'mongo' => [
        'username' => 'tuannguyen2',
        'password' => '123456789',
        'host'     => 'localhost',
        'dbname'   => 'mongo_color',
    ]
]);

