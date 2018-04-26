<?php

namespace app\admin\controller;

use app\admin\controller\Base;
use think\Request;
//引入admin数据库
use app\admin\model\News as Data;
use app\admin\model\Pic;

class News extends Base
{
    //渲染主界面
    public function index()
    {
    	return $this -> view -> fetch('newsList');
    }

    //回收站界面
    public function recycle()
    {
        return $this -> view -> fetch('recycle');
    }

    //渲染编辑界面
    public function edit(Request $request)
    {
      $userid=$request -> param();
      $user=Data::get($userid);
      $this -> view -> assign('info',$user);
      //只要某些字段的值 用 field('id,name')的方式，切记必须在''里面，不用分开
      //添加角色
      $group=\app\admin\model\Group::where('status',1) -> select();
      $this-> view ->assign('group',$group);

      return $this -> view -> fetch('userEdit');
    }

    //渲染添加界面
    public function add()
    {
      //添加角色
      $cate=\app\admin\model\Cate::getCate();
      $this-> view ->assign('cate',$cate);
      $this-> view ->assign('test','test');
      return $this -> view -> fetch('newsAdd');      
    }

    //检测用户名是否可用
    public function checkUserName(Request $request)
    {
        $userName = trim($request -> param('username'));
        if (Data::get(['username'=> $userName])) {
            //如果在表中查询到该用户名
            $msg = '用户名已存在,请重新录入';
        }
        return $msg;
    }

    //渲染修改密码界面
    public function change()
    {
      return $this -> view -> fetch('changePwd');      
    }

    //上传文件
    public function upload(){
    // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('file');
    // 根目录 
    // $_SERVER['HTTP_HOST']
    // 当前控制器的路径
    // $_SERVER['PATH_INFO'] 
    // 提取图片的绝对路径
    // picPath=substr($_SERVER['PATH_INFO'],0,3); 

    // 移动到框架应用根目录/public/upload/ 目录下  上传原图
        $info = $file->move(ROOT_PATH . 'public' . DS . 'upload');
        if($info){
        
        //生成缩略图
        $thumbImg=\think\Image::open($file);
        $thumbImg->thumb(500, 500)->save(ROOT_PATH . 'public' .DS. 'upload'.DS.date('Ymd').DS.'thumb_'.$info->getFilename());
        //返回json缩略图数据
        $data=['src'=>'../../public/upload/'.date('Ymd').DS.'thumb_'.$info->getFilename(),'title'=>$info->getFilename()];

        Pic::create(['name'=>$info->getFilename(),'link'=>$info->getSaveName(),'thumb'=>date('Ymd').DS.'thumb_'.$info->getFilename()]);

        // //返回json 大图数据
        // $data=['src'=>'../../public/upload/'.$info->getSaveName(),'title'=>$info->getFilename()];
        
        $res=['code'=>0,'msg'=>'成功','data'=>$data];
        return JSON($res);
        }else{
        // 上传失败获取错误信息
            echo $file->getError();
        }
    }



    //顶置状态变更
    public function setTop(Request $request,$id)
    {

        //查询
        $res = Data::get($id);

        //顶置处理
        if($res['top'] == 1) {
            Data::update(['top'=>0],['id'=>$id]);
        } else {
            Data::update(['top'=>1],['id'=>$id]);
        }
    }

    //浏览状态变更
    public function setLook(Request $request,$id)
    {

        //查询
        $res = Data::get($id);

        //处理
        if($res['look'] == 1) {
            Data::update(['look'=>0],['id'=>$id]);
        } else {
            Data::update(['look'=>1],['id'=>$id]);
        }
    }

    //批量软删除
    public function alldel(Request $request)
    {   
        $del_id=$request -> param('id');
        //接收字符串，分为数组
        $del_arr=explode(',', $del_id);
        //直接软删除操作
        Data::destroy($del_id);      
    }

    //单个软删除
    public function del(Request $request)
    {   
        $del_id=$request -> param('id');
        //直接软删除操作
        Data::destroy($del_id);      
    }

    //单个直接删除
    public function deltrue(Request $request)
    {   
        $del_id=$request -> param('id');
        //直接软删除操作
        Data::destroy($del_id,true);      
    }

    //批量直接删除
    public function seletedeltrue(Request $request)
    {   
        $del_id=$request -> param('id');
        //接收字符串，分为数组
        $del_arr=explode(',', $del_id);
        //直接软删除操作
        Data::destroy($del_id,true);      
    }

    //清空回收站
    public function alldeltrue(Request $request)
    {   
        Data::onlyTrashed()->delete(true);      
    }

    //用户数据返回json格式列表
    public function datalist($page=1,$limit=10,$key=0)
    {   
       
        if ($key==NULL){
          $data=Data::where('delete_time','null')->where('id','>',$key) -> order('id desc') -> paginate($limit);
        }else
        {
          $data=Data::where('delete_time','null')->where('title','like',$key.'%') -> order('id desc') ->  paginate($limit); 
        }
        $page=$data->render();
        //查询数据的总数，才会有分页显示
        $count=$data->toArray()['total']; 
        
        //把多维数组分离出来，提取用 ->toArray()['data']数组
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
    }


    //用户数据返回json格式列表
    public function recycleList($page=1,$limit=10,$key=0)
    {   
       
        // $data=Data::where('id','>',1) -> field('id,username,email,mobile') -> select();
        // $data=Data::all();
        // key是查询的变量，设默认值为0
        if ($key==NULL){
          $data=Data::onlyTrashed() -> order('id desc') -> paginate($limit);   
        }else
        {
          $data=Data::onlyTrashed() -> where('title','like',$key.'%') -> order('id desc') ->  paginate($limit);  
        }
        $count=$data->toArray()['total'];
        $page=$data->render();
        
        // $data=Data::with('group')->select();
        //不用关联表，就可以任何表的数据
        // foreach ($data as $key => $value) {
        //   $value -> groupname =model('Group')->where('id',$value['group'])->field('name')->find()['name'];
        // }

        
        //把多维数组分离出来，提取用 ->toArray()['data']数组
        $list=JSON(['code'=>0,'msg'=>'','count'=>$count,'data'=>$data->toarray()['data']]);
        return $list;
    }

    //还原单个
    public function undelone($id)
    {   
          Data::update(['delete_time'=>NULL],['id'=>$id]);
    }

    //还原所有操作
    public function undelall()
    {   
        $res = Data::onlyTrashed()->field('id')->select();
        foreach ($res as $key => $value) {
          Data::update(['delete_time'=>NULL],['id'=>$value['id']]);
        }  
    }

    //批量还原
    public function undel(Request $request)
    {   
        $del_id=$request -> param('id');
        //接收字符串，分为数组
        $del_arr=explode(',', $del_id);
        //直接还原操作
        foreach ($del_arr as $key => $value) {
          Data::update(['delete_time'=>NULL],['id'=>$value]);
        }  
    }


    //保存数据
    public function save(Request $request,$id=0)
    {
        $data=$request ->param(); 
        //未初始化的空值 用empty()函数,未初始化的数据集，用isempty()函数
        if($id==0)
        {
         Data::create($data); 
        }
        else
        {
         Data::update($data,['id'=>$id]);
        }
    }

}
