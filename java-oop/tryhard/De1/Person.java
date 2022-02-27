package tryhard.De1;

public class Person {
    protected String hoTen, diaChi, gt, ngaySinh;

    public Person(String hoTen, String diaChi, String gt, String ngaySinh) {
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.gt = gt;
        this.ngaySinh = ngaySinh;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getGt() {
        return gt;
    }

    public void setGt(String gt) {
        this.gt = gt;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public void HienThi(){
        System.out.println(this.hoTen + ", " + this.diaChi + ", " + this.gt + ", " + this.ngaySinh);
    }
}
