package com.bin23.chat.utils;

import java.io.UnsupportedEncodingException;

public class Data {
    private String name, msg;

    public Data() {
    }

    public Data(String name, String msg) {
        this.name = name;
        this.msg = msg;
    }

    public Data(byte b[]) {
        int pos = 0;
        for (int i = 0; i < b.length - 5; i++) {
            if (b[i] == 0 && b[i + 1] == 0 && b[i + 2] == 0 && b[i + 3] == 0 && b[i + 4] == 0) pos = i;
        }
        byte temp[] = new byte[pos];
        for (int i = 0; i < pos; i++) temp[i] = b[i];
        try {
            name = new String(temp, "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO 自动生成的 catch 块
            e1.printStackTrace();
        }
        temp = new byte[b.length - 5 - pos];
        for (int i = pos + 5; i < b.length; i++) temp[i - pos - 5] = b[i];
        try {
            msg = new String(temp, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
    }

    public Data(byte[] b, int lenb) {
        byte[] temp = new byte[lenb];
        for (int i = 0; i < lenb; i++) temp[i] = b[i];
        this.name = new Data(temp).name;
        this.msg = new Data(temp).msg;
    }

    public byte[] toByte() {
        try {
            byte b1[];
            byte b2[];
            b2 = msg.getBytes("UTF-8");
            b1 = name.getBytes("UTF-8");
            int temp = b1.length + 5 + b2.length;
            byte b[] = new byte[temp];
            for (int i = 0; i < b1.length; i++) b[i] = b1[i];
            for (int i = b1.length; i < b1.length + 5; i++) b[i] = 0;
            for (int i = b1.length + 5; i < b1.length + b2.length + 5; i++) b[i] = b2[i - b1.length - 5];
            return b;
        } catch (UnsupportedEncodingException e) {
            // TODO 自动生成的 catch 块
            e.printStackTrace();
        }
        return new byte[5];
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
