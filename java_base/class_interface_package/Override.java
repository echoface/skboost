package ClassAndInterface;

import ClassAndInterface.*;
/**
 * Override
 */
public class Override extends Base {

    public Override () {
       System.out.println("Override Created"); 
    }
   // 如果pass 0xffffffff as paraments, it will output -1 in the console;
   // remember all value type was signed in java language; different with c/C++
   
   // if here just using @Override, it will give a error :"不兼容的类型: Override无法转换为Annotation"
   // so using the full name if needed, because the class we create named Override, it is conflict
   // with the java.lang.Override; so。。。。。。
    @java.lang.Override
    public void set_color(int color) {
        System.out.println(color);
        super.set_color(color);
    }

    String GetName() { 
        return "Override is my Name";
    }
}