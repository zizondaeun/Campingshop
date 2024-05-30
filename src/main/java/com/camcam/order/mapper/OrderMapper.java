package com.camcam.order.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.camcam.order.vo.OrderDetailVO;
import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.ProductVO;
import com.camcam.user.vo.UserVO;

public interface OrderMapper {
	Map<String, Object> selectCart(@Param("userId") String userId, @Param("cartNo") int cartNo);
	UserVO selectUser(String userId);
	int insertOrder(OrderVO order);
	int selectOrderNo();
	ProductVO selectProductInfo(int productNo);
	int insertOrderDetail(OrderDetailVO orderDetail);
	
}
