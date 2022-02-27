package tryhard.De3;

import javax.swing.*;
import java.io.BufferedReader;
import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList listNV = new ArrayList<>();
        // read file
        try{
            File f = new File("C:\\Users\\vietd\\Desktop\\nv.txt");
            BufferedReader br = Files.newBufferedReader(f.toPath());
            String line = null;
            while(true){
                line = br.readLine();
                if(line == null)
                    break;
                String[] ar = line.split("\\$");
                NhanVien nv = new NhanVien(ar[0], ar[1], ar[2], ar[3], ar[4], Float.parseFloat(ar[5]), Float.parseFloat(ar[7]), Integer.parseInt(ar[6]));
                listNV.add(nv);
            }
            br.close();
        }catch (Exception err){
            err.printStackTrace();
            JOptionPane.showMessageDialog(null, "false read file");
        }

//        for (int i = 0; i < listNV.size(); i++) {
//            NhanVien nv = (NhanVien) listNV.get(i);
//            nv.hienThi();
//        }
        Table3 myTab = new Table3();
        myTab.setData(listNV);
    }
}
