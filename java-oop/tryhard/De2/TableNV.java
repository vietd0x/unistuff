package tryhard.De2;

import tryhard.De3.NhanVien;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.util.ArrayList;

public class TableNV extends JFrame{
    private JTable table1;
    private JPanel panel1;

    public TableNV(){
        setContentPane(panel1);
        setVisible(true);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
    }
    public void setData(ArrayList ar){
        DefaultTableModel m = new DefaultTableModel();
        m.addColumn("Ho ten");
        m.addColumn("Ngay sinh");
        m.addColumn("Dia chi");
        m.addColumn("Gioi tinh");
        m.addColumn("Phong ban");
        m.addColumn("He so luong");
        m.addColumn("Tham nien");
        m.addColumn("Luong co ban");
        m.addColumn("Luong thuc linh");

        for (int i = 0; i < ar.size(); i++) {
            NhanVien nv = (NhanVien) ar.get(i);
//            Object[] rowData = {nv.hoTen, nv.ngaySinh,  nv.diaChi, nv.gt, nv.getPhongBan(), nv.getHeSoLuong(), nv.getThamNien(), nv.getLuongCb(), nv.getLuong()};
//            m.addRow(rowData);
        }
        table1.setModel(m);
    }
}
