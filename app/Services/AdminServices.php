<?php

namespace App\Services;

use App\Models\Answer;
use App\Models\Question;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Collection;

class AdminServices
{
    /**
     * @return Builder[]|Collection
     */
    public function fetchQuestionWithAnswers(): Collection|array
    {
        return Question::with('AnswersVisible')->get();
    }

    public function addQuestion($requestData)
    {
        $questionId = Question::create([
            'question' => $requestData['question'],
            'type' => $requestData['questionType'],
            'correct_answer' => $requestData['questionType'] == 1 ? $requestData['correctAnswer'] : null
        ])->id;

        if ($requestData['questionType'] == 2) {
            for ($i = 1; $i < 4; $i++){
                Answer::create([
                    'question_id' => $questionId,
                    'answer' => $requestData['answer'.$i],
                    'is_correct' => $requestData['correctAnswer'] == $i
                ]);
            }
        }
    }
}
