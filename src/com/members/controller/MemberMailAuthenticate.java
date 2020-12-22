package com.members.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@WebServlet("/DaimondAuth")
public class MemberMailAuthenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static JedisPool pool = null;

	public void init() {
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxTotal(8);
		config.setMaxIdle(8);
		config.setMaxWaitMillis(10000);
		pool = new JedisPool(config, "localhost", 6379);
	}

	public void destroy() {
		if (pool != null)
			pool.destroy();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		String authCode = req.getParameter("memberAuthCode");
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		System.out.println(jedis.ping());
		jedis.close();
	}

}
