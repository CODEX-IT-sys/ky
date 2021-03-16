<?php
namespace app\common\model;

use think\Db;
use think\Exception;
use think\Model;
use think\Paginator;
use think\model\concern\SoftDelete;

// 系统消息提醒 模型
class XtMessages extends Model
{
    // 软删除
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    // 消息状态 获取器
    public function getStatusAttr($value)
    {
        $status = [0=>'UnRead',1=>'Read'];
        return $status[$value];
    }

    /**
     * 获取列表
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\DbException
     */
    public function getList($limit = 10)
    {

        // 查询器对象
        $query = $this->where('name',session('administrator')['name'])
            ->order('status asc')->order('id desc');

        // 返回分页对象
        return $query->paginate($limit);
    }

}