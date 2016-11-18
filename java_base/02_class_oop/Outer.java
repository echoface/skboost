/**
 * Outer
 */
public class Outer {

    private int v;
    public Outer () {
        v = 200;
        System.out.println("created"); 
    }
    public void set_v(int v) {
        this.v = v;
    }
    public int get_v() {
        return this.v;
    }
    public void access_inner_var() {
        Inner i = new Inner();
        i.inner_v = 10; //outer class can access inner class private value directly
        System.out.println(i.inner_v);
    }
    public void inner_fun_access_outer_var() {
        Inner i = new Inner();
        i.access_out_var();
    }
    public void inner_fun_access_outer_fn() {
        Inner i = new Inner();
        i.access_outer_fn();
    }


    /**
     * Inner
     */
    public class Inner {
        private int inner_v;
        public Inner () {
           System.out.println("Inner class created" + v); 
        }
        public void set_inner_v(int v) {
            inner_v = v;
        }
        public void access_out_var() {
            //inner class can access the Outer class value
            System.out.println(v);
        }
        public void access_outer_fn() {
           System.out.println(get_v());
        }
    }

}