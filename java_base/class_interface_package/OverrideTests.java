package ClassAndInterface;

import ClassAndInterface.*;

/*      使用 javac -d 指定路径 源文件.java 的方式来生成类文件，并根据文件的package信息将生成的类文件放
    到正确的地方； 比如说，OverrideTests.java这个文件在当前目录， 我这这里执行`javac -d . OverrideTests.java`
    如果一切顺利， 会在当前文件夹下创建一个我package中指定的路径也就是`ClassAndInterface` 之后将生成的verriderTests
    放到这个目录下； 之后我运行就是在当前目录运行 `java ClassAndInterface.OverrideTests`;
    */
/**
 *  OverrideTests
 */
public class OverrideTests {
    public static void main(String[] args) {
       System.out.println("main hello");
       Base base = new Override();
       base.set_color(0xffffffff);
       System.out.println(base.GetName());
    }
}