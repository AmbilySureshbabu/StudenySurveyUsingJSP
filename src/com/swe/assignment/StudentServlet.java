package com.swe.assignment;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.swe.assignment.bean.DataBean;
import com.swe.assignment.bean.StudentBean;
import com.swe.assignment.dao.impl.StudentDAOImpl;
import com.swe.assignment.processor.DataProcessor;

/**
 * Servlet implementation class student form
 */
/**
 * @author ambily
 *
 */
@WebServlet("/studentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudentServlet() {
		super();
	}

	/**
	 * function to handle the get student
	 * 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get the query parameter
		String idString = request.getQueryString();
		// initialize return studentBean to null
		StudentBean studentBean = null;
		try {
			// if queryString is available
			if (null != idString) {
				// split the queryString based on = and since we expect the queryString in the
				// format id=<value>; read the index 1
				String id = idString.split("=")[1];
				// get the database instance object and read the student based on the
				// id(converting to int as we get it as string and in database we store as integer)
				studentBean = StudentDAOImpl.getInstance().readStudent(Integer.parseInt(id));
				// set the request attribute with the student detail
				request.setAttribute("student", studentBean);
				// forward the request to the Student.jsp and return
				request.getRequestDispatcher("Student.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// if id is not coming in the get request or any exception is thrown while
		// reading from the database redirect to the NoSuchStudent.jsp
		request.getRequestDispatcher("NoSuchStudent.jsp").forward(request, response);
	}

	/**
	 * function to handle the form post action
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get fields from UI and create the bean
		try {
			StudentBean studentBean = new StudentBean();
			studentBean.setId(request.getParameter("studentId"));
			studentBean.setUserName(request.getParameter("username"));
			studentBean.setCity(request.getParameter("city"));
			studentBean.setStreetAddress(request.getParameter("streetaddress"));
			studentBean.setTelephone(request.getParameter("tel"));
			studentBean.setDateOfSurvey(request.getParameter("dos"));
			studentBean.setEmail(request.getParameter("email"));
			studentBean.setUrl(request.getParameter("url"));
			studentBean.setZip(Integer.parseInt(request.getParameter("zip")));
			studentBean.setState(request.getParameter("state"));
			studentBean.setLikedMost(request.getParameterValues("Liked_most"));
			studentBean.setGetInterested(request.getParameter("Get_interested"));
			studentBean.setGradMonth(request.getParameter("gradmonth"));
			studentBean.setGradYear(request.getParameter("gradyear"));
			studentBean.setComments(request.getParameter("Comments"));
			studentBean.setRecommendation(request.getParameter("Recommendation"));

			// save the student to the database
			StudentDAOImpl impl = StudentDAOImpl.getInstance();
			// insert the student into the database, if any reason student insert fails it
			// will throw and exception
			impl.saveToDatabase(studentBean);

			// create a session object for the application lifetime, this will help unwanted
			// database call to retrieve all the created student forms. Only for the very
			// first time a database call will be made to retrieve all student records, that
			// will be stored in the session and all new successful database insertion of
			// the student will be added to the user session
			session = request.getSession();
			// check if the students are available in session
			Object sessionAttr = session.getAttribute("studentIds");
			List<Object> studIDList = null;
			// if the student session object is available add the new student to the
			// existing session, as the database insert is a success at this point
			if (null != sessionAttr) {
				studIDList = (List<Object>) sessionAttr;
				studIDList.add(studentBean.getId());
			} else {
				// if the students are not in session read all the student ids from the database
				studIDList = impl.readStudentIds();
			}
			// save the students to the session
			session.setAttribute("studentIds", studIDList);

			// create a data processor object
			DataProcessor processor = new DataProcessor();
			processor.setList(request.getParameter("nums"));
			// forward to winner jsp
			DataBean bean = new DataBean();
			bean.setMean(processor.getMean());
			bean.setStandartDeviation(processor.getStandardDeviation());
			request.setAttribute("dataBean", bean);
			// based on the mean result send to respective jsp file
			if (bean.getMean() >= 90) {
				request.getRequestDispatcher("WinnerAcknowledgement.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("SimpleAcknowledgement.jsp").forward(request, response);
			}

		} catch (Exception e) {
			// if the student insertion fails send to the home page with reason for the
			// error
			System.out.println("exception occurred during insertion " + e.getMessage());
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}	

}
