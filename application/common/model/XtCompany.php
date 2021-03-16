<?php
namespace app\common\model;

use think\Db;
use think\Exception;
use think\Model;
use think\Paginator;
use think\model\concern\SoftDelete;

// 主体公司 模型
class XtCompany extends Model
{
    // 软删除
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    /**
     * 获取列表
     * @param   string|array      $field          搜索字段
     * @param   string|array      $keyword        搜索关键词
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\DbException
     */
    public function getList($field, $keyword, $limit = 50)
    {
        // 查询器对象
        $query = $this->order('id desc');

        // 字段不为空
        if(!empty($field)){// 单字段查询

            $query = $query->where($field, 'like', "$keyword%");
        }

        // 返回分页对象
        return $query->paginate($limit);
    }

}