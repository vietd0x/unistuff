package tryhard.De7;

import java.util.Scanner;

public class ThiSinhKhoiC extends ThiSinh{
    float diemSu, diemVan, diemDia;

    public ThiSinhKhoiC(){}
    public ThiSinhKhoiC(String hoten, String ngaysinh, String diachi, float diemSu, float diemVan, float diemDia) {
        super(hoten, ngaysinh, diachi);
        this.diemSu = diemSu;
        this.diemVan = diemVan;
        this.diemDia = diemDia;
    }


    @Override
    public void nhap() {
        Scanner sc = new Scanner(System.in);
        System.out.print("Nhap ho ten: "); this.hoten = sc.nextLine();
        System.out.print("Nhap ngay sinh: "); this.ngaysinh = sc.nextLine();
        System.out.print("Nhap dia chi: "); this.diachi = sc.nextLine();

        System.out.print("Nhap diem van: "); this.diemVan = Float.parseFloat(sc.nextLine());
        System.out.print("Nhap diem su: "); this.diemSu = Float.parseFloat(sc.nextLine());
        System.out.print("Nhap diem dia: "); this.diemDia = Float.parseFloat(sc.nextLine());
    }

    @Override
    public void hienThi() {
        System.out.print("\nho ten: " + this.hoten);
        System.out.print("\nngay sinh: " + this.ngaysinh);
        System.out.print("\ndia chi: "+ this.diachi);
        System.out.print("\ndiem van: "+ this.diemVan);
        System.out.print("\ndiem su: "+this.diemSu);
        System.out.print("\ndiem dia: "+this.diemDia);
    }

    @Override
    public float dtb() {
        return (this.diemVan+this.diemSu+this.diemDia)/3;
    }
}
