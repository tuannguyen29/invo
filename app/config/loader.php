<?php

$loader = new \Phalcon\Loader();

$loader->registerNamespaces(
    [
        'Phalcon\Session\Adapter\Database' => APP_PATH . 'app/library/Phalcon/Session/Adapter/Database.php',
        'Phalcon\Db\Adapter\Mongo'         => APP_PATH . 'app/library/Phalcon/Db/Adapter/Mongo',
        'Phalcon\Db\Adapter\MongoDB'       => APP_PATH . 'app/library/Phalcon/Db/Adapter/MongoDB',
    ]
);

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerDirs([
    APP_PATH . $config->application->controllersDir,
    APP_PATH . $config->application->pluginsDir,
    APP_PATH . $config->application->libraryDir,
    APP_PATH . $config->application->modelsDir,
    APP_PATH . $config->application->formsDir,
])->register();

$loader->registerClasses(
    [
        'Services' => APP_PATH . 'app/Services.php',
    ]
);
