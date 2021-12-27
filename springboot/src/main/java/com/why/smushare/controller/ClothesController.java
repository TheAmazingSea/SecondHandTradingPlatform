package com.why.smushare.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.why.smushare.common.Result;
import com.why.smushare.entity.Clothes;
import com.why.smushare.mapper.ClothesMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController //返回json格式字符串的注解
@RequestMapping("/clothes")
public class ClothesController {

    //理论上应该用三层架构，controller调用service，service调用dao的，这里图方便就直接在controller调了
    @Resource
    ClothesMapper clothesMapper;


    //新增衣物
    @PostMapping
    //@RequestBody就是把前台传过来的json数据转换成Java对象
    public Result save(@RequestBody Clothes clothes){
        clothes.setAllow("0"); //allow默认设置为0，由数据库管理员进行检查
        clothesMapper.insert(clothes);
        return Result.success();
    }

    //删除衣物，根据id删除
    @DeleteMapping("/{id}")
    //@PathVariable就是把前台通过{id}占位符传过来的数据解析成Long类型的id值
    public Result delete(@PathVariable Long id){
        clothesMapper.deleteById(id);
        return Result.success();
    }

    //更新衣物，即访问/user即可
    @PutMapping
    //@RequestBody就是把前台传过来的json数据转换成Java对象
    public Result update(@RequestBody Clothes clothes){
        clothes.setAllow("0");
        clothesMapper.updateById(clothes);
        return Result.success();
    }

    //查询衣物，用Get命令,且是分页查询
    /**
     * 分页查询，需要前台传过来三个参数，@RequestParm注解就是解析参数用的，如果不加后面的defaultValue设置
     * 默认的话，则请求时必须携带三个参数，不然就会报404错误
     * 第一个参数pageNum就是当前页的页码
     * 第二个参数pageSize就是每页多少条数据
     * 第三个参数search就是查询的关键字
     * @param pageNum
     * @param pageSize
     * @param search
     * @return
     */
    @GetMapping
    public Result<?> findPage(@RequestParam(defaultValue = "1") Integer pageNum,
                              @RequestParam(defaultValue = "10") Integer pageSize,
                              @RequestParam(defaultValue = "") String search){
        //下面这些操作都是Mp提供的，不懂的就需要自己去了解学习了
        //分页模糊查询,结果放在Result里面直接返回出去
        QueryWrapper<Clothes> wrapper = new QueryWrapper<>();
        wrapper.like("name",search);
        wrapper.eq("allow","1");
        return Result.success(clothesMapper.selectPage(new Page<>(pageNum, pageSize),wrapper));
    }

}
