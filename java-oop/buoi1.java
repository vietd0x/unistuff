import java.util.Scanner;
import java.util.Random;

public class buoi1 {
/*
	b1: Nhap 3 so nguyen duong, in ra max, min, pow(max, min), sqrt(max)
	b2: rand(14, 19), tim quy luat of pseudo rand tu 0-100? Why?
*/
	static int min_(int a, int b) {
		if(a > b)
			return b;
		return a;
	}
	static int max_(int a, int b) {
		if(a > b)
			return a;
		return b;
	}
	
	static int pow_(int a, int b) {
        if (b == 0)
            return 1;
        int res = a;
        int increment = a;
        for (int i = 1; i < b; i++) {
            for (int j = 1; j < a; j++) {
                res += increment;
            }
            increment = res;
        }
        return res;
    }
	
	static float squareRoot(float n) {
		float res = 0;
		while(res*res <= n) {
			if(res*res == n)
				return res;
			res++;
		}
		res--;
		while(res*res <= n)
			res += 0.001;
		res -= 0.001;
		return res;
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("input 3 nums: ");
		int a = scanner.nextInt();
		int b = scanner.nextInt();
		int c = scanner.nextInt();
		int maxVal = max_(max_(a, b), c);
		int minVal = min_(min_(a, b), c);
		System.out.println("max: " + maxVal);
		System.out.println("min: " + minVal);
		System.out.println("pow(max, min): " + pow_(maxVal, minVal));
		System.out.println("sqrt(max): " + squareRoot(maxVal));
		
		scanner.close();
		//_____________b2______________
//		Random rand = new Random(20);
//		int cnt = 0;
//		for(int i = 0; i < 1000; i++){
//			if(rand.nextInt(100)+1 < 50)
//				cnt += 1;
//		}
//		System.out.println(cnt);
	}
}
