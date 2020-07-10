package com.bota.util;

import java.util.Map;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class Redis {
	private static JedisPool pool = null;

	/**
	 * 锟斤拷锟斤拷redis锟斤拷锟接筹拷
	 * 
	 * @param ip
	 * @param port
	 * @return JedisPool
	 */
	public static JedisPool getPool() {
		if (pool == null) {
			JedisPoolConfig config = new JedisPoolConfig();
			
			config.setMaxActive(500);
			
			config.setMaxIdle(5);
			
			config.setMaxWait(1000 * 100);
			config.setTestOnBorrow(true);
			pool = new JedisPool(config, "192.168.0.159");
		}
		return pool;
	}

	/**
	 * 
	 * 
	 * @param pool
	 * @param redis
	 */
	public static void returnResource(JedisPool pool, Jedis redis) {
		if (redis != null) {
			pool.returnResource(redis);
		}
	}

	/**
	 * 
	 * 
	 * @param key
	 * @return
	 */
	public static String get(String key) {
		String value = null;

		JedisPool pool = null;
		Jedis jedis = null;
		try {
			pool = getPool();
			jedis = pool.getResource();
			value = jedis.get(key);
		} catch (Exception e) {
		
			pool.returnBrokenResource(jedis);
			e.printStackTrace();
		} finally {
		
			returnResource(pool, jedis);
		}
		return value;
	}

	/**
	 * 
	 * 
	 * @param key
	 * @return
	 */
	public static void set(String key, String value) {
		JedisPool pool = null;
		Jedis jedis = null;
		try {
			pool = getPool();
			jedis = pool.getResource();
			jedis.set(key, value);
		} catch (Exception e) {
			
			pool.returnBrokenResource(jedis);
			e.printStackTrace();
		} finally {
			
			returnResource(pool, jedis);
		}
	}

	/**
	 * 
	 * 
	 * @param mapStr
	 * @return
	 */
	public static void set(String key, Map<String, String> mapStr) {
		JedisPool pool = null;
		Jedis jedis = null;
		try {
			pool = getPool();
			jedis = pool.getResource();
			jedis.hmset(key, mapStr);
		} catch (Exception e) {
			
			pool.returnBrokenResource(jedis);
			e.printStackTrace();
		} finally {
			
			returnResource(pool, jedis);
		}
	}

	/**
	 *
	 * 
	 * @param mapStr
	 * @return
	 */
	public static boolean exist(String key) {
		JedisPool pool = null;
		Jedis jedis = null;
		boolean bool = false;
		try {
			pool = getPool();
			jedis = pool.getResource();
			bool = jedis.exists(key);
		} catch (Exception e) {
			
			pool.returnBrokenResource(jedis);
			e.printStackTrace();
		} finally {
			
			returnResource(pool, jedis);
		}
		return bool;
	}
	
	public static void outAllInfo() {
		JedisPool pool = null;
		Jedis jedis = null;
		try {
			pool = getPool();
			jedis = pool.getResource();
			System.out.println(jedis.keys("*"));
		} catch (Exception e) {
		
			pool.returnBrokenResource(jedis);
			e.printStackTrace();
		} finally {
			returnResource(pool, jedis);
		}
	}
}
