<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AutosController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('autos', [AutosController::class,'index']);
Route::post('autos', [AutosController::class,'store']);
Route::get('autos/{auto}', [AutosController::class,'show']);
Route::put('/autos/{auto}',[AutosController::class, 'update']);
Route::delete('autos/{auto}', [AutosController::class,'destroy']);

