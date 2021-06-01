<?php
namespace app\common\model;


use think\Model;
//每日进度
class Zanonymoucontent extends Model
{

    // 设置当前模型对应的完整数据表名称
    protected $table = 'ky_z_anonymoucontent';
    protected $dateFormat = 'Y-m-d H:i:s';
    protected $type = [
        'create_time'  =>  'timestamp',
    ];



    public function admin()
    {
        return $this->belongsTo(Admin::class,'sponsor','id');
    }



}