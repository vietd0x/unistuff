package tryhard.De7;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ArrayList<ThiSinh> ds = new ArrayList<ThiSinh>();

        Scanner sc = new Scanner(System.in);
        System.out.println("Nhap so luong thi sinh: "); int n = Integer.parseInt(sc.nextLine());
        for(int i = 0; i < n; i++){
            System.out.println("Ban muon nhap thi sinh khoi nao");
            String s = sc.nextLine();
            if(s.equals("A") || s.equals("a")){
                ThiSinh tsa = new ThiSinhKhoiA();
                tsa.nhap();
                ds.add(tsa);
            }else if(s.equals("C") || s.equals("c")){
                ThiSinh tsc = new ThiSinhKhoiC();
                tsc.nhap();
                ds.add(tsc);
            }else {
                System.out.println("Nhap sai");
            }
        }
        System.out.println("--------DANH SACH THI SINH TRUNG TUYEN----------");
        for(ThiSinh sv: ds){
            if(sv.dtb() > 5.5)
                sv.hienThi();
        }
    }
}
