package tryhard.De6;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class Dictionary extends JFrame{
    ArrayList<Word> ar;
    private JPanel panel1;
    private JTextField tfen;
    private JTextField tfvn;
    private JButton findButton;
    private JButton addButton;

    public void arrlistBanDau(){
        ar = new ArrayList<Word>();
        Word w1 = new Word(1, "one", "mot"); ar.add(w1);
        Word w2 = new Word(2, "two", "hai"); ar.add(w2);
        Word w3 = new Word(3, "three", "ba"); ar.add(w3);
        Word w4 = new Word(4, "four", "bon"); ar.add(w4);
        Word w5 = new Word(5, "five", "nam"); ar.add(w5);
        Word w6 = new Word(6, "six", "sau"); ar.add(w6);
        Word w7 = new Word(7, "seven", "bay"); ar.add(w7);
        Word w8 = new Word(8, "eight", "tam"); ar.add(w8);
    }

    public void inDict(){
        for(Word w: ar){
            System.out.println(w);
        }
    }

    public void sapxep(){
        Collections.sort(ar, new Comparator<Word>() {
            @Override
            public int compare(Word w1, Word w2) {
                return w1.getEn().compareToIgnoreCase(w2.getEn());
            }
        });
    }

    public int timKiemNhiPhan(String s){
        sapxep();
        int l = 0, r = ar.size()-1, mid;
        while (l <= r){
            mid = l + (r-l)/2;
            if(ar.get(mid).getEn().compareToIgnoreCase(s) == 0){
                return mid;
            }else if(ar.get(mid).getEn().compareToIgnoreCase(s) > 0){
                r = mid-1;
            }else{
                l = mid+1;
            }
        }
        return -1;
    }
    public Dictionary(){
        setVisible(true);
        setContentPane(panel1);
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);
        setLocationRelativeTo(null);
        setSize(300, 300);

        findButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // tim kiem nhi phan
                if(!tfen.getText().equals("")){
                    int idx = timKiemNhiPhan(tfen.getText());
                    if(idx == -1){
                        JOptionPane.showMessageDialog(null, "ko co trong tu dien");
                    }else{
                        tfvn.setText(ar.get(idx).getVn());
                    }
                }else {
                    JOptionPane.showMessageDialog(null, "Nhap tu can tim kiem");
                }
            }
        });
        addButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(!tfen.getText().equals("") && !tfvn.getText().equals("")){

                    // tim xem tu da co trong tu dien chua
                    int idx = timKiemNhiPhan(tfen.getText());
                    if(idx == -1){ // ko ton tai
                        // bo sung
                        Word w = new Word(ar.size()+1, tfen.getText(), tfvn.getText());
                        ar.add(w);
                        sapxep();
                        inDict();
                    }else{
                        JOptionPane.showMessageDialog(null, "da co trong tu dien");
                    }

                }else{
                    JOptionPane.showMessageDialog(null, "Nhap thieu thong tin");
                }
            }
        });
    }
}
