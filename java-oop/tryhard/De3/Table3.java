package tryhard.De3;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.util.ArrayList;

public class Table3 extends JFrame{
    private JTable table1;
    private JPanel panel1;

    public Table3(){
        setVisible(true);
        setContentPane(panel1);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
//        setResizable(false);
//        setSize(500, 500);
    }

    public void setData(ArrayList ar){
        DefaultTableModel m3 = new DefaultTableModel();
        m3.addColumn("Ho ten");
        m3.addColumn("Ngay sinh");
        m3.addColumn("Dia chi");
        m3.addColumn("Gioi tinh");
        m3.addColumn("Phong ban");
        m3.addColumn("He so luong");
        m3.addColumn("Tham nien");
        m3.addColumn("Luong co ban");
        m3.addColumn("Luong thuc linh");

        for (int i = 0; i < ar.size(); i++) {
            NhanVien nv = (NhanVien) ar.get(i);
            Object[] rowData = {nv.hoTen, nv.ngaySinh,  nv.diaChi, nv.gt, nv.getPhongBan(), nv.getHeSoLuong(), nv.getThamNien(), nv.getLuongCb(), nv.getLuong()};
            m3.addRow(rowData);
        }
        table1.setModel(m3);
    }
}
