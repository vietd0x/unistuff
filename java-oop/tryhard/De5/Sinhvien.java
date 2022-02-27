package tryhard.De5;

public class Sinhvien {
    protected String msv, hoten, ngaysinh, gt;
    protected float dtb;

    public Sinhvien(String msv, String hoten, String ngaysinh, String gt, float dtb) {
        this.msv = msv;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.gt = gt;
        this.dtb = dtb;
    }

    @Override
    public String toString() {
        return "Sinhvien{" +
                "msv='" + msv + '\'' +
                ", hoten='" + hoten + '\'' +
                ", ngaysinh='" + ngaysinh + '\'' +
                ", gt='" + gt + '\'' +
                ", dtb=" + dtb +
                '}';
    }
}
