<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Question extends Model
{
    use HasFactory;

    protected $fillable = ['question', 'type', 'correct_answer'];

    /**
     * @return HasMany
     */
    public function Answer(): HasMany
    {
        return $this->hasMany(Answer::class, 'question_id', 'id');
    }
}
