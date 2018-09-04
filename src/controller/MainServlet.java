package controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blogDao.Admin;
import blogDao.BlogInfo;
import dataQuery.BlogQuery;

/**
 * Servlet implementation class IndexService
 */
@WebServlet("/IndexService")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String op = request.getParameter("op");
		if (op.equals("login")) {
			this.doLogin(request, response);
		} else if (op.equals("logout")) {
			this.doLogout(request, response);
		} else if (op.equals("edit")) {
			this.doEdit(request, response);
		} else if (op.equals("modify")) {
			this.doModify(request, response);
		} else if (op.equals("delete")) {
			this.doDelete(request, response);
		} else if (op.equals("editAbout")) {
			this.doEditAbout(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Admin admin = BlogQuery.getAdmin(username, password);
		if (admin == null) {
			request.setAttribute("error", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			response.sendRedirect("modifyBlog.jsp");
		}
	}

	protected void doLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		response.sendRedirect("login.jsp");
	}

	protected void doEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		Calendar c = Calendar.getInstance(TimeZone.getTimeZone("GMT+08:00"));
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		int visited = 0;
		String time = year + "-" + month + "-" + day;
		int i = BlogQuery.writeBlog(title, text, type, author, time, visited);
		if (i > 0) {
			request.setAttribute("return", "±£¥Ê≥…π¶");
			request.getRequestDispatcher("editBlog.jsp").forward(request, response);
		} else {
			request.setAttribute("return", "±£¥Ê ß∞‹");
			request.getRequestDispatcher("editBlog.jsp").forward(request, response);
		}
	}

	protected void doModify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String type = request.getParameter("type");
		String author = request.getParameter("author");
		BlogQuery.modifyBlog(id, title, text, type, author);
		request.getRequestDispatcher("modifyBlog.jsp").forward(request, response);
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		BlogQuery.deleteBlog(id);
		request.getRequestDispatcher("modifyBlog.jsp").forward(request, response);
	}

	protected void doEditAbout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String text = request.getParameter("text");
		int i = BlogQuery.editAboutMe(id, text);
		request.setAttribute("editAboutReturn", i);
		request.getRequestDispatcher("modifyAbout.jsp").forward(request, response);
	}
}
