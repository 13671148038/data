package com.ocst.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MailConfig {
    private static final String PROPERTIES_DEFAULT = "init.properties";
    public static String host;
    public static String port;
    public static String userName;
    public static String passWord;
    public static String emailForm;
    public static String timeout;
    public static Properties properties;
    static{
        init();
    }

    /**
     * 初始化
     */
    private static void init() {
        properties = new Properties();
        try{
            InputStream inputStream = MailConfig.class.getClassLoader().getResourceAsStream(PROPERTIES_DEFAULT);
            properties.load(inputStream);
            inputStream.close();
            host = properties.getProperty("mailHost");
            port = properties.getProperty("mailPort");
            userName = properties.getProperty("mailUsername");
            passWord = properties.getProperty("mailPassword");
            emailForm = properties.getProperty("mailFrom");
            timeout = properties.getProperty("mailTimeout");

        } catch(IOException e){
            e.printStackTrace();
        }
    }
}
