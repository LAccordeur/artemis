package com.kuo.artemis.server.core.dto.excel;

import com.kuo.artemis.server.core.dto.FileExportCommand;
import com.kuo.artemis.server.util.constant.FileTypeConst;
import com.kuo.artemis.server.util.constant.OperationTypeConst;

import java.util.List;

/**
 * @Author : guoyang
 * @Description :
 * @Date : Created on 2017/12/17
 */
@Deprecated
public class ExcelExportCommand extends FileExportCommand {

    private List<String> indicatorIds;  //选择的指标id集合

    public ExcelExportCommand() {
        super(OperationTypeConst.DOWNLOAD_TEMPLATE, FileTypeConst.EXCEL);
    }

    @Override
    public String toString() {
        return "ExcelExportCommand{" +
                "indicatorIds=" + indicatorIds +
                '}';
    }

    public List<String> getIndicatorIds() {
        return indicatorIds;
    }

    public void setIndicatorIds(List<String> indicatorIds) {
        this.indicatorIds = indicatorIds;
    }
}
