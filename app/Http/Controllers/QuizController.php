<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Question;
use App\Models\QuizResponse;
use App\Services\QuizServices;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class QuizController extends Controller
{

    protected QuizServices $quizServices;

    public function __construct(QuizServices $quizServices)
    {
        $this->quizServices = $quizServices;
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function getQuestions(Request $request): JsonResponse
    {
        $requestData = $request->all();
        $validator = Validator::make($requestData,[
            'Name' => 'required_without:QuizID|string',
            'LastName' => 'required_without:QuizID|string',
            'Email' => 'required_without:QuizID|string',
            'QuizSize' => 'required|numeric|in:10,15,20',
            'QuizType' => 'required|string|in:binary,multipleChoice'
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ]);
        }

        return $this->quizServices->getQuestions($requestData);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function checkAnswer(Request $request): JsonResponse
    {
        $requestData = $request->all();
        $validator = Validator::make($requestData,[
            'QuestionID' => 'required|numeric',
            'Answer' => 'required'
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ]);
        }

        return $this->quizServices->checkAnswer($requestData);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function storeResponse(Request $request): JsonResponse
    {
        $requestData = $request->all();
        $validator = Validator::make($requestData,[
            'QuizID' => 'required|numeric',
            'CorrectAnswers' => 'required|numeric',
            'InCorrectAnswers' => 'required|numeric'
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ]);
        }

        return $this->quizServices->storeResponse($requestData);
    }
}
