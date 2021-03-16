<?php
namespace app\common\model;

use think\Model;

class TempExcel extends Model
{
    // 关闭自动写入更新时间
    protected $updateTime = false;

    /**
     * 获取临时Excel记录的信息
     * @param int   $id
     * @param array $field
     * @return Model
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getOne($id, $field)
    {
        return $this->where('id', $id)->field($field)->findOrFail();
    }
}