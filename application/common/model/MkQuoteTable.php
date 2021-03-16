<?php
namespace app\common\model;

use think\Db;
use think\Exception;
use think\Model;
use think\Paginator;
use think\model\concern\SoftDelete;

// 报价单 表格数据 模型
class MkQuoteTable extends Model
{
    // 软删除
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    /**
     * 获取列表
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\DbException
     */
    public function getList($limit = 50)
    {
        // 查询器对象
        $query = $this->order('id desc');

        // 返回分页对象
        return $query->paginate($limit);
    }

    public function getAll()
    {
        return $this->order('id asc')->select();
    }

    /**
     * 获取信息
     * @param int   $id    主键ID
     * @param array $field 要查询的字段
     * @return Model
     * @throws \think\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getOne($id, $field)
    {
        return $this->field($field)->where('id', $id)->findOrFail();
    }

}