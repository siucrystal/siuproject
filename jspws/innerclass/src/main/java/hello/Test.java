package hello;

import java.util.ArrayList;
import java.util.List;

import member.MemberDTO;
import member.MemberPrint;

public class Test {

	public static void main(String[] args) {
		//1. 변수 선언 및 초기화
		int ii = 0;
		String s = "";
		ii = 10;
		s = "hong";
		
		//2. 배열 선언 및 초기화 - index
		int[] iArr = new int[4]; // 선언		
		iArr[0] = 0;
		iArr[1] = 1;
		iArr[2] = 2;
		iArr[3] = 3;
		int[] iArr2 = {0,1,2,3};
		int add = iArr[1] + iArr2[1];
		
		String[] sArr = new String[4];
		sArr[0] = "a";
		sArr[1] = "b";
		sArr[2] = "c";
		sArr[3] = "d";
		String[] sArr2 = {"a","b","c","d"};
		String sAdd =  sArr[1] + sArr2[1];
			
		String ss = "a,b,c,d";
		String[] sAdd3 = ss.split(",");
				
		//3. 반복문으로 배열 사용
		for(int i=0; i<4; i++) {
			iArr[i] = i;
		}
		for(int i=0; i<4; i++) {
			int rs = iArr[i] * 2;
			System.out.println(rs);
		}
		
		//4. MemberDTO
		String id = "";
		String pw = "";
		String name = "";
		int age = 0;
		
		// 1
		id = "1111";
		
		MemberDTO member1 = new MemberDTO();
		member1.setId("1111"); 
		
		MemberDTO member2 = new MemberDTO();
		member2.setId("2222");
		
		MemberDTO member3 = new MemberDTO("3333","3333","3333",33);
		
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();
		memberList.add(member1);
		memberList.add(member2);
		memberList.add(member3);
		
		MemberPrint mp = new  MemberPrint();
		mp.memberPrint(memberList);
		
		// 
	}

}
