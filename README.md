# About this app

This repo consists of files used for the implementation of a simple login and registration system for a web and mobile web apps for project one of the CPEN 412 course. The web app's files are all the files in this immediate branch excluding the "Mobile" dirctory, which, as it sounds, houses the files used in the implementation of the mobile app. The applications use a custom API scripted in php to access a Postgresql database hosted on AWS RDS and the [web application hosted using AWS Beanstalk](http://projectone-env.eba-zrhsxtme.eu-west-2.elasticbeanstalk.com/). The mobile application, scripted in flutter, was deployed as an android apk file which can be located in the `Mobile\build\app\outputs\ap\release\app-armeabi-v7a-release.apk`.

## API Guide
The api's implemented can be found at the `routes\api.php`. The application simply registers and logs a user in thus the functions involved are simple
- Create
- Read
- Update
- Delete
- Authenticate
- Logout
 api's using JSON.
 
 ### Create user
 To create a new user, use the **POST** method alongside the following http request
 ```
 Projectone-env.eba-zrhsxtme.eu-west-2.elasticbeanstalk.com/api/users
 ```
 The body of the request ought to have the following key-value pairs
 - name
 - email
 - phone
 - password
 
 ### Read user detail
 To fetch all user details, use the **GET** method to submit the same http request as the create user request.
 
 To *fetch a specific user*, provided you know their id, use the **GET** method as well as
 ```
 Projectone-env.eba-zrhsxtme.eu-west-2.elasticbeanstalk.com/api/users/{id}
 ```
 
 ### Update user detail
 Use the **PUT** method with the request for a specific user with the request body containing the updates for the aforementioned key-value pairs.
 
 ### Delete user
 Use the **DELETE** method with the request for a specific user without any body to delete a user
 
 ### Authenticating a user
 Laravel provides authentication features right out the box with its routes protected under layers of Middlewares. But custom auth functions are allowed and can be accessed using th **POST** method with request
 ```
  Projectone-env.eba-zrhsxtme.eu-west-2.elasticbeanstalk.com/api/authenticate
 ```
The request body needs to supply the request with
- name
- email

### Logging a user out
To log a user out, use the **POST** method with request
```
 Projectone-env.eba-zrhsxtme.eu-west-2.elasticbeanstalk.com/api/logout
```
to use Laravel's `Auth::Logout()` function to terminate a user's session.


## And now ... a word from our sponsor


<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 1500 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel/)**
- **[OP.GG](https://op.gg)**
- **[WebReinvent](https://webreinvent.com/?utm_source=laravel&utm_medium=github&utm_campaign=patreon-sponsors)**
- **[Lendio](https://lendio.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
