package phase2;

import java.sql.*;
import java.util.*;

public class Users {
	public Users() {
		// Default constructor
	}

	/** good check */
	public void newUser(String login, String name, String userType, String contact_Num, String Address, String password,
			Statement st) throws SQLException {
		String sql = "insert into Users (login, name, userType, contact_Num, Address, password) " + "Values ('" + login
				+ "', '" + name + "', '" + userType + "', '" + contact_Num + "', '" + Address + "', '" + password
				+ "');";
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			throw e;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/** GOOD CHECK */
	public String isLoginMatch(String login, String password, Statement st) {
		String sql = "select login, password, userType from Users where login = '" + login + "';";
		ResultSet rs = null;
		String type = "";
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {
				// System.out.println("pwd is "+rs.getString("password") +
				// "\n\n\n\n\n\n");
				if (rs.getString("password").equals(password))
					type = rs.getString("userType");
				else {
					rs.close();
					return "false"; // Password does not match
				}
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());

		} finally {
			try {
				if (!rs.isClosed() || rs != null)
					rs.close();
			} catch (Exception e) {

			}
		}
		if (type.equals(""))
			return "false";
		else
			return type;
	}

	/** good check */
	public ArrayList<String[]> getTrustedUsers(Statement st, String amount) {
		String[] trusted;
		ArrayList<String[]> array = new ArrayList<String[]>();
		ResultSet rs = null;
		int resultCount = 0;
		if (amount.equalsIgnoreCase("ALL")) {
			String sql = "select u.name, u.login, sum(t.isTrusted) AS TotalTrust From Trust t, Users u where t.login2 = u.login"
					+ " group by u.login having sum(t.isTrusted) > 0 order by TotalTrust desc";
			try {
				rs = st.executeQuery(sql);
				while (rs.next()) {
					trusted = new String[3];
					trusted[0] = rs.getString("name");
					trusted[1] = rs.getString("login");
					trusted[2] = rs.getString("TotalTrust");
					array.add(trusted);
					resultCount++;
				}
				rs.close();

			} catch (SQLException e) {
				System.out.println(e.getMessage());

			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				if (resultCount == 0)
					return null;
			}

		} else {
			int newAmo = Integer.parseInt(amount);
			String sql = "select u.name, u.login, sum(t.isTrusted) AS TotalTrust From Trust t, Users u where t.login2 = u.login"
					+ " group by u.login having sum(t.isTrusted) > 0 order by TotalTrust desc limit " + newAmo;
			try {
				st.executeQuery(sql);
				while (rs.next()) {
					trusted = new String[3];
					trusted[0] = rs.getString("name");
					trusted[1] = rs.getString("login");
					trusted[2] = rs.getString("TotalTrust");
					array.add(trusted);
				}
				// rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());

			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				try {
					if (rs != null & !rs.isClosed())
						rs.close();
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
			}

		}
		return array;
	}

	/**
	 * public void setUserType(ArrayList<String[]> arr, Statement st) { for(int
	 * i = 0; i < arr.size(); i++) {
	 * 
	 * } }
	 */

	/** check good */
	public void trustRecording(String login1, String login2, boolean isTrusted, Statement st) {
		int trustVal;
		if (isTrusted)
			trustVal = 1;
		else
			trustVal = -1;

		String sql = "insert into Trust (login1, login2, isTrusted)" + " values ('" + login1 + "', '" + login2 + "', '"
				+ trustVal + "');";
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

	}

	// check good
	public ArrayList<String> getOneDegreeSeperation(String login, Statement st) {
		String nameALogin = login;
		ArrayList<String> forReturn = new ArrayList<String>();
		// select u.login from Users u, Favorites f1 where exists(select
		// f2.login from Favorites f2 where f1.login != f2.login and f1.hid =
		// f2.hid);

		// String sql = "select distinct u.name from Users u, Favorites f1 where
		// exists(select f2.login from Favorites where f1.login = '"
		// + nameALogin + "' and f1.login != f2.login and f1.h_id = f2.h_id;";
		String sql = "select distinct Users.name from Favorites" + " left join Users"
				+ " on Favorites.login = Users.login" + " where Favorites.h_id IN"
				+ " (select f1.h_id from Favorites f1, Favorites f2" + " where f1.login != f2.login and f1.login = '"
				+ login + "' and f1.h_id = f2.h_id)" + " and Favorites.login != '" + nameALogin + "';";
		// System.out.println(sql);
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
			while (rs.next()) {
				forReturn.add(rs.getString("name"));
			}
			if (forReturn.isEmpty())
				return forReturn;
			rs.close();
		} catch (SQLException e) {

			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			try {
				if (rs != null & !rs.isClosed())
					rs.close();
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
		}
		return forReturn;
	}

	// check good
	public ArrayList<String> getTwoDegreeSeperation(String loginA, String loginB, Statement st) {
		ArrayList<String> A_oneDegreeList = getOneDegreeSeperation(loginA, st);
		ArrayList<String> B_oneDegreeList = getOneDegreeSeperation(loginB, st);
		ArrayList<String> forReturn = new ArrayList<String>();
		if (A_oneDegreeList.isEmpty() || B_oneDegreeList.isEmpty())
			return forReturn;
		// else if(A_oneDegreeList.contains(userNameB) ||
		// B_oneDegreeList.contains(userNameA)) return forReturn;
		else if (!A_oneDegreeList.contains(loginB) && !B_oneDegreeList.contains(loginA)) {
			for (String s : A_oneDegreeList) {
				if (B_oneDegreeList.contains(s))
					forReturn.add(s);
			}
		}
		return forReturn;
	}
}
