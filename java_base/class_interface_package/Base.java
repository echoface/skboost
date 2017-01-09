package ClassAndInterface;

/**
 * Base
    任何含有一个 或者 多个 bstract方法的基类都必须申明为抽象类
 */
abstract public class Base {
    private int m_color;
    public Base () {
        System.out.println("Base Created");        
        m_color = 0;
    }
    protected void set_color(int color) {
        m_color = color;
    }
    abstract String GetName();
}