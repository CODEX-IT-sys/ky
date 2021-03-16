<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\facade\Route;

// 登录注销
Route::group('login', function () {
    $prefix = 'login/admin/';

    Route::get('', $prefix . 'index');
    Route::post('login', $prefix . 'login');
    Route::get('logout', $prefix . 'logout');
});

// 导航
Route::group('', function () {
    $prefix = 'admin/index/';

    Route::get('', $prefix . 'index');
    Route::get('welcome', $prefix . 'welcome');
});

// 设置全局变量规则
Route::pattern([
    'id' => '[1-9]\d*'
]);
