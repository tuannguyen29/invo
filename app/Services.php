<?php

// use Phalcon\Mvc\Collection\Manager;
// use Phalcon\Db\Adapter\MongoDB\Client;

use Phalcon\DI\FactoryDefault;
use Phalcon\Events\Manager as EventsManager;
use Phalcon\Flash\Session as FlashSession;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Model\Metadata\Memory as MetaData;
use Phalcon\Mvc\Router;
use Phalcon\Mvc\Url as UrlProvider;
use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt as VoltEngine;
use Phalcon\Session\Adapter\Database;
use Phalcon\Session\Adapter\Files as SessionAdapter;

class Services extends \Base\Services
{
    /**
     * We register the events manager
     */
    protected function initDispatcher()
    {
        $eventsManager = new EventsManager;

        /**
         * Check if the user is allowed to access certain action using the SecurityPlugin
         */
        $eventsManager->attach('dispatch:beforeExecuteRoute', new SecurityPlugin);

        /**
         * Handle exceptions and not-found exceptions using NotFoundPlugin
         */
        $eventsManager->attach('dispatch:beforeException', new NotFoundPlugin);

        $dispatcher = new Dispatcher;
        $dispatcher->setEventsManager($eventsManager);

        return $dispatcher;
    }

    /**
     * The URL component is used to generate all kind of urls in the application
     */
    protected function initUrl()
    {
        $url = new UrlProvider();
        $url->setBaseUri($this->get('config')->application->baseUri);
        return $url;
    }

    protected function initView()
    {
        $view = new View();

        $view->setViewsDir(APP_PATH . $this->get('config')->application->viewsDir);

        $view->registerEngines([
            ".volt" => 'volt'
        ]);

        return $view;
    }

    /**
     * Setting up volt
     */
    protected function initSharedVolt($view, $di)
    {
        $volt = new VoltEngine($view, $di);

        $volt->setOptions([
            "compiledPath" => APP_PATH . "cache/volt/"
        ]);

        $compiler = $volt->getCompiler();
        $compiler->addFunction('is_a', 'is_a');

        return $volt;
    }

    /**
     * Database connection is created based in the parameters defined in the configuration file
     */
    protected function initSharedDb()
    {
        $config = $this->get('config')->get('database')->toArray();

        $dbClass = 'Phalcon\Db\Adapter\Pdo\\' . $config['adapter'];
        unset($config['adapter']);

        return new $dbClass($config);
    }

    protected function initSharedCollectionManager()
    {
        return new \MongoDB\Client();
    }

    /**
     * If the configuration specify the use of metadata adapter use it or use memory otherwise
     */
    protected function initModelsMetadata()
    {
        return new MetaData();
    }

    /**
     * Start the session the first time some component request the session service
     */
    protected function initSession()
    {
        $adapter = $this->get('config')->session->adapter ?? 'Files';

        switch (strtolower($adapter)) {
            case 'database':
                $connection = $this->initSharedDb();
                $table = $this->get('config')->session->table ?? 'session_data';
                $maxlifetime = (int) $this->get('config')->session->maxlifetime ?? ini_get('session.gc_maxlifetime');

                $session = new Database(
                    [
                        'db'          => $connection,
                        'table'       => $table,
                        'maxlifetime' => $maxlifetime
                    ]
                );

                $session->start();

                return $session;

            default:
                $session = new SessionAdapter();
                $session->start();

                return $session;
        }
    }

    /**
     * Handle routes.
     *
     * @return object
     */
    protected function initSharedRouter()
    {
        $router = new Router();
        $router->setUriSource(
            Router::URI_SOURCE_SERVER_REQUEST_URI
        );

        return $router;
    }

    /**
     * Register the flash service with custom CSS classes
     */
    protected function initFlash()
    {
        return new FlashSession([
            'error'   => 'alert alert-danger',
            'success' => 'alert alert-success',
            'notice'  => 'alert alert-info',
            'warning' => 'alert alert-warning'
        ]);
    }

    /**
     * Register a user component
     */
    protected function initElements()
    {
        return new Elements();
    }

    protected function initTemplates()
    {
        return new Templates();
    }
}
