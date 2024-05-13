<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DayController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ClinicController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\ClinicTimeController;
use App\Http\Controllers\LongHolidayController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('registerPage',[AuthController::class,'registerPage'])->name('auth.registerPage');
Route::post('user/register',[AuthController::class,'userRegister'])->name('register');
Route::get('loginPage',[AuthController::class,'loginPage'])->name('auth.loginPage');
Route::post('login/',[AuthController::class,'login']);
Route::middleware(['auth'])->group(function(){
    //login, register
    Route::redirect('/', 'loginPage');
    Route::get('dashboard',[AuthController::class,'dashboard'])->name('dashboard');
    Route::get('logout',[AuthController::class,'adminDestroy'])->name('admin.logout');
    Route::get('profile',[AuthController::class,'adminProfile'])->name('admin.profile');
    Route::post('/profile/store',[AuthController::class,'adminProfileStore'])->name('admin.profileStore');
    Route::get('/change/password',[AuthController::class,'adminChangePassword'])->name('admin.changePassword');
    Route::post('/update/password',[AuthController::class,'updatePassword'])->name('admin.updatePassword');
   


    });

    //Clinic auth
    Route::middleware(['auth'])->group(function(){
        
        Route::get('/clinic/list',[ClinicController::class,'clinicList'])->name('clinic.list');
        Route::post('/clinic/store',[ClinicController::class,'clinicStore'])->name('clinic.store');
        Route::post('/clinic/update',[ClinicController::class,'clinicUpdate'])->name('clinic.update');
        Route::get('/clinic/delete/{id}',[ClinicController::class,'clinicDelete'])->name('clinic.delete');
        Route::post('/clinic/day/store',[DayController::class,'clinicDayStore'])->name('clinic.day');


        });
        //Schedule
   Route::middleware(['auth'])->group(function(){
        Route::get('/post/page',[PostController::class,'postPage'])->name('post.create_page');
        Route::post('/post/create',[PostController::class,'postCreate'])->name('post.create');
        Route::get('/post/delete/{id}',[PostController::class,'postDelete'])->name('post.delete');
        Route::get('/post/edit/{id}',[PostController::class,'postEditPage'])->name('post.edit');
        Route::post('/post/update',[PostController::class,'postUpdate'])->name('post.update');   
      });
      Route::middleware(['auth'])->group(function(){
        Route::get('/comment/page/{post_id}',[CommentController::class,'commentPage'])->name('comment.page');
        Route::post('/comment/store',[CommentController::class,'commentStore'])->name('comment.store');
        Route::get('/comment/delete/{id}',[CommentController::class,'commentDelete'])->name('comment.delete');
        Route::post('/comment/update',[CommentController::class,'commentUpdate'])->name('comment.update');
        Route::get('/comment/edit/{id}',[CommentController::class,'commentEditPage'])->name('comment.edit_page');


      });
     
    

