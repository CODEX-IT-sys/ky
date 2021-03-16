<?php
namespace app\common\validate;

use think\Validate;

// 系统管理员验证器
class Admin extends Validate
{
    // 验证规则
    protected $rule = [
        'name'               => ['require', 'max' => 50, 'chsAlphaNum', 'unique:Admin'],
        'password'           => ['require', 'length' => '6,30', 'alphaDash', 'confirm'],
        'email'              => ['email'],
        'phone'              => ['regex:phone'],
    ];

    // 正则规则
    protected $regex = [
        'phone' => '((?:(?:\d{0,3}-)?\d{8})|(?:\d{11}))'
    ];

    // 错误信息
    protected $message = [
        'name.unique' => '名称重复'
    ];

    // 回调方法-验证name是否必须（id不等于1时，name必须）
    public function checkNameRequire($value, $data)
    {
        return $data['id'] !== 1;
    }

    // 验证场景-更新管理员
    public function sceneUpdate()
    {
        // 场景中要验证的字段（验证规则中的所有字段）
        $fields = array_keys($this->rule);
        // 去掉password字段
        unset($fields[array_search('password', $fields)]);

        return $this->only($fields)
            ->remove('name', 'require')
            ->append('name', 'requireCallback:checkNameRequire');
    }

    // 验证场景-更新密码
    public function sceneUpdatePassword()
    {
        return $this->only(['id', 'password'])
            ->append('password', 'confirm');
    }
}