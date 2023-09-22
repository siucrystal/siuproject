package hellojsp;

public class CalService {
	public CalDTO cal(CalDTO dto) {
		int result = 0;
		int a = dto.getA();
	    int b = dto.getB();
	    String sel = dto.getSel();
		
        if(sel.equals("+")) {
        	result = a + b;
   		} else  if(sel.equals("-")) {
        	result = a - b;
   		} else  if(sel.equals("*")) {
        	result = a * b;
   		} else  if(sel.equals("/")) {
   			if (a == 0)result = 0;
			else result = a / b;
		} else if (sel.equals("%")) {
			if (a == 0) result = 0;
			else result = a % b;
		}
		dto.setResult(result);
		return dto;
	}
}
