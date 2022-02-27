package tryhard.De5;

public class SinhvienATTT extends Sinhvien{
    private float hocphi;

    public SinhvienATTT(String msv, String hoten, String ngaysinh, String gt, float dtb, float hocphi) {
        super(msv, hoten, ngaysinh, gt, dtb);
        this.hocphi = hocphi;
    }

    public float getHocphi() {
        return hocphi;
    }

    public void setHocphi(float hocphi) {
        this.hocphi = hocphi;
    }

    @Override
    public String toString() {
        return "SinhvienATTT{" +
                "msv='" + msv + '\'' +
                ", hoten='" + hoten + '\'' +
                ", ngaysinh='" + ngaysinh + '\'' +
                ", gt='" + gt + '\'' +
                ", dtb=" + dtb +
                ", hocphi=" + hocphi +
                '}';
    }


}
