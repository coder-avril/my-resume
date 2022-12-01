package com.lding.resume.config;

import org.springframework.web.servlet.view.InternalResourceView;
import java.io.File;
import java.util.Locale;

/**
 * SpringMVC自带的InternalResourceViewResolver所存在的问题
 *  1. InternalResourceViewResol本身并没有重写父类AbstractUrlBaseView的checkResource方法
 *  2. 父类AbstractUrlBaseView的checkResource方法返回值是固定为true，即视为肯定存在目标文件
 *  3. 一旦通过order将InternalResourceViewResol设为优先级最高的话，无论找到与否，其他的配置都不起作用了
 */
public class MyView extends InternalResourceView {
    @Override
    public boolean checkResource(Locale locale) throws Exception {
        // 获取完整path
        String path = this.getServletContext().getRealPath("/") + this.getUrl();
        File file = new File(path);
        // 存在返回true；否在返回false
        return file.exists();
    }
}
