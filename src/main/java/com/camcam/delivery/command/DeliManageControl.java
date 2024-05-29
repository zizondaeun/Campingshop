package com.camcam.delivery.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.common.HttpUtils;
import com.camcam.delivery.service.DeliveryService;
import com.camcam.delivery.service.impl.DeliveryServiceImpl;
import com.camcam.delivery.vo.DeliveryVO;

public class DeliManageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "delivery/deliveryList.tiles";
		
		DeliveryService svc = new DeliveryServiceImpl();
		List<DeliveryVO> list = svc.deliveryList();
		
		System.out.println("배송리스트확인" + list);
		
		req.setAttribute("deliveryList", list);
		
		
		HttpUtils.forward(req, resp, path);
	}	

}
