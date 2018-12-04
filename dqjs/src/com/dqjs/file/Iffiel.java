package com.dqjs.file;

import java.io.File;

public class Iffiel {
	public static void iffile(String str) {
		File file = new File(str);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	public static void delete(String str) {
		File file=new File(str);
        if(file.exists()&&file.isFile()) {
        	 file.delete(); 
        }
	}
	

}
