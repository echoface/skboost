// java的数组其实是个对象， 而不是是像c++中那样的c风格数组

/**
 * Array
 */
public class Array {

    public static void main(String[] args) {
        int a[] = new int[10];    
        int b[] = {1,2,3,4,5,6,7,8};
        for (int i = 0; i < 10; i++) {
            
            //int b = 10; //error here, b has defined, java not allow the same-name in a code block,
            // as long as java also has the same life-circle in varialble
            System.out.println(a[i]);
        }
    }

    int arr[] = new int[10];
    int[] arr2 = new int[20];
    //数据基本类型
    byte b = 1; //8 bit 
    short double_byte = 2;
    int integer = 4;
    float float_value = 8.0f;
    long long_value = 8;
    double double_value = 8.0;

    // 字符类型
    char c = 'c'; // 16bit for unicode it always positive, no negtive char value


    // boolean
    boolean correct = true;
}