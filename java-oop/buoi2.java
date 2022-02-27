import java.util.Scanner;

public class buoi2 {
/* 
 * b1: giai pt b2 nhap 3 so nguyen, suat no?
 * b2: nhap 3 canh, ktra tam giac, tam giac gi?
 * 
 */
	static void giaiPT(int a, int b, int c){
	    double delta = b*b - 4*a*c;
	    if(delta < 0)
	        System.out.println("PT vo no!");
	    else if(delta == 0)
	        System.out.println("PT co 2 no = " + (-b) * (1.0)/(2*a));
	    else{
	        delta = Math.sqrt(delta);
	        System.out.println("No1 = "+ (-b + delta)*1.0 / (2*a));
	        System.out.println("No1 = "+ (-b - delta)*1.0 / (2*a));
	    }
	}
	
	
	static void tamGiac(int a, int b, int c) {
		if(a < b+c && b < a+c && c < a+b ){
	        if( a*a==b*b+c*c || b*b==a*a+c*c || c*c== a*a+b*b)
	        	System.out.println("Day la tam giac vuong");
	        else if(a==b && b==c)
	        	System.out.println("Day la tam giac deu");
	        else if(a==b || a==c || b==c)
	        	System.out.println("Day la tam giac can");
	        else if(a*a > b*b+c*c || b*b > a*a+c*c || c*c > a*a+b*b)    
	        	System.out.println("Day la tam giac tu");
	        else
	        	System.out.println("Day la tam giac nhon");
	    }
	    else
	    	System.out.println("Ba canh a, b, c khong phai la ba canh cua mot tam giac");
	}
	
	static int giaiThua(int n) {
		if(n == 1)
			return 1;
		return n * giaiThua(n-1);
	}
	public static void main(String[] args) {
//		Scanner scanner = new Scanner(System.in);
//		
//		System.out.println("input 3 nums: ");
//		int a = scanner.nextInt();
//		int b = scanner.nextInt();
//		int c = scanner.nextInt();
//		
//		scanner.close();
		
//		int i;
//		int j;
//		for(i = 0; i < 10; i++)
//			break;
//			for(j = 0; j < 10; j++)
//				System.out.println(j + ". hi");
//		System.out.println(i);
//		System.out.println(j);
		
		System.out.println(giaiThua(12));
	}
}
