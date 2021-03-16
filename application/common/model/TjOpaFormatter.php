<?php
namespace app\common\model;

use think\Db;
use think\Exception;
use think\Model;
use think\Paginator;
use think\model\concern\SoftDelete;

// 排版人员综合考核 模型
class TjOpaFormatter extends Model
{
    // 设置当前模型对应的完整数据表名称
    //protected $table = 'ky_tj_opa_formatter';

    // 软删除
    //use SoftDelete;
    //protected $deleteTime = 'delete_time';
    //protected $defaultSoftDelete = 0;

    /**
     * 获取列表
     * @param   string            $s              开始时间
     * @param   string            $d              结束时间
     * @param   string|array      $field          搜索字段
     * @param   string|array      $keyword        搜索关键词
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\DbException
     */
    public function getList($s, $d, $field , $keyword , $limit = 50)
    {
        // 查询器对象
        $query = $this->order('id desc');

        // 字段不为空
        if(!empty($field)){// 单字段查询

            $query = $query->where($field, 'like', "$keyword%");
        }

        // 返回分页对象
        return $query->whereBetweenTime('Time', $s, $d)->paginate($limit);
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

    /**
     * 根据ID，获取字段值
     * @param int    $id
     * @param string $field 要查询的字段名
     * @return int|string
     * @throws ModelNotFoundException
     */
    public function getFieldById($id, $field)
    {
        $value = $this->where('id', $id)->value($field);

        if (!$value) {
            throw new ModelNotFoundException("找不到指定的{$field}字段值");
        }

        return $value;
    }

}