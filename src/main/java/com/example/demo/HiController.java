package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class HiController {
    @GetMapping()
    public String hi(){
        InetAddress local = null;
        try {
            local = InetAddress.getLocalHost();
        }
        catch ( UnknownHostException e ) {
            e.printStackTrace();
        }

        if( local == null ) {
            return "can not get ip";
        }
        else {
            String ip = local.getHostAddress();
            return "Hi! server is "+ ip ;
        }

    }
}
