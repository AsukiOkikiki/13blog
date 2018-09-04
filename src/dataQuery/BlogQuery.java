package dataQuery;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import blogDao.AboutMe;
import blogDao.Admin;
import blogDao.BlogInfo;

public class BlogQuery {
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();

	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public static DataSource getDataSource() {
		return dataSource;
	}

	public static List<BlogInfo> getAllText() {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "select*from blog_text";
			List<BlogInfo> list = qr.query(sql, new BeanListHandler<BlogInfo>(BlogInfo.class));
			con.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<BlogInfo> getSearchText(String term) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "select * from blog_text where title like '%" + term + "%' or text like '%" + term + "%'";
			List<BlogInfo> list = qr.query(sql, new BeanListHandler<BlogInfo>(BlogInfo.class));

			con.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<BlogInfo> getTypeCount(String type) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "select * from blog_text where type='" + type + "'";
			List<BlogInfo> list = qr.query(sql, new BeanListHandler<BlogInfo>(BlogInfo.class));
			con.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<BlogInfo> getBlogText(String id) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "select * from blog_text where id=" + id;
			List<BlogInfo> list = qr.query(sql, new BeanListHandler<BlogInfo>(BlogInfo.class));
			con.close();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Admin getAdmin(String term1, String term2) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "select * from admin where username='" + term1 + "' and password='" + term2 + "'";
			Admin admin = qr.query(sql, new BeanHandler<Admin>(Admin.class));
			con.close();
			return admin;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int writeBlog(String title, String text, String type, String author, String time, int visited) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "insert into blog_text(title,text,type,author,time,visited) values (?,?,?,?,?,?)";
			Object obj[] = { title, text, type, author, time, visited };
			int i = qr.update(sql, obj);
			con.close();
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int modifyBlog(String id, String title, String text, String type, String author) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "update blog_text set title ='" + title + "',text ='" + text + "',type='" + type + "',author='"
					+ author + "'where id =" + id;
			return qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int deleteBlog(String id) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "DELETE from blog_text where id =" + id;
			return qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static AboutMe getAboutMe() {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "select*from aboutme";
			AboutMe am = qr.query(sql, new BeanHandler<AboutMe>(AboutMe.class));
			con.close();
			return am;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int editAboutMe(String id, String text) {
		try {
			Connection con = BlogQuery.getConnection();
			QueryRunner qr = new QueryRunner(BlogQuery.getDataSource());
			String sql = "update aboutme set text='" + text + "' where id=" + id;
			con.close();
			return qr.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}