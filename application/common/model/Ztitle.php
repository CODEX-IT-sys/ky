<?php
namespace app\common\model;


use think\Model;
//每日进度
class Ztitle extends Model
{

    // 设置当前模型对应的完整数据表名称
    protected $table = 'ky_ztitle';

    public  function user()
    {
        return $this->belongsToMany(Zuser::class, 'zuser_ztitle','zuser_id','ztitle_id');
    }


}