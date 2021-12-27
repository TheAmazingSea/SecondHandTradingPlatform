package com.why.smushare.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.why.smushare.common.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

//文件上传接口
@RestController
@RequestMapping("/files")
public class FileController {

    @Value("${server.port}")
    private String port;

    private static final String ip = "http://localhost";

//    文件上传
    @PostMapping("/upload")
    public Result<?> upload(MultipartFile file) throws IOException {
//        MultipartFile用来接收前台传送过来的文件对象
//        获取文件名称
        String originalFilename = file.getOriginalFilename();

//        定义文件的唯一标识去（前缀）,hutool的这个工具不会生成重复的字符串
        String flag = IdUtil.fastSimpleUUID();

        //获取我们的文件要存储的位置（即resources下的files位置）
        String rootFilePath = System.getProperty("user.dir")+"/springboot/src/main/resources/files/"+flag+"_"+originalFilename;

        //现在要将这个文件写入进我们的文件夹中，用hutool工具实现，io过于繁琐了不用
//        file.getBytes()得到文件的字节流，rootFilePath：要写入文件的位置
        FileUtil.writeBytes(file.getBytes(),rootFilePath);
        return Result.success(ip+":"+port+"/files/"+flag); //返回结果url
    }


//    文件下载
    @GetMapping("/{flag}")
    public void getFiles (@PathVariable String flag, HttpServletResponse response){
        OutputStream os; //新建一个输出流对象
        String basePath = System.getProperty("user.dir")+"/springboot/src/main/resources/files/"; //定义文件上传的根路径
        List<String> fileNames = FileUtil.listFileNames(basePath); //获取该根路径下的所有的文件名称
        //找到跟参数一致的文件
        String fileName = fileNames.stream().filter(name -> name.contains(flag)).findAny().orElse("");
        try{
            if(StrUtil.isNotEmpty(fileName)){
                response.addHeader("Content-Disposition","attachment;filename="+URLEncoder.encode(fileName,"UTF-8"));
                response.setContentType("application/octet-stream");
                //通过文件路径读取文件的字节流
                byte[] bytes = FileUtil.readBytes(basePath+fileName);
                os = response.getOutputStream(); //通过输出流返回文件
                os.write(bytes);
                os.flush();
                os.close();
            }
        } catch (Exception e){
            System.out.println("文件下载失败!");
        }

    }

}
