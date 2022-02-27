package tryhard.De5;

public class SinhvienMatMa extends Sinhvien{
    private String donvi;
    private float luong;

    public SinhvienMatMa(String msv, String hoten, String ngaysinh, String gt, float dtb, String donvi, float luong) {
        super(msv, hoten, ngaysinh, gt, dtb);
        this.donvi = donvi;
        this.luong = luong;
    }

    public String getDonvi() {
        return donvi;
    }

    public void setDonvi(String donvi) {
        this.donvi = donvi;
    }

    public float getLuong() {
        return luong;
    }

    public void setLuong(float luong) {
        this.luong = luong;
    }

    @Override
    public String toString() {
        return "SinhvienMatMa{" +
                "msv='" + msv + '\'' +
                ", hoten='" + hoten + '\'' +
                ", ngaysinh='" + ngaysinh + '\'' +
                ", gt='" + gt + '\'' +
                ", dtb=" + dtb +
                ", donvi='" + donvi + '\'' +
                ", luong=" + luong +
                '}';
    }
}
