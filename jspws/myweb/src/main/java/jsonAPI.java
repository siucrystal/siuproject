

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import member.MemberDAO;
import member.MemberDTO;


@WebServlet("*.json")
public class jsonAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public jsonAPI() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
	}
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		String uri = request.getRequestURI();
		System.out.println(uri); // /myweb/memberList.do
		String action = uri.substring(uri.lastIndexOf("/"));
		
		if (action.equals("/joinJson.do")) {
			response.sendRedirect("joinJson.jsp");
		} else if (action.equals("/getMemberjson.do")) {
			response.sendRedirect("getMemberjson.jsp");
		}else if (action.equals("/joinProcAjax.do")) {
			response.sendRedirect("joinProcAjax.jsp");
		}else if (action.equals("/memberListData.json")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getMemberList();
			
			String gson = new Gson().toJson(list);
			response.getWriter().write(gson);
		}
	}

}
