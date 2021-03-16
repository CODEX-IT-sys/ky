<?php
namespace app\common\model;

use think\Db;
use think\Exception;
use think\Model;
use think\Paginator;
use think\model\concern\SoftDelete;

// 项目描述 文件库 模型
class PjProjectProfileText extends Model
{
    // 软删除
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    /**
     * 获取列表
     * @param   string            $search_type    查询类型
     * @param   string|array      $field          搜索字段
     * @param   string|array      $keyword        搜索关键词
     * @param   int               $limit          每页显示数据条数
     * @return Paginator
     * @throws \think\exception\DbException
     */
    public function getList($field = '', $keyword = '', $limit = 50)
    {
        // 查询器对象 判断管理层
        if(in_array(session('administrator')['job_id'],[1,8,9,20])){

            $query = $this->order('id desc');

        }else{
            // 否则 就只显示自己录入的数据
            $query = $this->where('Filled_by',session('administrator')['name']);
        }

        // 字段不为空
        if(!empty($field)){// 单字段查询

            $query = $query->where($field, 'like', "%$keyword%");
        }

        // 返回分页对象
        return $query->order('id desc')->paginate($limit);
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