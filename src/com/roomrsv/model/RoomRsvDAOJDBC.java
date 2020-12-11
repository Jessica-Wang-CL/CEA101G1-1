package com.roomrsv.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.List;

import com.roomtype.model.RoomTypeService;
import com.roomtype.model.RoomTypeVO;

public class RoomRsvDAOJDBC implements RoomRsvDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:11521:XE";
	String userid = "yaji";
	String passwd = "123456";
	
	private static final String CREATERSVDATE = "INSERT INTO ROOM_RSV (RSV_DATE, RM_TYPE, RM_LEFT) VALUES (?, ?, ?)";
	private static final String UPDATE = "UPDATE ROOM_RSV SET RM_TYPE = ?, RM_LEFT =? WHERE RSV_DATE = ?";
	private static final String DELETE = "DELETE FROM ROOM_RSV WHERE RSV_DATE = ?";
	private static final String GETONEBYDATE = "SELECT * FROM ROOM_RSV WHERE RSV_DATE = ?";
	private static final String GETALL = "SELECT * FROM ROOM_RSV ORDER BY RSV_DATE";
	private static final String GETALLBYRMTYPE = "SELECT * FROM ROOM_RSV WHERE RM_TYPE = ? ORDER BY RSV_DATE";
	
	@Override
	public void insert(Date rsvDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(CREATERSVDATE);
			RoomTypeService rmTypeSvc = new RoomTypeService();
			List<RoomTypeVO> rmtypes = rmTypeSvc.getAll();
			for (RoomTypeVO rmtypevo : rmtypes) {
				pstmt.setDate(1, rsvDate);
				pstmt.setString(2, rmtypevo.getRm_type());
				pstmt.setInt(3, rmtypevo.getRm_qty());
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(Date rsvDate, String rmType, Integer rmLeft) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setString(1, rmType);
			pstmt.setInt(2, rmLeft);
			pstmt.setDate(3, rsvDate);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(Date rsvDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(DELETE);
			pstmt.setDate(1, rsvDate);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public List<RoomRsvVO> getAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RoomRsvVO> roomRsv = new ArrayList<>();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(GETALL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				RoomRsvVO rsvvo = new RoomRsvVO();
				rsvvo.setRsv_date(rs.getDate("RSV_DATE"));
				rsvvo.setRm_type(rs.getString("RM_TYPE"));
				rsvvo.setRm_left(rs.getInt("RM_LEFT"));
				roomRsv.add(rsvvo);
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return roomRsv;
	}

	@Override
	public RoomRsvVO getOneByDate(Date rsvDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RoomRsvVO rsvvo = new RoomRsvVO();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(GETONEBYDATE);
			pstmt.setDate(1, rsvDate);
			rs = pstmt.executeQuery();

			rs.next();
			rsvvo = new RoomRsvVO();
			rsvvo.setRsv_date(rs.getDate("RSV_DATE"));
			rsvvo.setRm_type(rs.getString("RM_TYPE"));
			rsvvo.setRm_left(rs.getInt("RM_LEFT"));
			
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return rsvvo;
	}

	@Override
	public List<RoomRsvVO> getAllByRmType(String rmType) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<RoomRsvVO> roomRsv = new ArrayList<>();
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userid, passwd);
			pstmt = conn.prepareStatement(GETALLBYRMTYPE);
			pstmt.setString(1, rmType);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RoomRsvVO rsvvo = new RoomRsvVO();
				rsvvo.setRsv_date(rs.getDate("RSV_DATE"));
				rsvvo.setRm_type(rs.getString("RM_TYPE"));
				rsvvo.setRm_left(rs.getInt("RM_LEFT"));
				roomRsv.add(rsvvo);
			}
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return roomRsv;
	}
	
	public static void main(String[] args) {
		
	}
}
