<?php

namespace App\Http\Controllers;

use App\Models\QuizResponse;
use App\Services\LeaderboardService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class LeaderboardController extends Controller
{

    protected LeaderboardService $leaderboardService;

    public function __construct(LeaderboardService $leaderboardService)
    {
        $this->leaderboardService = $leaderboardService;
    }

    /**
     * @return JsonResponse
     */
    public function getLeaderboard(): JsonResponse
    {
        return response()->json([
           'success' => true,
           'data' => $this->leaderboardService->getLeaderboard()
        ]);
    }
}
