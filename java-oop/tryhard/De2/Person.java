package tryhard.De2;

public class Person {
    protected String hoTen, diaChi, gt, ngaySinh;

    public Person(String hoTen, String diaChi, String gt, String ngaySinh) {
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.gt = gt;
        this.ngaySinh = ngaySinh;
    }

    public void hienThi(){
        System.out.println(this.hoTen + ", " + this.diaChi + ", " + this.gt + ", " + this.ngaySinh);
    }

}
