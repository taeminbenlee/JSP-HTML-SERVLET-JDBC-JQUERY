package main;

import dao.AccountDao;
import db.DBConnection;

import java.sql.Connection;
import java.util.Scanner;

import cls.BalanceClass;
import cls.deleteClass;
import cls.insertClass;
import cls.printAllClass;
import cls.selectDateClass;
import cls.selectUseClass;
import cls.updateClass;

public class MainClass {
	
	 
	public static void main(String[] args) {
		/*
		 * 		추가하기
		 * 		삭제하기
		 * 		날짜로 검색하기
		 * 		제목으로 검색하기	(use를 title)
		 * 		수정하기
		 * 		모두출력
		 * 		--------------------
		 * 		합계출력
		 * 
		 */
		insertClass ic = new insertClass();
		deleteClass dc = new deleteClass();
		updateClass uc = new updateClass();
		selectUseClass suc = new selectUseClass();
		selectDateClass sdc = new selectDateClass();
		printAllClass pac = new printAllClass();
		BalanceClass bc = new BalanceClass();
		int choice;
		boolean menu = true;
		Scanner sc = new Scanner(System.in);
		while(menu){   
			   
		        System.out.println("=====Account Book=====");  
		        System.out.println(" --------------------- ");  
		        System.out.println(" 1. Insert ");  
		        System.out.println(" 2. Delete ");  
		        System.out.println(" 3. Search By Date    ");  
		        System.out.println(" 4. Search By Title   ");  
		        System.out.println(" 5. Update ");  
		        System.out.println(" 6. Print All Data    "); 
		        System.out.println(" -------------------- "); 
		        System.out.println(" 7. Account Balance   ");
		        System.out.println(" 8. Exit      ");  
		        
		        System.out.print("\n");  
		        System.out.print("실행할 메뉴를 선택하세요: ");  
		        
		        choice=sc.nextInt();
		        switch(choice)	{  
		        case 1: 
		        	ic.insert();
		        	break;
		        case 2: 
		        	dc.delete();
		        	break;
		        case 3: {
		        	sdc.select();
		        	break;
		        }
		        case 4: {
		        	suc.select();
		        	break;
		        }
		        case 5: {
		        	uc.update();
		        	break;
		        }
		        case 6: {
		        	pac.printAll();
		        	break;
		        }
		        case 7: {
		        	bc.balance();
		        	break;
		        }
		        case 8: {
		        	System.out.println("프로그램 종료");
		        	menu = false;
		        	break;
		        }
		        }

		  
		   
	}
}
}