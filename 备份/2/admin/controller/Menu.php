<?php

namespace app\admin\controller;


use app\admin\controller\Base;
use think\Request;

//引入admin数据库
use app\admin\model\Menu as Data;

class Menu extends Base
{
    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
       $this->view->engine->layout('/layout');
       return $this -> view -> fetch('menu');
    }

    //用户数据返回json格式列表
    public function datalist($page=1,$limit=10)
    {   
       
        //所有数据
        // $data=Data::all();
        //查询 $limit条数据 并 分页$page  $key 是查询键值
        $data=Data::where('id','>',0) -> paginate($limit); 
        $page=$data->render();
        $count=Data::count();
        //将数据格式为树数据
        $tree=Data::tree($data->toarray()['data']);
        //转换为json数据输出
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$tree]);
        return $list;
    }


    //状态变更
    public function setStatus(Request $request)
    {
        //获取当前的班级ID
        $id = $request -> param('id');

        //查询
        $res = Data::get($id);

        //启用和禁用处理
        if($res['status'] == 1) {
            Data::update(['status'=>0],['id'=>$id]);
        } else {
            Data::update(['status'=>1],['id'=>$id]);
        }
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function save(Request $request)
    {
        //
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}
