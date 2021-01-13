package net.xmcloud.component;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URLEncoder;


/**
 * <b> </b></br>
 *
 * @author ava
 * @version 0.0.1
 * @since 0.0.1
 */
public class URLUtil {
    private static Logger logger = LoggerFactory.getLogger(URLUtil.class);

    private URLUtil() {
    }

    public static String decode(String url) {
        try {
            return DESUtil.decrypt(url);
        } catch (Exception e) {
            logger.error("error:5107,url解密错误。" + e.getMessage(), e);
            return "";
        }
    }

    public static String encode(String url) {
        try {
            return URLEncoder.encode(DESUtil.encrypt(url), "UTF-8");
        } catch (Exception e) {
            logger.error("error:5107,url加密错误。字段：" + url + e.getMessage(), e);
            return "";
        }
    }
}
