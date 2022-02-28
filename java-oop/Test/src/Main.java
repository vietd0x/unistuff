import javax.swing.*;
import java.io.BufferedReader;
import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
/*
Câu 1. Hãy xây dựng các lớp theo yêu cầu sau:
a. Hãy định nghĩa class Person với các thuộc tính: Họ tên, ngày sinh, địa chỉ, giới tính
và các phương thức khởi tạo, hiển thị thông tin.
b. Định nghĩa class NhanVien kế thừa từ Person, có thêm các thuộc tính: phòng ban, hệ
số lương, thâm niên, lương cơ bản và các phương thức khởi tạo, tính lương thực lĩnh,
hiển thị thông tin cá nhân
Trong đó: lương thực lĩnh = Lương cơ bản * hệ số (1 + thâm niên/100)
Câu 2. Xây dựng chương trình giao diện đồ hoạ người dùng đáp ứng yêu cầu
sau:
a. Hãy đọc file nhanvien.dat gồm danh sách các nhân viên với định dạng lưu trữ như
sau: mỗi nhân viên được lưu trên 1 dòng, mỗi thuộc tính phân cách bởi ký tự ‘$’. Dữ
liệu đọc được lưu dưới dạng một mảng các đối tượng nhân viên (arraylist)
b. Hiển thị danh sách nhân viên trên trong một table (hiển thị trên console chỉ được ½ số
điểm
 */
        ArrayList<NhanVien> listNV = new ArrayList<NhanVien>();

        try{
            File f = new File("C:\\Users\\vietd\\Desktop\\nhanvien.dat");
            BufferedReader br = Files.newBufferedReader(f.toPath());
            String line = null;
            while(true){
                line = br.readLine();
                if(line == null)
                    break;
                String[] ar = line.split("\\$");
                NhanVien nv = null;
                try {
                    // NhanVien(String hoten, String ngaysinh, String diachi, String gioitinh, String phongban, float hesoluong, float luongcb, int thamnien) {
                    nv = new NhanVien(ar[0], ar[1], ar[2], ar[3], ar[4], Float.parseFloat(ar[5]), Float.parseFloat(ar[6]), Integer.parseInt(ar[7]));
                    System.out.println(nv);
                }catch (Exception err){
                    JOptionPane.showMessageDialog(null, "Format file sai");
                    return;
                }
                listNV.add(nv);
            }
            br.close();
        }catch (Exception err){
            err.printStackTrace();
            JOptionPane.showMessageDialog(null, "loi doc file");
        }

        TableNV myTable = new TableNV();
        myTable.setData(listNV);
    }
}
