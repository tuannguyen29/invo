<?php

use Phalcon\Paginator\Adapter\Model as Paginator;

class UsersController extends ControllerBase
{
    const _PER_PAGE = 2;

    public function initialize()
    {
        $this->tag->setTitle('Admin User');

        parent::initialize();
    }

    public function indexAction()
    {
        $numberPage = $this->request->getQuery("page", "int");
        $perPage = self::_PER_PAGE;

        $users = Users::find();

        $paginator = new Paginator(
            [
                "data"  => $users,
                "limit" => $perPage,
                "page"  => $numberPage,
            ]
        );

        $this->view->users = $paginator->getPaginate();
    }

    /**
     * Edits a user based on its id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {
            $user = Users::findFirstById($id);
            $this->tag->setDefault('password', '');

            if (!$user) {
                $this->flash->error("user was not found");

                return $this->dispatcher->forward(
                    [
                        "controller" => "companies",
                        "action"     => "index",
                    ]
                );
            }

            $this->view->form = new UsersForm(
                $user,
                [
                    'edit' => true,
                ]
            );
        }
    }

    public function updateAction($id)
    {
        if (!$this->request->isPost()) {
            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        $id = $this->request->getPost("id", "int");

        $company = Users::findFirstById($id);
        var_dump($company);

        if (!$company) {
            $this->flash->error("Company does not exist");

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "index",
                ]
            );
        }

        $form = new CompaniesForm;

        $data = $this->request->getPost();
        if (!$form->isValid($data, $company)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                [
                    "controller" => "users",
                    "action"     => "new",
                ]
            );
        }

        if ($company->save() == false) {
            foreach ($company->getMessages() as $message) {
                $this->flash->error($message);
            }

            return $this->dispatcher->forward(
                [
                    "controller" => "companies",
                    "action"     => "new",
                ]
            );
        }

        $form->clear();

        $this->flash->success("Company was updated successfully");

        return $this->dispatcher->forward(
            [
                "controller" => "companies",
                "action"     => "index",
            ]
        );

    }

    public function newAction()
    {
        $form = new UsersForm();
        $this->view->form = $form;
    }

    public function storeAction()
    {
        if ($this->request->isPost()) {
            $name = $this->request->getPost('name', ['string', 'striptags']);
            $username = $this->request->getPost('username', 'alphanum');
            $email = $this->request->getPost('email', 'email');
            $password = $this->request->getPost('password');
            $repeatPassword = $this->request->getPost('repeatPassword');

            if ($password != $repeatPassword) {
                $this->flash->error('Passwords are different');

                return $this->dispatcher->forward(
                    [
                        "controller" => "users",
                        "action"     => "new",
                    ]
                );
            }

            $user = new Users();

            $user->username = $username;
            $user->password = sha1($password);
            $user->name = $name;
            $user->email = $email;
            $user->created_at = new Phalcon\Db\RawValue('now()');
            $user->active = 'Y';

            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error(
                        (string) $message
                    );
                }

                return $this->dispatcher->forward(
                    [
                        "controller" => "users",
                        "action"     => "new",
                    ]
                );
            } else {
                $this->flash->success(
                    'Thanks for sign-up, please log-in to start generating invoices'
                );

                return $this->dispatcher->forward(
                    [
                        "controller" => "users",
                        "action"     => "index",
                    ]
                );
            }
        }
    }
}
