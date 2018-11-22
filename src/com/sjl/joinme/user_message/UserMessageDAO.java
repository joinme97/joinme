package com.sjl.joinme.user_message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sjl.joinme.database.JoinMeDB;

public class UserMessageDAO {
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Connection conn = null;

	public boolean sendUserMessage(int sender_id, int receiver_id, String message) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}

		try {
			String query = "insert into user_message(sender_id,receiver_id,message) values(?,?,?)";
			ps = conn.prepareStatement(query);
			ps.setInt(1, sender_id);
			ps.setInt(2, receiver_id);
			ps.setString(3, message);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("+++Exception at SendUserMessage" + e);
		} finally {
			conn = null;
			ps = null;
			return flag;

		}
	}

	public boolean editUserMessageStatus(int user_message_id, String newStatus) {
		boolean flag = false;
		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {
			String query = "update user_message set status=? where user_message_id=?";
			ps = conn.prepareStatement(query);
			ps.setString(1, newStatus);
			ps.setInt(2, user_message_id);

			if (ps.executeUpdate() > 0) {
				flag = true;
			}

		} catch (Exception e) {
			System.out.println("+++Exception at editUserMessageStatus"+e);
		} finally {
			conn = null;
			ps = null;
			return flag;
		}
	}

	/* message,sender_id,receiver_id */
	public ArrayList<UserMessageDTO> receiveUserMessage(int sender_id, int receiver_id, String status, String dateFrom,
			String dateTo) {
		ArrayList<UserMessageDTO> list = new ArrayList<>();
		UserMessageDTO dto = null;

		if (conn == null) {
			conn = JoinMeDB.getConnection();
		}
		try {/* created_datetime */

			String query = "select message,user_message_id from user_message where sender_id=? and receiver_id=? and created_datetime>? and created_datetime<? and status=? ";
			ps = conn.prepareStatement(query);
			ps.setInt(1, sender_id);
			ps.setInt(2, receiver_id);
			ps.setString(3, dateFrom);
			ps.setString(4, dateTo);
			ps.setString(5, status);

			rs = ps.executeQuery();
			while (rs.next()) {
				dto = new UserMessageDTO();
				dto.setMessage(rs.getString("message"));
				dto.setCreated_datetime(rs.getString("created_datetime"));
				dto.setReceiver_id(rs.getInt("receiver_id"));
				dto.setSender_id(rs.getInt("sender_id"));
				dto.setUser_message_id(rs.getInt("user_message_id"));
				System.out.println(dto.getMessage());
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("+++Exception at receiveUserMessage"+e);
		} finally {
			if (list.isEmpty()) {
				return null;
			}
			conn = null;
			ps = null;
			rs = null;
			return list;
		}
	}

}
