package member;

import java.util.List;

public class MemberPrint {

	public void memberPrint(List<MemberDTO> memberList){
		// 반복문
		for(MemberDTO member : memberList) {
			System.out.println(member.getId());
		}
		
		for(int i=0; i<memberList.size(); i++) {
			System.out.println(memberList.get(i).getId());
		}
	}

}
