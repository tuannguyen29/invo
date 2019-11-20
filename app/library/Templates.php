<?php

use Phalcon\Mvc\User\Component;

/**
 * Class Templates
 */
class Templates extends Component
{
    /**
     *
     * @return string
     */
    public function getTitle()
    {
        echo '<h1>Header Title</h1>';
    }
}