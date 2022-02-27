import java.util.Scanner;

public class try_catch_finally {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter int n: ");
        int n = 0;
        try {
             n = sc.nextInt();
        }catch (Exception err){
            System.out.println("Nhap sai du lieu");
        }finally {
            System.out.println("Nhap dung hay sai deu chay");
        }
        System.out.println("ket qua " + n);
    }
}
