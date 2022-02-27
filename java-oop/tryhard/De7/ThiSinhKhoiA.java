package tryhard.De7;

import java.util.Scanner;

public class ThiSinhKhoiA extends ThiSinh{
    float diemToan, diemLy, diemHoa;

    public ThiSinhKhoiA(){}
    public ThiSinhKhoiA(String hoten, String ngaysinh, String diachi, float diemToan, float diemLy, float diemHoa) {
        super(hoten, ngaysinh, diachi);
        this.diemToan = diemToan;
        this.diemLy = diemLy;
        this.diemHoa = diemHoa;
    }

    @Override
    public void nhap() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nhap ho ten: "); this.hoten = sc.nextLine();
        System.out.print("Nhap ngay sinh: "); this.ngaysinh = sc.nextLine();
        System.out.print("Nhap dia chi: "); this.diachi = sc.nextLine();

        System.out.print("Nhap diem toan: "); this.diemToan = Float.parseFloat(sc.nextLine());
        System.out.print("Nhap diem ly: "); this.diemLy = Float.parseFloat(sc.nextLine());
        System.out.print("Nhap diem hoa: "); this.diemHoa = Float.parseFloat(sc.nextLine());
    }

    @Override
    public void hienThi() {
        System.out.print("\nho ten: " + this.hoten);
        System.out.print("\nngay sinh: " + this.ngaysinh);
        System.out.print("\ndia chi: "+ this.diachi);
        System.out.print("\ndiem toan: "+ this.diemToan);
        System.out.print("\ndiem ly: "+this.diemLy);
        System.out.print("\ndiem hoa: "+this.diemHoa);
    }

    @Override
    public float dtb() {
        return (this.diemToan+this.diemHoa+this.diemLy)/3;
    }

}
