Table of contents
- [Cấu trúc (1h)](#cấu-trúc-1h)
- [Luồng hoạt động (Workflow) (1h)](#luồng-hoạt-động-workflow-1h)
- [Config (1h)](#config-1h)
- [Router (2h)](#router-2h)
- [Module (2h)](#module-2h)
- [Controller (1h)](#controller-1h)
- [Model (1h)](#model-1h)
- [View (2h)](#view-2h)
- [Layouts (1.5h)](#layouts-15h)
- [Partial (1.5h)](#partial-15h)
- [Paination (1h)](#paination-1h)
- [Library (1h)](#library-1h)
- [Session (2h)](#session-2h)
- [Demo STORE Application](#demo-store-application)

**Thứ 3, 19/11/2019**
## Cấu trúc folder trong project
+ Phalcon không có một cấu trúc cụ thể, nên có thể tự define 1 cấu trúc theo ý mình.
+ Ở đây chúng ta sẽ sử dụng mô hình MVC được đề xuất bởi Phalcon.

    ![structure_folder_phalcon](https://i.imgur.com/8nlOpXu.jpg)

## Luồng hoạt động (Workflow) (1h)
Workflow trong Phalcon hoạt động như sau:

![sequence diagram phalconphp](https://i.imgur.com/lihyuzu.jpg)


## Config (1h)
+ Các cấu hình cần thiết cho Phalcon đều được chứa trong folder config.
+ Ví dụ: cấu hình connect tới database, router, load các services hoặc các third-party libraries...

- Cấu hình cho kết nổi database, sửa file `app/config/config.ini`:
    ```
    [database]
    adapter  = Mysql
    host     = localhost
    username = tuannguyen
    password = Minhtuan@123
    dbname   = invo
    charset  = utf8
    ```
- Cấu hình lưu session:

    ```
    [session]
    adapter = Database
    table   = session_data
    ```

## Router (2h)
+ Router cho phép định nghĩa các route ánh xạ với các action controller khi nhận được request, theo pattern ở bên dưới:

```
/:controller/:action/:params
```

ex: [http://phalcon.local/products/get/1](http://phalcon.local/products/get/1)

Định nghĩa một route trong `app/config/router.php`

```
$route = $router->add("/login", [
    "controller" => "auth",
    "action"     => "login",
]);
```
Lúc này thay vì truy cập `/auth/login` thì sẽ chỉ cần `/login`.

## Module (2h)
+ Dùng để chia cấu trúc thư mục thành những module nhỏ hơn ví dụ như backend, frontend.
+ Có thể dùng lệnh của `phalcon devtool` để tạo module trong project:

```
phalcon create-module module_name
```

![modules phalconphp](https://i.imgur.com/zx4tF1M.jpg)

**Thứ 4, 20/11/2019**

## Controller (1h)
-- Các tính năng của 1 controller:
+ Controller accept các input từ view và tương tác với model liên quan.
+ Nó giúp update trạng thái của model bằng cách gửi các câu lệnh (ORM) tới model.
+ Pass data được lấy từ Model ra View.
    ```
    public function indexAction()
    {
        $users = Users::find();
        $this->view->users = $users;
    }
    ```
+ Controller đóng vai trò hoạt động như một trung tâm giữa Model và View.

## Model (1h)
+ Chứa các logic.
+ Tương tác với database bằng cách sử dụng ORM hoặc PHQL, cung cấp các CRUD và tìm kiếm cơ bản.

Ví dụ lấy thông tin user by id.
+ Code ORM: 
```
Users::findFirstById($id);
```

+ Code PHQL:
```
$phql = "SELECT * FROM users WHERE users.id = :id:";
$cars = $manager->executeQuery(
    $phql,
    [
        "id" => $id
    ]
);
```

## View (2h)
+ Views là thông tin được trình bày ra cho end user.
+ Phalcon quy ước mỗi controller sẽ có một folder chứa các file view tương ứng với số method có trong controller.
+ Views trong phalcon về cơ bản có 2 loại: Volt (.volt) và phtml (.phtml).

Về Volt template engine.
+ Là 1 template engine viết bằng C, nhanh hơn so với các template khác.
+ Được biên dịch thành PHP thuần.

Để setup sử dụng `volt` template, chỉnh sửa file `app/config/services.php`.


```
$di->setShared('view', function () {
    $config = $this->getConfig();

    $view = new View();
    $view->setDI($this);
    $view->setViewsDir($config->application->viewsDir);

    $view->registerEngines([
        '.volt' => function ($view) {
            $config = $this->getConfig();

            $volt = new VoltEngine($view, $this);

            $volt->setOptions([
                'compiledPath' => $config->application->cacheDir,
                'compiledSeparator' => '_'
            ]);

            return $volt;
        },
        '.phtml' => PhpEngine::class

    ]);

    return $view;
});
```

Và set đường dẫn cho views trong file `app/config/config.ini`. 

```
[application]
...
viewsDir       = app/views/
...
```


## Layouts (1.5h)
+ Sử dụng Hierarchical Rendering: là mô hình giúp chia nhỏ layout trong phalcon.
+ Dễ dàng quản lý layouts và làm dạng Multi Layouts.

Setup layouts:
1. Tạo ControllerBase
```
use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
    protected function initialize()
    {
        $this->tag->prependTitle('STORE | ');

        $this->view->setTemplateAfter('main');
    }
}
```

2. Khi đó `IndexController` sẽ extends `ControllerBase`, rồi các controller khác cũng sẽ tương tự.

Khi truy cập trang chủ có URL `http://your-domain.com/` thì

`$this->view->setTemplateAfter('main')` sẽ giúp thứ tự render layout như sau:

    => `views/index.volt` 
    => `views/layouts/main.volt` 
    => `views/index/index.volt`


## Partial (1.5h)
+ `Partial template` là một cách khác để quản lý các phần layout có thể sử dụng lại ở các trang khác nhau (ví dụ như footer, header, sidebar...)

Cách để include một partial trong layout `views/layouts/main.volt`:
```
<div class="container">
    {{ flash.output() }}
    {{ content() }}
    <hr>
    {{ partial('partials/footer') }}
</div>
```

![partial phalcon](https://i.imgur.com/Y0JNoG0.jpg)

**thứ 5, 21/11/2019**
## Paination (1h)
+ Paginator là một thành phần giúp tách một lượng lớn dữ liệu,
hay nói cách khác nó giúp trình bày dữ liệu theo kiểu phân trang.
+ Phalcon cung cấp các class xử lý pagination như:
    ```
    use Phalcon\Paginator\Factory;
    use Phalcon\Paginator\Adapter\QueryBuilder;
    ```

## Library (1h)
+ Nơi chứa các Third-party libraries như (PHPMailer, ...)
+ Hoặc chứa các common, helper...
+ Có thể tham khảo thêm các libraries của Phalcon ở [github](https://github.com/tuannguyen29/incubator/tree/master/Library/Phalcon).

Cách để add một library vào project:
1. Tạo hoặc clone các libraries đặt vào project `app/library`, ví dụ ở dưới đây sẽ tạo  một class `Elements` để render các tabs ra view.

    ![Imgur](https://i.imgur.com/gzmOW7m.jpg)

2. Đăng kí class `Elements` vào file `app/Services.php` để bind nó vào `container service`
    ```
    protected function initElements()
    {
        return new Elements();
    }
    ```

    Hoặc 1 cách khác là chúng ta sẽ đăng kí `namespace` cho library trong `app/config/loader.php`
    ```
    $loader = new \Phalcon\Loader();

    $loader->registerNamespaces(
        [
            'Phalcon\Session\Adapter\Database' => APP_PATH . 'app/library/Phalcon/Session/Adapter/Database.php',
        ]
    );
    ```
3. Sử dụng library trong `controller`
    ```
        $element = new \Elements();
        // or
        $this->elements
    ```
    Sử dụng trong `view`

    ```
        {{ elements.getTabs() }}
    ```

## Session (2h)
+ Session là lưu trữ thông tin từ phía server-side giúp tương tác giữa user với website.
+ Mỗi session sẽ được xác định duy nhất với 1 Session ID.
+ Có 2 cách để triển khai session trong Phalcon:
    - File: Phalcon\Session\Adapter\Files:class
    - Database: Phalcon\Session\Adapter\Database::class
+ Cấu hình lưu session bằng cách chỉnh sửa `app/config.ini`

    Sửa value của `adapter` là `database` hoặc là `files`.

    ```
    [session]
    adapter = Database
    table   = session_data
    ```

+ Lifetime mặc định trong `app/config.ini` là: `1440` (s)
    ```
    [session]
    ...
    maxlifetime = 1440
    ```
+ Set một session data
    ```
    $this->session->set(
        'auth',
        [
            'id'   => $user->id,
            'name' => $user->name,
        ]
    );
    ```

## End.

**thứ 6, 22/11/2019**

## Demo STORE Application

[Phalcon][1] is a web framework delivered as a C extension providing high
performance and lower resource consumption.

This is a sample application for the Phalcon PHP Framework. We expect to
implement as many features as possible to showcase the framework and its
potential.

Please write us if you have any feedback.

Thanks.

## NOTE

The master branch will always contain the latest stable version. If you wish
to check older versions or newer ones currently under development, please
switch to the relevant branch.

## Get Started

### Requirements

* PHP >= 5.4
* [Apache][2] Web Server with [mod_rewrite][3] enabled or [Nginx][4] Web Server
* Latest stable [Phalcon Framework release][5] extension enabled
* [MySQL][6] >= 5.1.5

### Installation

First you need to clone this repository:

```
$ git clone https://github.com/tuannguyen29/invo.git
```

Then you'll need to create the database and initialize schema:

```sh
$ echo 'CREATE DATABASE invo CHARSET=utf8 COLLATE=utf8_unicode_ci' | mysql -u root
$ cat schemas/invo.sql | mysql -u root invo
```

Also you can override application config by creating `app/config/config.ini.dev` (already gitignored).
