package com.shanzhu.tourism.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.shanzhu.tourism.constant.Constants;
import org.springframework.data.redis.core.StringRedisTemplate;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.TimeUnit;

/**
 * JWT工具类
 *
 * 
 * @date: 2023-11-10
 */
public class JwtUtil {

    /**
     * Token过期时间180天（用户登录过期时间是此时间的两倍，以token在reids缓存时间为准）
     */
    public static final long EXPIRE_TIME = 24 * 3 * 60 * 60 * 1000;
    public static final int days = 3;
    private static StringRedisTemplate stringRedisTemplate = SpringUtils.getBean(StringRedisTemplate.class);

    /**
     * 校验token是否正确
     */
    public static boolean verify(String token, String userId, String userPhone) {
        try {
            // 根据密码生成JWT效验器
            Algorithm algorithm = Algorithm.HMAC256(userPhone);
            JWTVerifier verifier = JWT.require(algorithm).withClaim("userId", userId).build();
            // 效验TOKEN
            verifier.verify(token);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }

    /**
     * 获得token中的信息无需secret解密也能获得
     */
    public static String getUserId(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("userId").asString();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * @生成签名,360天后过期
     */
    public static String sign(String userId, String userPhone) {
        Algorithm algorithm = Algorithm.HMAC256(userPhone);
        // 附带userId信息  可以将user信息转成map存到这里
        String token = JWT.create().withClaim("userId", userId).sign(algorithm);
        stringRedisTemplate.opsForValue().set(Constants.PREFIX_USER_TOKEN + userId, token, days, TimeUnit.DAYS);
        return token;

    }

    /**
     * 根据request中的token获取用户账号
     */
    public static String getUserIdByToken(HttpServletRequest request) {
        String accessToken = getTokenByRequest(request);
        return getUserId(accessToken);
    }

    /**
     * 获取 request 里传递的 token
     */
    public static String getTokenByRequest(HttpServletRequest request) {
        return request.getHeader(Constants.X_ACCESS_TOKEN);
    }
}

