package com.why.smushare.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@TableName("bags") //Mp的一个语法，让这个类的属性名和数据库表中的字段一一对应起来，必须要写
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bags {
    @TableId(type = IdType.AUTO) //Mp的语法，让这个id自然顺序自增，而不是用雪花算法乱生成
    private Integer id;
    private String name;
    private BigDecimal price;
    private String seller;
    private double phonenum;
    private String cover;
    private String allow;
}
