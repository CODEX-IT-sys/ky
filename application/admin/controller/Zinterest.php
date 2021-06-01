<?php

namespace app\admin\controller;

use app\common\model\Ztitle;
use think\Controller;
use think\Request;
use think\Db;
use think\Env;
use app\common\model\Zuser;

//  兴趣2021.5.27.form zcc
class Zinterest extends Controller
{

    public function index()
    {
        return time() . date('Y-md', time());
    }

    public function user(Request $request)
    {

        $data = $request->param();
        $where = [];
        $where1 = [];
        if (isset($data['title']) && !empty($data['title'])) {
            $data['title'] = explode(',', $data['title']);
            $where1 = [
                ['id', 'in', $data['title']]
            ];
        }
        if (isset($data['name']) && !empty($data['name'])) {
            $data['name'] = explode(',', $data['name']);
            $where = [
                ['id', 'in', $data['name']]
            ];
        }

        $da = Zuser::with('title')->where($where)->select();
        $user = Zuser::all();
        $searchuser = [];
        foreach ($user as $k => $v) {
            $searchuser[$k]['name'] = $v['name'];
            $searchuser[$k]['value'] = $v['id'];
            if (isset($data['name']) && !empty($data['name'])) {
                if (in_array($v['id'], $data['name'])) {
                    $searchuser[$k]['selected'] = true;
                }
            }
        }
        $title = Ztitle::all();
        $searchtitle = [];
        foreach ($title as $k => $v) {
            $searchtitle[$k]['name'] = $v['title'];
            $searchtitle[$k]['value'] = $v['id'];
            if (isset($data['title']) && !empty($data['title'])) {
                if (in_array($v['id'], $data['title'])) {
                    $searchtitle[$k]['selected'] = true;
                }
            }
        }

        $da2 = Ztitle::with('user')->where($where1)->select();
        $this->assign(['user' => $da, 'title' => $da2, 'searchtitle' => $searchtitle, 'searchuser' => $searchuser]);

        return $this->fetch();
    }


    public function title()
    {

        return $this->fetch();
    }

    public function addtitle()
    {

        $data = \request()->post();
        $user = Zuser::find($data['id']);
        $user->title()->attach($data['title'], ['type' => $data['type']]);

        return json(['data' => $user, 'code' => 200, 'msg' => '新增成功']);

    }

    //删除人员
    public function deltitle()
    {

        $data = \request()->post();
        $user = Zuser::find($data['id']);
        $user->title()->detach($data['delid']);
        return json(['data' => $user, 'code' => 200, 'msg' => '删除成功']);
    }

    public function createtitle()
    {
        $data = \request()->post();
        $add = new  Ztitle();
        $add->save(['title' => $data['createtitle']]);
        return json(['data' => '', 'code' => 200, 'msg' => '新增成功']);
    }

    public function createuser()
    {
        $data = \request()->post();
        $add = new  Zuser();
        $add->save(['name' => $data['createuser']]);
        return json(['data' => '', 'code' => 200, 'msg' => '新增成功']);
    }

    public function delname()
    {
        $data = \request()->post();
        $user = Zuser::find($data['delname']);
        $user->delete();
        return json(['data' => '', 'code' => 200, 'msg' => '删除成功']);
    }

    public function delfile()
    {
        $data = \request()->post();
        $user = Ztitle::find($data['delfile']);
        $user->delete();
        return json(['data' => '', 'code' => 200, 'msg' => '删除成功']);
    }


}
