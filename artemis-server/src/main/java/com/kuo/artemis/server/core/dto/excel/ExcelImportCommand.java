package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.core.dto.FileImportCommand;
import com.kuo.artemis.server.util.constant.FileTypeConst;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author : guoyang
 * @Description :  TODO 后期可能会增加对指定范围内的Excel数据的导入的参数
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class ExcelImportCommand extends FileImportCommand {

    private String filename;

    private String fileType;


    public ExcelImportCommand(MultipartFile file, String projectId, String userId, String dataType) {
        super(file, projectId, userId, dataType);
        this.filename = file.getOriginalFilename();
        this.fileType = FileTypeConst.EXCEL;
    }

    public String getFilename() {
        return filename;
    }

    public String getFileType() {
        return fileType;
    }
}
