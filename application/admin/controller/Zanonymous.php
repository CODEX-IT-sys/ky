<?php

namespace app\admin\controller;

use app\common\controller\Common;
use app\common\model\Zanonymoucontent;
use think\Db;

use app\common\model\Zanonymou;
use think\Session;

//

class Zanonymous extends Common
{


    public function index()
    {
        $initialize=Zanonymou::all();

        foreach ($initialize as $k=>$v)
        {
            if(strtotime($v['endtime'])<time())
            {
                $v->status=2;
                $v->save();
            }
        }
        $data = \request()->param('status','2,1');
        $ft=Zanonymou::with('admin,content')->where('auth|sponsor','like','%'.session('administrator')['id'].'%')->where('status','in',$data)->all();
//        dump($ft);
        $this->assign(['ft'=>$ft,'user'=> session('administrator')['id']]);
        return $this->fetch();
    }


    public function del($id)
    {
        $zanonymou = Zanonymou::get($id,'content');
        $zanonymou ->together('content')->delete();
        if ($zanonymou) {
            return redirect('admin/zanonymous/');
        }
    }

    public function delcontent($id)
    {
        Zanonymoucontent::destroy($id);
        echo "<script>history.go(-1);</script>";
    }

//    发布帖子
    public function add()
    {

        if (request()->post()) {
            $data = \request()->param();
            $new = new Zanonymou();
            $new->title = $data['title'];
            $new->sponsor = session('administrator')['id'];
            $new->endtime = $data['endtime'];
            $new->auth = $data['auth'];
            $new->status = 1;
            $new->save();
            if ($new) {
                return redirect('admin/zanonymous/');
            }
        }

        $userall = Db::table('ky_admin')->field('id,name')->select();
        $staff = array();
        foreach ($userall as $k => $v) {
            $staff[$k]['name'] = $v['name'];
            $staff[$k]['value'] = $v['id'];

        }

        $this->assign(['staff' => $staff]);
        return $this->fetch();
    }

    public function show($id)
    {
        $zanonymou = Zanonymou::find($id);
        $content= $zanonymou->content()->where('read',0)->whereOr('user_id',session('administrator')['id'])->order('id','desc')->select();
        if(session('administrator')['job_id']==8||session('administrator')['id']==1||session('administrator')['id']==$zanonymou['sponsor'])
        {
            $content= $zanonymou->content()->order('id','desc')->select();
        }

        $this->assign(['content'=>$content,'zanonymou'=>$zanonymou,'user'=> session('administrator')['id']]);
        return $this->fetch();
    }
    public function comment()
    {
        $data = \request()->param();

        $zanonymou = Zanonymou::find($data['id']);
        if(time()>strtotime($zanonymou['endtime']))
        {
            return json(['msg'=>'已超过截止时间!无法提交','code'=>200]);
        }

        $zanonymou->content()->save(['content'=>$data['content'],'user_id'=>session('administrator')['id'],'read'=>$data['read']]);
        return json(['msg'=>'匿名提交成功','code'=>200]);

    }

}
