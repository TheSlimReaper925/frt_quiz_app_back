<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Answer extends Model
{
    use HasFactory;

    protected $fillable = ['question_id', 'answer', 'is_correct'];

    /**
     * @return BelongsTo
     */
    public function Question(): BelongsTo
    {
        return $this->belongsTo(Answer::class, 'id', 'question_id');
    }
}
