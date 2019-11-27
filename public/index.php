<?php

error_reporting(E_ALL);

use Phalcon\Mvc\Application;
use Phalcon\Config\Adapter\Ini as ConfigIni;
use Phalcon\Di\FactoryDefault;


try {

    define(
        'APP_PATH',
        realpath('..') . '/'
    );

    /**
     * Read the configuration
     */
    require APP_PATH . 'app/config/config.php';

    require_once __DIR__ . "../../vendor/autoload.php";

    /**
     * Auto-loader configuration
     */
    require APP_PATH . 'app/config/loader.php';

    $application = new Application(
        new Services($config)
    );

    /**
     * Handle routes
     */
    require APP_PATH . 'app/config/router.php';

    // NGINX - PHP-FPM already set PATH_INFO variable to handle route
    $response = $application->handle(
        !empty($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : null
    );

    $response->send();
} catch (Exception $e){
    echo $e->getMessage() . '<br>';
    echo '<pre>' . $e->getTraceAsString() . '</pre>';
}
