/**
* Base
*/
public class Base {
        public Base (int x, int y, int z) {
            this.x = x;
            this.y = y;
            this.z = y;
        }
        public Base () {
            this.x = 0;
            this.y = 0;
            this.z = 0;
        }

        public int getx() {
            return x;
        }
        public int gety() {
            return y;
        }
        public void setx(int x) {
            this.x = x;
        }
        int x;
        int y;
        int z;
}