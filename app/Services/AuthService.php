<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;

class AuthService
{
    public function login($request)
    {
        $user = User::where('email', $request->email)->first();
        if(!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found.'
            ]);
        }

        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $token = $request->user()->createToken($user->email);

            return response()->json([
                'data'    => $token->plainTextToken
            ]);
        } else{
            return response()->json([
                'success' => false,
                'message' => 'Incorrect Password'
            ]);
        }
    }

    /**
     * @param $request
     * @return JsonResponse
     */
    public function authCheck()
    {
        if (Auth::guard('sanctum')->check()) {
            return response()->json(['logged_in' => true]);
        } else {
            return response()->json(['logged_in' => false]);
        }
    }
}
