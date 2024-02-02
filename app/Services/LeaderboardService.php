<?php

namespace App\Services;

use App\Models\QuizResponse;

class LeaderboardService
{
    /**
     * @return mixed
     */
    public function getLeaderboard(): mixed
    {
        return QuizResponse::select('name', 'email', 'score', 'created_at', 'updated_at')
            ->selectRaw('TIMESTAMPDIFF(SECOND, created_at, updated_at) as time')
            ->orderBy('score', 'DESC')
            ->orderBy('time', 'DESC')
            ->limit(10)
            ->get();
    }
}
