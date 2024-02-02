<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuizResponse extends Model
{
    use HasFactory;

    protected $table = 'quiz_responses';

    protected $fillable = ['name', 'last_name', 'email', 'score', 'incorrect_answers'];

}
