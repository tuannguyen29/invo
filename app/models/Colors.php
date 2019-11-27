<?php

use Phalcon\Mvc\Collection;

class Colors extends Collection
{
    public function initialize()
    {
        $this->setSource('colors');
    }

    public function getSource()
    {
        return 'colors';
    }
}
