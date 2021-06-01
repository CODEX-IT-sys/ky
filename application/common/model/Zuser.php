<?php
namespace app\common\model;


use think\Model;
//每日进度
class Zuser extends Model
{

    // 设置当前模型对应的完整数据表名称
    protected $table = 'ky_zuser';

    public function title()
    {
        return $this->belongsToMany(Ztitle::class, 'zuser_ztitle','ztitle_id','zuser_id');
    }

     public  function username()
    {
        return $this->hasMany(Ztitleuser::class,'zuser_id','id');
    }

}