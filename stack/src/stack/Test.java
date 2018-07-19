/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stack;

import java.io.File;
import java.util.Stack;

/**
 *
 * @author Think
 */
public class Test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        File file = new File("D:\\工具");
        new Test().traveDir(file);
    }
    
    public void traveDir(File dir){
        Stack<File> stack = new Stack<File>();
        stack.push(dir);
        while(!stack.empty()){
            File file = stack.pop();
            if(file.isFile()){
                //System.out.println(file.getAbsolutePath());
            }else{
                for(File f : file.listFiles()){
                    stack.push(f);
                }
                
            }
        }
    }
    
}
