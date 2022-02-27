package tryhard.De5;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class Form5 extends JFrame{
    private JPanel panel1;
    private JTextField tfmasv;
    private JTextField tfhoten;
    private JTextField tfngaysinh;
    private JTextField tfdiachi;
    private JTextField tfhocphi;
    private JTextField tfdonvi;
    private JTextField tfluong;
    private JRadioButton rbtsvattt;
    private JRadioButton rbtsvmm;
    private JRadioButton rbtnam;
    private JRadioButton rbtnu;
    private JButton saveButton;

    public Form5(){
        setVisible(true);
        setContentPane(panel1);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
        setSize(400, 350);

        rbtsvattt.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tfhocphi.setEnabled(true);
                tfdonvi.setEnabled(false);
                tfluong.setEnabled(false);
            }
        });
        rbtsvmm.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                tfhocphi.setEnabled(false);
                tfdonvi.setEnabled(true);
                tfluong.setEnabled(true);
            }
        });
        saveButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(!rbtsvattt.isSelected() && !rbtsvmm.isSelected()){
                    JOptionPane.showMessageDialog(null, "chon loai sv");
                    return;
                }

                if(rbtsvattt.isSelected()){
                    if(isSatisfiedSVATTT()){
                        SinhvienATTT svat = new SinhvienATTT(tfmasv.getText(), tfhoten.getText(), tfngaysinh.getText(), rbtnam.isSelected() ? "Nam" : "Nu", 5.9f, Float.parseFloat(tfhocphi.getText()));
                        try{
                            // write file
                            PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\vietd\\Desktop\\svattt.txt", true));
                            pw.println(svat.toString());
                            pw.flush();
                            pw.close();
                        }catch (Exception err){
                            JOptionPane.showMessageDialog(null, "ghi file that bai");
                        }
                    }else
                        JOptionPane.showMessageDialog(null, "Dien thieu thong tin");
                }else{
                    if(isSatisfiedSVMM()){
                        try{
                            SinhvienMatMa svmm = new SinhvienMatMa(tfmasv.getText(), tfhoten.getText(), tfngaysinh.getText(), rbtnam.isSelected() ? "Nam" : "Nu", 5.5f, tfdonvi.getText(), Float.parseFloat(tfluong.getText()));
                            // write file
                            PrintWriter pw = new PrintWriter(new FileOutputStream("C:\\Users\\vietd\\Desktop\\svmm.txt", true));
                            pw.println(svmm.toString());
                            pw.flush();
                            pw.close();
                        }catch (Exception err){
                            JOptionPane.showMessageDialog(null, "ghi file that bai");}
                    }else
                        JOptionPane.showMessageDialog(null, "Dien thieu thong tin");
                }
            }
        });
    }

    public boolean isSatisfiedSVATTT(){
        if((!rbtsvattt.isSelected() && !rbtsvmm.isSelected()) || (!rbtnam.isSelected() && !rbtnu.isSelected())
        || tfmasv.getText().equals("") || tfhoten.getText().equals("") || tfngaysinh.getText().equals("") || tfdiachi.getText().equals("")
        || tfhocphi.getText().equals("")){
            return false;
        }else
            return true;
    }
    public boolean isSatisfiedSVMM(){
        if((!rbtsvattt.isSelected() && !rbtsvmm.isSelected()) || (!rbtnam.isSelected() && !rbtnu.isSelected())
                || tfmasv.getText().equals("") || tfhoten.getText().equals("") || tfngaysinh.getText().equals("") || tfdiachi.getText().equals("")
                || tfdonvi.getText().equals("") || tfluong.getText().equals("")){
            return false;
        }else
        return true;
    }
    public static void main(String[] args) {
        Form5 myform = new Form5();
    }

}
