package tryhard.De3;

public class NhanVien extends Person{
    private String phongBan;
    private float heSoLuong, luongCb;
    private int thamNien;

    public NhanVien(String hoTen, String diaChi, String gt, String ngaySinh, String phongBan, float heSoLuong, float luongcb, int thamNien) {
        super(hoTen, diaChi, gt, ngaySinh);
        this.phongBan = phongBan;
        this.heSoLuong = heSoLuong;
        this.luongCb = luongcb;
        this.thamNien = thamNien;
    }

    public String getPhongBan() {
        return phongBan;
    }

    public void setPhongBan(String phongBan) {
        this.phongBan = phongBan;
    }

    public float getHeSoLuong() {
        return heSoLuong;
    }

    public void setHeSoLuong(float heSoLuong) {
        this.heSoLuong = heSoLuong;
    }

    public float getLuongCb() {
        return luongCb;
    }

    public void setLuongCb(float luongCb) {
        this.luongCb = luongCb;
    }

    public int getThamNien() {
        return thamNien;
    }

    public void setThamNien(int thamNien) {
        this.thamNien = thamNien;
    }

    public float getLuong(){
        return this.luongCb + this.heSoLuong * (1 + this.thamNien/100);
    }

    @Override
    public void hienThi() {
        super.hienThi();
        System.out.println(this.phongBan + ", " + this.heSoLuong + ", " + this.luongCb + ", " + this.thamNien);
    }
}
