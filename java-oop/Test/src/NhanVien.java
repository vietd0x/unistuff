public class NhanVien extends Person{
    private String phongban;
    private float hesoluong, luongcb;
    private int thamnien;

    public NhanVien(String hoten, String ngaysinh, String diachi, String gioitinh, String phongban, float hesoluong, float luongcb, int thamnien) {
        super(hoten, ngaysinh, diachi, gioitinh);
        this.phongban = phongban;
        this.hesoluong = hesoluong;
        this.luongcb = luongcb;
        this.thamnien = thamnien;
    }

    public String getPhongban() {
        return phongban;
    }

    public void setPhongban(String phongban) {
        this.phongban = phongban;
    }

    public float getHesoluong() {
        return hesoluong;
    }

    public void setHesoluong(float hesoluong) {
        this.hesoluong = hesoluong;
    }

    public float getLuongcb() {
        return luongcb;
    }

    public void setLuongcb(float luongcb) {
        this.luongcb = luongcb;
    }

    public int getThamnien() {
        return thamnien;
    }

    public void setThamnien(int thamnien) {
        this.thamnien = thamnien;
    }

    @Override
    public String toString() {
        return "NhanVien{" +
                "phongban='" + phongban + '\'' +
                ", hesoluong=" + hesoluong +
                ", luongcb=" + luongcb +
                ", thamnien=" + thamnien +
                ", hoten='" + hoten + '\'' +
                ", ngaysinh='" + ngaysinh + '\'' +
                ", diachi='" + diachi + '\'' +
                ", gioitinh='" + gioitinh + '\'' +
                '}';
    }

    public float getLuong(){
        return this.luongcb * (this.hesoluong * (1 + this.thamnien/100));
    }

}
