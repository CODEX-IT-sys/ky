<?php
namespace app\login\validate;

use think\Validate;

// 系统登录验证器
class Admin extends Validate
{
    // 验证规则
    protected $rule = [
        'name'     => ['require', 'max' => 30, 'chsAlphaNum'],
        'password' => ['require', 'length' => '6,20', 'alphaDash'],
    ];
}