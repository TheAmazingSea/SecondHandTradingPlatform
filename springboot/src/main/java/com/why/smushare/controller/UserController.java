package com.why.smushare.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.why.smushare.common.Result;
import com.why.smushare.entity.User;
import com.why.smushare.mapper.UserMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/user")
public class UserController {

    //理论上应该用三层架构，controller调用service，service调用dao的，这里图方便就直接在controller调了
    @Resource
    UserMapper userMapper;

    //用户登录
    @PostMapping("/login")
    public Result login(@RequestBody User user){
//        使用这个mp时记得要给UserMapper继承的BaseMapper加泛型
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername,user.getUsername()).eq(User::getPassword,user.getPassword()));
        if(res != null){ //登录成功
            return Result.success(res);
        }else{ //登录失败
            return Result.error("-1","用户名或密码错误");
        }
    }

    //用户注册
    @PostMapping("/register")
    public Result register(@RequestBody User user){
        User res = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername,user.getUsername()));
        if(res != null){ //说明用户名重复
            return Result.error("-1","宝贝你已经注册过了哟~");
        }
        //用户不存在，允许注册
        userMapper.insert(user);
        return Result.success();
    }


    //新增用户，即访问/user即可
    @PostMapping
    //@RequestBody就是把前台传过来的json数据转换成Java对象
    public Result save(@RequestBody User user){
        if(user.getPassword() == null){
            user.setPassword("123456");
        }
        userMapper.insert(user);
        return Result.success();
    }


    //更新用户，即访问/user即可
    @PutMapping
    //@RequestBody就是把前台传过来的json数据转换成Java对象
    public Result update(@RequestBody User user){
        userMapper.updateById(user);
        return Result.success();
    }


}
