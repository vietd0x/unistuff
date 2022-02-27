
public class buoi4 {
	public static void main(String[] args) {
		Fraction a = new Fraction(2, 4);
		Fraction b = new Fraction(3, 8);
		a.normalize();
		System.out.println(a.add(b).fracStr);
	}
}
