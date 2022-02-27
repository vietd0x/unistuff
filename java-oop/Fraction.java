
public class Fraction {
	private int numerator;
	private int denominator;
	String fracStr;
	public Fraction(int a, int b) {
		if(b == 0)
			System.exit(1);
		this.numerator = a;
		this.denominator = b;
		this.fracStr = a + "/" + b;
	}
	
	public String print() {
		return fracStr;
	}
	private int UCLN(int a, int b) {
		if(a == 0)	return b;
		return UCLN(b % a, a);
	}
	public void normalize() {
		int gcd_ =  UCLN(numerator, denominator);
		if(gcd_ != 1) {
			numerator /= gcd_;
			denominator /= gcd_;
			fracStr = String.valueOf(numerator) + '/' + String.valueOf(denominator);
		}
	}
	public Fraction add(Fraction x) {
		Fraction sum = new Fraction(numerator * x.denominator + x.numerator * denominator, denominator * x.denominator);
		return sum;
	}
	
}
