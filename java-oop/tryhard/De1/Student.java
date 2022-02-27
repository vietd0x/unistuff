package tryhard.De1;

public class Student extends Person{
    private String msv, email;
    private float dtk;

    public Student(String hoTen, String diaChi, String gt, String ngaySinh, String msv, String email, float dt) {
        super(hoTen, diaChi, gt, ngaySinh);
        this.msv = msv;
        this.email = email;
        this.dtk = dt;
    }

    public String getMsv() {
        return msv;
    }

    public void setMsv(String msv) {
        this.msv = msv;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public float getDtk() {
        return dtk;
    }

    public void setDtk(float dtk) {
        this.dtk = dtk;
    }

    public void HienThi(){
        super.HienThi();
        System.out.println(this.msv + ", " + this.email + ", " + this.dtk);
    }
}
