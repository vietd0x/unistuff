
public class buoi3 {
	static void hinh1(int n) {
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < i + 1; j++ )
				System.out.print("*");
			System.out.print("\n");
		}
	}
	static void hinh2(int n) {
		/*
		*****
		****
		***
		**
		*
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n - i; j++ )
				System.out.print("*");
			System.out.print("\n");
		}
	}
	
	static void hinh3(int n) {
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++ )
				if(n-i-1 <= j)
					System.out.print("*");
				else
					System.out.print(" ");
			System.out.print("\n");
		}
	}
	
	static void hinh4(int n) {
		for(int i = 0; i < n; i++) {
			/*
			*****
			 ****
			  ***
			   **
			    *
			 */
			for(int j = 0; j < n; j++ )
				if(j < i)
					System.out.print(" ");
				else
					System.out.print("*");
			System.out.print("\n");
		}
	}
	static void hinh5(int n) {
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < i + 1; j++ )
				System.out.print(j+1);
			System.out.print("\n");
		}
	}
	
	static void hinh6(int n) {
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++ )
				if(n-i-1 <= j)
					System.out.print(n-j);
				else
					System.out.print(" ");
			for(int j = 1; j < i + 1; j++ )
				System.out.print(j+1);
			System.out.print("\n");
		}
	}
	
	static void hinh8(int n) {
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++ )
				if(n-i-1 <= j)
					System.out.print("*");
				else
					System.out.print(" ");
			for(int j = 1; j < i + 1; j++ )
				System.out.print("*");
			System.out.println();
		}
	}
	
	static void hinh7(int m, int n) {
		/*
		 ******
		 *    *
		 *    *
		 ******
		 */
		for(int i = 0; i < m; i++) {
			for(int j = 0; j < n; j++) {
				if(i == 0 || j == 0 || i == m-1 || j == n-1)
					System.out.print('*');
				else
					System.out.print(" ");
			}
			System.out.print("\n");
		}
	}
	static void pic1(int n) {
		/*
		 ****
		  *  
		   *
		 ****
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++)
				if(i == 0 || i == n-1 || i == j)
					System.out.print("*");
				else
					System.out.print(" ");
			System.out.println();
		}
	}
	
	static void pic2(int n) {
		/*
		 ****
		   *  
		  *
		 ****
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++)
				if(i == 0 || i == n-1 || j == n-i-1)
					System.out.print("*");
				else
					System.out.print(" ");
			System.out.println();
		}
	}
	static void pic3(int n) {
		/*
		*****
		 * * 
		  *  
		 * * 
		*****
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++)
				if(i == 0 || i == n-1 || i == j || j == n-1-i)
					System.out.print("*");
				else
					System.out.print(" ");
			System.out.println();
		}
	}
	
	static void pic4(int n) {
		/*
		12345
		 1234
		  123
		   12
		    1
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++)
				if(i <= j)
					System.out.print(j+1-i);
				else
					System.out.print(" ");
			System.out.println();
		}	
	}
	static void pic5(int n) {
		/*
		    1
		   21
		  321
		 4321
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++)
				if(n-1-i <= j)
					System.out.print(n-j);
				else
					System.out.print(" ");
			System.out.println();
		}
	}
	
	static void pic6(int n) {
		/*
		*******
		**   **
		* * * *
		*  *  *
		* * * *
		**   **
		 */
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++)
				if(i == 0 || j == 0 || i == n-1 || j == n-1 || i == j || j == n-1-i)
					System.out.print("*");
				else
					System.out.print(" ");
			System.out.println();
		}
	}
	
	static void pic7(int n) {
		/*
		   *
		  ***
		 *****
		*******
		 *****
		  ***
		   * 
		 */
		hinh8(n/2+1);
		for(int i = 0; i < n/2; i++) {
			for(int j = 0; j < n/2; j++ )
				if(i < j)
					System.out.print("*");
				else
					System.out.print(" ");
			for(int j = 0; j < n/2 - i; j++)
				System.out.print("*");
			System.out.print("\n");
		}	
	}

	public static void main(String[] args) {
		pic7(6);
	}	
}
