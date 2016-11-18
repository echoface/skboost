/**
 * Demo
 */
public class Demo {
    public static void main(String[] args) {
        // Outer inner class
        Outer oi = new Outer();
        oi.access_inner_var();
        oi.inner_fun_access_outer_var();
        oi.inner_fun_access_outer_fn();
    }

}