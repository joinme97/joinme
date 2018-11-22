package com.sjl.joinme.created_activity_list;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.joinme.database.JoinMeDB;

public class CreatedActivityListDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean addCreatedActivityList(CreatedActivityListDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "insert into created_activity_list(tag_id, user_id,"
					+ " cost, activity_name, activity_description, activity_date, status,lat,lng)"
					+ " values(?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getTag_id());
			ps.setInt(2, dto.getUser_id());
			ps.setInt(3, dto.getCost());
			ps.setString(4, dto.getActivity_name());
			ps.setString(5, dto.getActivity_description());
			ps.setString(6, dto.getActivity_date());
			ps.setString(7, "" + dto.getStatus());
			ps.setString(8, dto.getLat());
			ps.setString(9, dto.getLng());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addCreatedActivityList:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean updateCreatedActivityList(CreatedActivityListDTO dto) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "update created_activity_list set tag_id=?, user_id=?,cost=?,"
					+ " activity_name=?, activity_description=?, activity_date=?, status=? where tag_id="
					+ dto.getActivity_id();
			ps = conn.prepareStatement(query);
			ps.setInt(1, dto.getTag_id());
			ps.setInt(2, dto.getUser_id());
			ps.setInt(3, dto.getCost());
			ps.setString(4, dto.getActivity_name());
			ps.setString(5, dto.getActivity_description());
			ps.setString(6, dto.getActivity_date());
			ps.setString(7, "" + dto.getStatus());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in updateCreatedActivityList:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public boolean deleteActivity(int activity_id) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "delete from created_activity_list where activity_id=" + activity_id;
			ps = conn.prepareStatement(query);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in deleteCreatedActivityList:" + e);
		} finally {
			ps = null;
			conn = null;
			return flag;
		}
	}

	public int incrementCount(int activity_id) {
		int count = getCount(activity_id) + 1;
		int flag = -1;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "update created_activity_list set count=? where activity_id=" + activity_id;
			ps = conn.prepareStatement(query);
			ps.setInt(1, count);
			if (ps.executeUpdate() > 0) {
				flag = count;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in incrementCount:" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public static void main(String[] args) {
		System.out.println(new CreatedActivityListDAO().incrementCount(34));
	}

	public int getCount(int activity_id) {
		int count = -1;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select count from created_activity_list where activity_id=" + activity_id;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getCount:" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return count;
		}
	}

	public int setCount(int activity_id, int count) {
		int flag = -1;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "update created_activity_list set count=? where activity_id=" + activity_id;
			ps = conn.prepareStatement(query);
			ps.setInt(1, count);
			if (ps.executeUpdate() > 0) {
				flag = count;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in setCount:" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return flag;
		}
	}

	public CreatedActivityListDTO getCreatedActivityList(int activity_id) {
		CreatedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from created_activity_list where activity_id=" + activity_id;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new CreatedActivityListDTO();
				dto.setActivity_date(rs.getString("activity_date"));
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setActivity_description(rs.getString("activity_description"));
				dto.setStatus(rs.getString("status").charAt(0));
				dto.setTag_id(rs.getInt("tag_id"));
				dto.setUser_id(rs.getInt("user_id"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getCreatedActivityList:" + e);
		} finally {
			ps = null;
			rs = null;
			conn = null;
			return dto;
		}
	}

	public ArrayList<CreatedActivityListDTO> getAllCreatedActivityListOrderByCount() {
		ArrayList<CreatedActivityListDTO> al = new ArrayList<>();
		CreatedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from created_activity_list order by count desc";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new CreatedActivityListDTO();
				dto.setActivity_date(rs.getString("activity_date"));
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setActivity_description(rs.getString("Activity_description"));
				dto.setStatus(rs.getString("status").charAt(0));
				dto.setTag_id(rs.getInt("tag_id"));
				dto.setUser_id(rs.getInt("user_id"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCount(rs.getInt("count"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllCreatedActivityList:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}

	public ArrayList<CreatedActivityListDTO> getAllCreatedActivityListWithuserID(int user_id) {
		ArrayList<CreatedActivityListDTO> al = new ArrayList<>();
		CreatedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from created_activity_list where user_id=" + user_id;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new CreatedActivityListDTO();
				dto.setActivity_date(rs.getString("activity_date"));
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setActivity_description(rs.getString("Activity_description"));
				dto.setStatus(rs.getString("status").charAt(0));
				dto.setTag_id(rs.getInt("tag_id"));
				dto.setUser_id(rs.getInt("user_id"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setCount(rs.getInt("count"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllCreatedActivityListWithuserID:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}

	public ArrayList<CreatedActivityListDTO> getAllCreatedActivityListWithTagID(int tag_id) {
		ArrayList<CreatedActivityListDTO> al = new ArrayList<>();
		CreatedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from created_activity_list where tag_id='" + tag_id + "'";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new CreatedActivityListDTO();
				dto.setActivity_date(rs.getString("activity_date"));
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setActivity_description(rs.getString("Activity_description"));
				dto.setStatus(rs.getString("status").charAt(0));
				dto.setTag_id(rs.getInt("tag_id"));
				dto.setUser_id(rs.getInt("user_id"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllCreatedActivityList:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}
	
	public ArrayList<CreatedActivityListDTO> getAllCreatedActivityListWithTagName(String tag_name) {
		ArrayList<CreatedActivityListDTO> al = new ArrayList<>();
		CreatedActivityListDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "SELECT * FROM created_activity_list inner join tags on tags.tag_id="
					+ "created_activity_list.tag_id and tags.tag='" + tag_name + "'";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new CreatedActivityListDTO();
				dto.setActivity_date(rs.getString("activity_date"));
				dto.setActivity_id(rs.getInt("activity_id"));
				dto.setActivity_name(rs.getString("activity_name"));
				dto.setCost(rs.getInt("cost"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setActivity_description(rs.getString("Activity_description"));
				dto.setStatus(rs.getString("status").charAt(0));
				dto.setTag_id(rs.getInt("tag_id"));
				dto.setUser_id(rs.getInt("user_id"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in getAllCreatedActivityListWithTagName:" + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			ps = null;
			rs = null;
			conn = null;
			return al;
		}
	}
}
