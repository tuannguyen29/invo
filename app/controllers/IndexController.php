<?php

use MongoDB\Client;
use MongoDB\BSON\ObjectId;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Welcome');

        parent::initialize();
    }

    public function indexAction()
    {
        try {

            $collection = (new MongoDB\Client)->mongo_color->users;

            $document = $collection->findOne(['_id' => new ObjectId('5dddf77640730000ed00115e')]);

            var_dump($document);
            exit;

        } catch (\Exception $e) {
            print_r($e->getMessage());exit;
        }

        if (!$this->request->isPost()) {
            $this->flash->notice(
                'This is a sample application of the Phalcon Framework.
                Please don\'t provide us any personal information. Thanks'
            );
        }
    }
}
