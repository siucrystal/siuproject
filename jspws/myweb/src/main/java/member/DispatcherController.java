package member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.google.gson.JsonObject;

/**
 * Servlet implementation class DispatcherController
 */
/* @WebServlet("/DispatcherController") */
@WebServlet("*.do")
public class DispatcherController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DispatcherController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("process");
		String uri = request.getRequestURI();
		System.out.println(uri); // /myweb/memberList.do
		String action = uri.substring(uri.lastIndexOf("/"));
		
		if(action.equals("/index.do")) {
			response.sendRedirect("index.jsp");
		}else if (action.equals("/topmenu.do")) {
			response.sendRedirect("topmenu.do");
		}else if(action.equals("/memberList.do")) {
			System.out.println("아이"); // /memberList.do
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getMemberList();
			
			request.setAttribute("list", list);
			String viewName = "memberList.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(viewName);
			rd.forward(request, response);
			
		}else if(action.equals("/memberListJstl.do")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getMemberList();
			
			request.setAttribute("list", list);
			String viewName = "memberListJstl.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(viewName);
			rd.forward(request, response);
			
		}else if (action.equals("/login.do")) {
			response.sendRedirect("login.jsp");
		}else if (action.equals("/loginProc.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			
			MemberDAO dao = new MemberDAO();
			dto = dao.getMember(dto);
			
			if(dto != null) {
				if(dto.getPw().equals(pw)) {
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("name", dto.getName());
					response.sendRedirect("index.do");
					
				}else {
					response.sendRedirect("login.do?rs=0");
				}
			}else {
				response.sendRedirect("login.do");
			}
		}else if (action.equals("/logout.do")) {
			response.sendRedirect("logout.jsp");
			System.out.println("로그아웃");
		}else if (action.equals("/update.do")) {
			response.sendRedirect("update.jsp");
		}else if (action.equals("/updateProc.do")) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			MemberDTO dto = new MemberDTO(id, pw, name, age);
			
			MemberDAO dao = new MemberDAO();
			int rs = dao.update(dto);
			
			session.setAttribute("name", name);
			response.sendRedirect("update.do");
		}else if (action.equals("/delete.do")) {
			response.sendRedirect("delete.jsp");
		}else if (action.equals("/deleteProc.do")) {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			String pw = request.getParameter("pw");
					
			MemberDTO dto = new MemberDTO();
			dto.setId(id);
			
			MemberDAO dao = new MemberDAO();
			dto = dao.getMember(dto);
			
			if (dto.getPw().equals(pw)) {
				dao.delete(dto);
				session.invalidate();			
			}
			response.sendRedirect("index.do");	
		}
		
		// 여기까지 기본 이 이후는 ajax로 한것들
		else if (action.equals("/memberListJson.do")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> list = dao.getMemberList();
			
			request.setAttribute("list", list);
			String viewName = "memberListJson.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(viewName);
			rd.forward(request, response);
		}else if (action.equals("/memberListData.do")) {
			response.sendRedirect("memberListData.jsp");
		}
		else if (action.equals("/join.do")) {
			response.sendRedirect("join.jsp");
		}
	}// end
}
