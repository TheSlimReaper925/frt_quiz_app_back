<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\LeaderboardController;
use App\Http\Controllers\QuizController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:sanctum'])->prefix('admin')->group(function () {
    Route::post('add-question', [AdminController::class, 'addQuestion']);
    Route::get('get-questions', [AdminController::class, 'getQuestions']);
    Route::get('quiz-responses', [AdminController::class, 'getQuizResponses']);
});

Route::prefix('quiz')->group(function () {
    Route::post('get-questions', [QuizController::class, 'getQuestions']);
    Route::post('store-response', [QuizController::class, 'storeResponse']);
    Route::post('check-answer', [QuizController::class, 'checkAnswer']);
    Route::get('leaderboard', [LeaderboardController::class, 'getLeaderboard']);
});

//authorization
Route::post('login', [AuthController::class, 'login']);
Route::get('auth-check', [AuthController::class, 'authCheck']);
