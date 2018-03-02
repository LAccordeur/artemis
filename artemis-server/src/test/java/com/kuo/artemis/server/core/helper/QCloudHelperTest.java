package com.kuo.artemis.server.core.helper;

import com.kuo.artemis.server.util.file.QCloudUtil;
import org.junit.Test;

import java.io.File;

import static org.junit.Assert.*;

public class QCloudHelperTest {
    @Test
    public void updateFile() throws Exception {

        File file = new File("C:\\Users\\LAccordeur\\Desktop\\local_test.txt");

        QCloudHelper.updateFile(file, "/local_test.txt");

    }

}