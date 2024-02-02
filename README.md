Back-End versions
PHP version - 8.2.12
Composer version - 2.6.6

Installation: 
git pull https://github.com/TheSlimReaper925/frt_quiz_app_back.git
cd {to_directory}
composer install
copy .env.example .env
php artisan:key generate

You should also configure .env file for correct database values. For example:
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=frt_quiz
DB_USERNAME=root
DB_PASSWORD=

also, frontend url should be changed:
FRONTEND_URL=http://localhost:4200

Front-end: 
Angular CLI: 17.1.1
Node: 20.11.0
Package Manager: npm 8.18.0

Installation:
git pull https://github.com/TheSlimReaper925/frt_quiz_app_front.git
cd {to_directory}
npm install

npm install -g @angular/cli

check environment variables in the project and make sure backend url and port matches.

ng serve

Admin user:
username: admin@admin.com
password: admin123

