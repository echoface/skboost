//源文件的名字非常重要

class Helloword {
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
        //code ＝ 'Y'; 
        
        // ============= boolean ==========================================

       
    }
}