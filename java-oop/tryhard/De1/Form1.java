package tryhard.De1;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class Form1 extends JFrame{
    private JTextField tfhoten;
    private JTextField tfdiachi;
    private JTextField tfemail;
    private JTextField tfmsv;
    private JTextField tfdtk;
    private JTextField tfngaysinh;
    private JRadioButton rbtnam;
    private JRadioButton rbtnu;
    private JButton btAdd;
    private JButton btSave;
    private JPanel FormNhapTT;

    public Form1(){
        // must have
        setContentPane(FormNhapTT);
        setVisible(true);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        // giua man hinh
        setLocationRelativeTo(null);
        setResizable(false);
        setSize(450, 300);

        btAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(!EmptyCheck()) {
                    Student st = new Student(tfhoten.getText(), tfdiachi.getText(),
                            rbtnam.isSelected() ? "Nam" : "Nu", tfngaysinh.getText(), tfmsv.getText(), tfemail.getText(),
                            Float.parseFloat(tfdtk.getText()));
                    st.HienThi();
                    clearTf();
                }
                else
                    JOptionPane.showMessageDialog(null, "Nhap thieu thong tin");
            }
        });
        btSave.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(!EmptyCheck()){
                    try{
                        Student st = new Student(tfhoten.getText(), tfdiachi.getText(),
                                rbtnam.isSelected() ? "Nam" : "Nu", tfngaysinh.getText(), tfmsv.getText(), tfemail.getText(),
                                Float.parseFloat(tfdtk.getText()));
                        // write file
                        PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\vietd\\Desktop\\sv.txt", true));
                        pw.println(st.hoTen + ", " + st.diaChi + ", " + st.gt + ", " + st.ngaySinh + ", " + st.getMsv() + ", " + st.getEmail() + ", " + st.getDtk());
                        pw.flush();
                        pw.close();

                        clearTf();
                    }catch (Exception err){
                        JOptionPane.showMessageDialog(null, "Luu ko thanh cong");
                    }
                }
                else
                    JOptionPane.showMessageDialog(null, "Nhap thieu thong tin");
            }
        });
    }

    public boolean EmptyCheck(){
        return tfhoten.getText().equals("") || tfdiachi.getText().equals("") || tfngaysinh.getText().equals("") ||
                (!rbtnam.isSelected() && !rbtnu.isSelected()) || tfmsv.getText().equals("") || tfemail.getText().equals("") ||
                tfdtk.getText().equals("");
    }

    public void clearTf(){
        tfhoten.setText("");
    }
    public static void main(String[] args) {
        Form1 myForm = new Form1();
    }
}
