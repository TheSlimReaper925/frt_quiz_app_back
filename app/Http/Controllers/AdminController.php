<?php

namespace App\Http\Controllers;

use App\Models\Answer;
use App\Models\Question;
use App\Models\QuizResponse;
use App\Services\AdminServices;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    protected AdminServices $adminService;

    /**
     * @param AdminServices $adminService
     */
    public function __construct(AdminServices $adminService)
    {
        $this->adminService = $adminService;
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function getQuestions(Request $request): JsonResponse
    {
        $requestData = $request->all();

        $validator = Validator::make($requestData,[
            'questionTypes' => 'string|in:1,2',
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ]);
        }

        return response()->json([
            'success' => true,
            'data' => $this->adminService->fetchQuestionWithAnswers()
        ]);
    }

    /**
     * @param Request $request
     * @return JsonResponse
     */
    public function addQuestion(Request $request): JsonResponse
    {
        $requestData = $request->all();
        $validator = Validator::make($requestData,[
            'question' => 'required|string',
            'questionType' => 'required|numeric|in:1,2',
            'answer1' => 'required_if:question_type,2|string',
            'answer2' => 'required_if:question_type,2|string',
            'answer3' => 'required_if:question_type,2|string',
            'correctAnswer' => 'required|integer|in:0,1,2,3',
        ]);

        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->first()
            ]);
        }

        $this->adminService->addQuestion($requestData);

        return response()->json([
            'success' => true,
            'message' => 'Question was added successfully!'
        ]);
    }

    /**
     * @return JsonResponse
     */
    public function getQuizResponses()
    {
        return response()->json([
            'success' => true,
            'data' => QuizResponse::orderBy('updated_at', 'DESC')->get()
        ]);
    }
}
