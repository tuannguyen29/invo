**Thứ 3, 19/11/2019**
## Cấu trúc (1h)
+ Phalcon không có một cấu trúc cụ thể, nên có thể tự define 1 cấu trúc theo ý mình.
+ Sử dụng mô hình MVC.
![enter image description here](https://i.ytimg.com/vi/9QjEhh0zGjg/maxresdefault.jpg)


## Luồng hoạt động (Workflow) (1h)
Workflow trong Phalcon hoạt động như sau:
User tương tác với View với sự trợ giúp của một số method/event.
    + Các method/event này được xử lý bởi Controller.
    + Controller truy cập vào Model theo các action của user.
    + Model trả ra một tập dữ liệu (1). (Model không có tương tác trực tiếp với View)
    + Controller lấy tập dữ liệu từ (1) trả về và hiển thị ra View.
Chu kỳ request và reponse cứ lặp đi lặp lại như vậy trong ứng dụng.


## Config (1h)
+ Các cấu hình cần thiết cho Phalcon đều được chứa trong folder config.
+ Ví dụ: cấu hình connect tới database, router, load các services hoặc các third-party libraries...

## Router (2h)
+ Router cho phép định nghĩa các route ánh xạ với các action controller khi nhận được request.
++ pattern: /:controller/:action/:params
ex: [http://phalcon.local/products/get/1](http://phalcon.local/products/get/1)

## Module (2h)
+ Create module admin, frontend

**Thứ 4, 20/11/2019**

## Controller (1h)
-- Các tính năng của 1 controller:
+ Controller accept các input từ view và tương tác với model liên quan.
+ Nó giúp update trạng thái của model bằng cách gửi các câu lệnh (ORM) tới model.
+ Pass data được lấy từ Model ra View.
-- > Controller hoạt động như một trung gian giữa Model và View.

## Model (1h)
+ Chứa các logic.
+ Tương tác với database bằng cách sử dụng ORM hoặc PHQL, cung cấp các CRUD và tìm kiếm cơ bản.

## View (2h)
+ Views là thông tin được trình bày ra cho end user.
+ Phalcon quy ước mỗi controller sẽ có một folder chứa các file view tương ứng với số method có trong controller.
+ Views trong phalcon về cơ bản có 2 loại: Volt (.volt) và phtml (.phtml).

Về Volt template engine.
+ Là 1 template engine viết bằng C, nhanh hơn so với các template khác.
+ Được biên dịch thành PHP thuần.

## Layouts (1.5h)
+ Sử dụng Hierarchical Rendering: là mô hình giúp chia nhỏ layout trong phalcon.
+ Dễ dàng quản lý layouts và làm dạng Multi Layouts.


## Partial (1.5h)
+ Partial template là một cách khác để quản lý các phần layout có thể sử dụng lại ở các trang khác nhau (ví dụ như footer, header, sidebar...)


**thứ 5, 21/11/2019**
## Paination (1h)
+ Paginator là một thành phần giúp tách một lượng lớn dữ liệu,
hay nói cách khác nó giúp trình bày dữ liệu theo kiểu phân trang.
+ Phalcon cung cấp các class xử lý pagination như:
    Phalcon\Paginator\Factory,
    Phalcon\Paginator\Adapter\QueryBuilder

## Library (1h)
+ Nơi chứa các Third-party libraries như (PHPMailer, ...)
+ Hoặc chứa các common, helper...
+ Link [github](https://github.com/tuannguyen29/incubator/tree/master/Library/Phalcon)

![enter image description here](https://live.staticflickr.com/65535/49098491213_77400968be_b.jpg)

## Session (2h)
+ Session là lưu trữ thông tin từ phía server-side giúp tương tác giữa user với website.
+ Mỗi session sẽ được xác định duy nhất với 1 Session ID.
+ Có 2 cách để triển khai session trong Phalcon:
    -- File: Phalcon\Session\Adapter\Files:class
    -- Database: Phalcon\Session\Adapter\Database::class
+ Setup .ini để set on/off store session vào db.
+ Lifetime mặc định là: session.gc_maxlifetime = 1440s

## end

## STORE Application

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
