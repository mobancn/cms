layui.use(['form','layer','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laytpl = layui.laytpl,
        table = layui.table;

    //用户列表
    var tableIns = table.render({
        elem: '#userList',
        url : 'group/datalist',
        cellMinWidth : 95,
        page : true,
        height : "full-200",
        limits : [10,15,20,25],
        limit : 10,
        id : "userListTable",
        jump: function(obj, first){
        //obj包含了当前分页的所有参数，比如：
        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
        console.log(obj.limit); //得到每页显示的条数
        },
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'username', title: '用户名', minWidth:100, align:'center',sort:true},
            {field: 'email', title: '用户邮箱', minWidth:200, align:'center',templet:function(d){
                return '<a class="layui-blue" href="mailto:'+d.email+'">'+d.email+'</a>';
            }},
            {field: 'mobile', title: '手机', align:'center'},
            {field: 'group', title: '用户等级', align:'center'},
            {field: 'update_time', title: '最后登录时间', align:'center',minWidth:150},
            {field: 'status', title: '用户状态',  align:'center',templet:'#checkboxTpl',fixed: 'right',},
            {title: '操作', minWidth:175, templet:'#userListBar',fixed:"right",align:"center"}
        ]]
    });

    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
            table.reload("newsListTable",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    key: $(".searchVal").val()  //搜索的关键字
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
    });



    //添加用户
    function addUser(edit){
        var index = layui.layer.open({
            title : "添加用户",
            type : 2,
            content : "user/add",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
                    body.find(".username").val(edit.userName);  //登录名
                    body.find(".email").val(edit.userEmail);  //邮箱
                    body.find(".userSex input[value="+edit.userSex+"]").prop("checked","checked");  //性别
                    body.find(".group").val(edit.userGrade);  //会员等级
                    body.find(".status").val(edit.userStatus);    //用户状态
                    body.find(".userDesc").text(edit.userDesc);    //用户简介
                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
        layui.layer.full(index);
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
    }
    $(".addNews_btn").click(function(){
        addUser();
    })

    //批量删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('userListTable'),
            data = checkStatus.data,
            newsId = [];
        if(data.length > 0) {
            for (var i in data) {
                newsId.push(data[i].id);
            }
            layer.confirm('确定删除选中的用户？', {icon: 3, title: '提示信息'}, function (index) {
                $.post("user/del",{
                    id : newsId.toString()  //将需要删除的newsId作为参数传入
                },function(data){
                tableIns.reload();
                layer.close(index);
                })
            })
        }else{
            layer.msg("请选择需要删除的用户");
        }
    })

    //批量恢复
    $(".unDel_btn").click(function(){
            layer.confirm('确定恢复数据？', {icon: 3, title: '提示信息'}, function (index) {
                $.post("user/undel",{},function(data){
                tableIns.reload();
                layer.close(index);
                })
            })  
    })

    //锁定操作
    form.on('checkbox(lockDemo)', function(obj){       
            $.post("user/setStatus",{id:this.value});
    });


    //列表操作
    table.on('tool(userList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;

        if(layEvent === 'edit'){ //编辑
            addUser(data);
        }
        // else if(layEvent === 'usable'){ //启用禁用
        //     var _this = $(this),
        //         usableText = "是否确定禁用此用户？",
        //         btnText = "已禁用";
        //     if(_this.text()=="已禁用"){
        //         usableText = "是否确定启用此用户？",
        //         btnText = "已启用";
        //     }
        //     layer.confirm(usableText,{
        //         icon: 3,
        //         title:'系统提示',
        //         cancel : function(index){
        //             layer.close(index);
        //         }
        //     },function(index){
        //         _this.text(btnText);
        //         $.get("user/setStatus?id="+data.id);
        //         layer.close(index);
        //     },function(index){
        //         $.get("user/setStatus?id="+data.id);
        //         layer.close(index);
        //     });
        // }
        else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此用户？',{icon:3, title:'提示信息'},function(index){
                // $.get("删除文章接口",{
                //     newsId : data.newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                    tableIns.reload();
                    layer.close(index);
                // })
            });
        }
    });

})