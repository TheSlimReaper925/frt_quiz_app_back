# FRT Quiz App

## Back-End Versions
- PHP version: 8.2.12
- Composer version: 2.6.6

## Installation
1. Clone the repository:
   git clone https://github.com/TheSlimReaper925/frt_quiz_app_back.git
   cd {to_directory}

2. Install dependencies:
   composer install

3. Copy the environment file:
   copy .env.example .env

4. Generate application key:
   php artisan key:generate

5. Configure `.env` for the correct database values:
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=frt_quiz
   DB_USERNAME=root
   DB_PASSWORD=

6. Update frontend URL:
   FRONTEND_URL=http://localhost:4200

7. Create a table and import the .sql file:
    Example using MySQL command-line
    mysql -u root -p frt_quiz < path/to/quiz_data.sql

## Front-End
- Angular CLI: 17.1.1
- Node: 20.11.0
- Package Manager: npm 8.18.0

### Installation
1. Clone the frontend repository:
   git clone https://github.com/TheSlimReaper925/frt_quiz_app_front.git
   cd {to_directory}

2. Install dependencies:
   npm install

3. Install Angular CLI globally:
   npm install -g @angular/cli

4. Check environment variables in the project and ensure the backend URL and port match.

5. Serve the application:
   ng serve

## Admin User
- Username: admin@admin.com
- Password: admin123
