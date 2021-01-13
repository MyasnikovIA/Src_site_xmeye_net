package com.demo;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import net.xm.client.factory.Cfg;
import net.xm.client.factory.ClientFactory;
/**
 * Created by Administrator on 2016-07-06.
 */
public class ClientFactoryInit implements ApplicationListener<ContextRefreshedEvent> {

    private Cfg cfg;

    public void setCfg(Cfg cfg) {
        this.cfg = cfg;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent contextRefreshedEvent) {
         if(contextRefreshedEvent.getApplicationContext().getParent()==null){
             ClientFactory.init(cfg);
         }
    }
}
