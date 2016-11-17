
public class BaseTest {

    public static void main(String[] args) {
        Base base = new Base(1,2,3);
        Base base_alias = base;

        System.out.println(base.getx());
        base_alias.setx(12);
        System.out.println(base.getx());
    }
}