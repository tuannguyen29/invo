# INVO Application

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
$ git clone git@github.com:phalcon/invo.git
```

Then you'll need to create the database and initialize schema:

```sh
$ echo 'CREATE DATABASE invo CHARSET=utf8 COLLATE=utf8_unicode_ci' | mysql -u root
$ cat schemas/invo.sql | mysql -u root invo
```

Also you can override application config by creating `app/config/config.ini.dev` (already gitignored).
