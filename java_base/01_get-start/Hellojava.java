//源文件的名字非常重要

class HelloJava {


    public static void swapIntValue(int a, int b) {
        a = a + b;
        b = a - b;
        a = a - b;
    }



    public static void main(String args[]) {
        System.out.println("hello world");
        int num = 100;
        System.out.println(num);


       /* if condition */
       boolean condition = false;
       if (condition) { // ==  > < >= <=
           System.out.println("condition is true");
       } else {
           System.out.println("condition is false");
       }

       /* for while loop*/

       int while_condition = 10;
       while(--while_condition != 0) {
           System.out.println("while_condition is true:" + while_condition);
       }
       int for_condition = 10;
       for (; for_condition > 0; for_condition--) {
           System.out.println("for_condition is true:" + for_condition);
       }

       /* ============  keyword =============================
        abstract boolean break byte case catch char class
        const continue default do double else extends final
        finally float for goto if implements import instanceof
        Int interface long native new package private protected
        public return short static strictfp super switch synchronized this
        throw throws transient try
        void volatile while
        */
        /** ========= 整型类型 byte short int long ===========================*/
        // java 中定义的 **整型类型** 都是有符号的，也就是说byte int long short都是由正负的
        // 这里所说的长度不一定像c／C＋＋中表明内存中的存储长度， 而是表现的行为；因为为了内存对其或者性能等原因， 内存上的长度可能都是4bytes

        /* ========  浮点型 float double =================================== */


        /* ========== 字符型  char  unicode编码的字符类型 ＝＝＝＝＝＝＝＝＝＝＝＝ */
        // 区别开c／c++中的char， java中char类型是16bit的，用来保存unicode编码的变量
        char code = 'a';
        code = 88; //X
        code = 'Y';

        // ============= boolean ==========================================
        
        double trangle_c = Math.sqrt(4);
        System.out.println(trangle_c);
        
        // ======= java 中的实参
        int value_a = 20; int value_b = 80;
        swapIntValue(value_a, value_b);
        System.out.println(value_a);
        System.out.println(value_b);


        // 变量作用域， 整体上和c/c++ 一致， 但是有一点， 在block中， c/c++可以定义与外部变量同名的变量来覆盖外面的变量
        // java中不行， java中变量名字在一个函数体内必须是唯一的
        int out = 20;
        if (out > 10) {
            //int out = 10; //compiler error： 已在方法 main(String[])中定义了变量 out
            System.out.println("out value is:"+out);
        }

        // 类型转换，  1. 扩宽转换， 自动能完成 短的赋值给长的， 2. 缩小转换 长的复制给短的
        char short_char_value = 61;
        int int_number_value = 100;
        long long_number_value = 0;
        int_number_value = short_char_value; //ok
        long_number_value = int_number_value; //ok
        
        //int_number_value = long_number_value; // 错误: 不兼容的类型: 从long转换到int可能会有损失
        int_number_value = int(long_number_value); //ok may be loss part data, but it can work

        // array 数组 看上去形式和c/C++一样的
    }

}
