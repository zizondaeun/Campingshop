package com.camcam.delivery.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.delivery.service.DeliveryService;
import com.camcam.delivery.service.impl.DeliveryServiceImpl;

public class DeliveryStatusControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String deliNo = req.getParameter("deliNo");
		
		DeliveryService svc = new DeliveryServiceImpl();
		
		if(svc.modifyDelivery(Integer.parseInt(deliNo))) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		
		
		
	}	
}
