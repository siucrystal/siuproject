package hellojsp;

public class CalDTO {
	private int a,b,result;
	private String sel;
	
	public CalDTO() {
		this(0,0,0,"+");
	}
	
	public CalDTO(int a, int b, int result, String sel) {
		super();
		this.a = a;
		this.b = b;
		this.result = result;
		this.sel = sel;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getSel() {
		return sel;
	}

	public void setSel(String sel) {
		this.sel = sel;
	}

	@Override
	public String toString() {
		return "CalDTO [a=" + a + ", b=" + b + ", result=" + result + ", sel=" + sel + "]";
	}
	
}
