package com.sjl.joinme.activity_request;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.joinme.database.JoinMeDB;

public class ActivityRequestDAO {
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Connection conn = null;

	public boolean addActivityRequest(int user_id, String requested_activity_name) {
		boolean flag = false;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "insert into activity_request(user_id, requested_activity_name, status) " + "values(?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, user_id);
			ps.setString(2, requested_activity_name);
			ps.setString(3, "n");
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addActivityRequest: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
			return flag;
		}
	}

	public ArrayList<ActivityRequestDTO> getRequestedActivityByID(int user_id) {
		ArrayList<ActivityRequestDTO> al = new ArrayList<>();
		ActivityRequestDTO dto = null;
		try {
			if (conn == null) {
				conn = JoinMeDB.getConnection();
			}
			String query = "select * from activity_request where user_id = " + user_id;
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new ActivityRequestDTO();
				dto.setActivity_request_id(rs.getInt("activity_request_id"));
				dto.setRequested_activity_name(rs.getString("requested_activity_name"));
				dto.setStatus(rs.getString("status"));
				dto.setUser_id(rs.getInt("user_id"));
				al.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception in addActivityRequest: " + e);
		} finally {
			if (al.isEmpty()) {
				al = null;
			}
			rs = null;
			ps = null;
			conn = null;
			return al;
		}
	}

	public void checkRequestedActivities(String activity_name) {
		try {
			if (conn == null)
				conn = JoinMeDB.getConnection();
			String query = "update activity_request set status='a' where requested_activity_name like '%"
					+ activity_name + "%'";
		} catch (Exception e) {
			System.out.println("+++Exception in checkRequestedActivities: " + e);
		} finally {
			rs = null;
			ps = null;
			conn = null;
		}
	}

	public static void main(String[] args) {
		System.out.println(new ActivityRequestDAO().getRequestedActivityByID(62));
	}
}
