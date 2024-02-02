<?php

namespace App\Services;

use App\Models\Answer;
use App\Models\Question;
use App\Models\QuizResponse;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;

class QuizServices
{
    /**
     * @param $requestData
     * @return JsonResponse
     */
    public function checkAnswer($requestData): JsonResponse
    {
        $question = Question::where('id', $requestData['QuestionID'])->first();

        if ($question->type == 'binary') {
            return response()->json([
                'success' => true,
                'data' => [
                    'is_correct' => $question->correct_answer == $requestData['Answer']
                ]
            ]);
        } else if ($question->type == 'multipleChoice'){
            $answer = Answer::select('id', 'is_correct')
                ->where('id', $requestData['Answer'])
                ->first();
            return response()->json([
                'success' => true,
                'data' => [
                    'is_correct' => $answer->is_correct
                ]
            ]);
        }

        return response()->json([
            'success' => true,
            'message' => "Cant find answer"
        ]);
    }

    /**
     * @param $requestData
     * @return JsonResponse
     */
    public function storeResponse($requestData): JsonResponse
    {
        $response = QuizResponse::where('id', $requestData['QuizID'])->first();

        if ($response)
        {
            $response->score = $requestData['CorrectAnswers'];
            $response->incorrect_answers = $requestData['InCorrectAnswers'];
            $response->updated_at = Carbon::now();
            $response->save();
        }

        return response()->json([
            'success' => true,
            'data' => $response
        ]);
    }

    /**
     * @param $requestData
     * @return JsonResponse
     */
    public function getQuestions($requestData): JsonResponse
    {
        $questions = Question::select('questions.id', 'question', 'type')
            ->where('type', $requestData['QuizType'])
            ->inRandomOrder()
            ->limit($requestData['QuizSize']);

        if ($requestData['QuizType'] == 'multipleChoice') {
            $questions = $questions->with('Answers');
        }

        if (isset($requestData['QuizID'])) {
            QuizResponse::where('id', $requestData['QuizID'])
                ->update([
                    'created_at' => Carbon::now()
                ]);
        } else {
            $quizId = QuizResponse::create([
                'name' => $requestData['Name'],
                'last_name' => $requestData['LastName'],
                'email' => $requestData['Email'],
                'score' => 0,
                'incorrect_answers' => 0,
            ])->id;
        }


        return response()->json([
            'success' => true,
            'data' => [
                'quiz_id' => $requestData['QuizID'] ?? $quizId,
                'questions' => $questions->get()
            ]
        ]);
    }
}
