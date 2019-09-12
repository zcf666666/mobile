package com.lb.mobile.comm.fastdfs;

import com.github.tobato.fastdfs.domain.fdfs.StorePath;
import com.github.tobato.fastdfs.domain.fdfs.ThumbImageConfig;
import com.github.tobato.fastdfs.exception.FdfsUnsupportStorePathException;
import com.github.tobato.fastdfs.service.FastFileStorageClient;
import com.lb.mobile.comm.base.ResponseCode;
import com.lb.mobile.comm.exception.BizException;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;

@Component
public class FastdfsClientUtil {
    private final Logger logger = LoggerFactory.getLogger(FastdfsClientUtil.class);
    @Autowired
    private FastFileStorageClient storageClient;
    @Autowired
    private ThumbImageConfig thumbImageConfig;
    //上传文件

    /**
     *
     * @param fileUrl
     * @param ext
     * @return
     * @throws Exception
     */
    public String upload(String fileUrl, String ext) throws BizException {
        String path  = null;
        try {
            File file = new File(fileUrl);
            StorePath storePath = this.storageClient.uploadImageAndCrtThumbImage(
                    new FileInputStream(file), file.length(), ext, null);
             path = storePath.getFullPath();
        }catch ( Exception e){
            logger.info("FastdfsClientUtil upload fail[]{}:"+fileUrl+","+ext,e);
            throw  new BizException(ResponseCode.INTERNAL_SERVER_ERROR.code,"file upload fail");
        }
        return path;
    }
    //上传文件
    public String upload(MultipartFile myfile) throws BizException{
        String path = null;
        String ext = null;
        try {
            //文件名
             String originalFilename = myfile.getOriginalFilename().substring(myfile.getOriginalFilename().lastIndexOf(".") + 1);
            // 文件扩展名
             ext = originalFilename.substring(originalFilename.lastIndexOf(".") + 1, originalFilename.length());
             StorePath storePath = this.storageClient.uploadImageAndCrtThumbImage(myfile.getInputStream(), myfile.getSize(),ext , null);
             path = storePath.getFullPath();
        }catch (Exception e){
            logger.info("FastdfsClientUtil upload fail[]{}:"+path+","+ext,e);
            throw  new BizException(ResponseCode.INTERNAL_SERVER_ERROR.code,"file upload fail");
        }
        return path;
    }
    /**
     * 删除文件
     * @Param fileUrl 文件访问地址
     */
    public void deleteFile(String fileUrl) {
        if (StringUtils.isEmpty(fileUrl)) {
            return;
        }
        try {
            StorePath storePath = StorePath.parseFromUrl(fileUrl);
            storageClient.deleteFile(storePath.getGroup(), storePath.getPath());
        } catch (FdfsUnsupportStorePathException e) {
            logger.info(e.getMessage());
        }
    }

}
