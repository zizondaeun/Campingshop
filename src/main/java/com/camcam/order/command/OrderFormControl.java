package com.camcam.order.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.camcam.common.Control;
import com.camcam.delivery.service.DeliveryService;
import com.camcam.delivery.service.impl.DeliveryServiceImpl;
import com.camcam.delivery.vo.DeliveryVO;
import com.camcam.order.service.OrderService;
import com.camcam.order.service.impl.OrderServiceImpl;
import com.camcam.order.vo.OrderDetailVO;
import com.camcam.order.vo.OrderVO;
import com.camcam.product.vo.ProductVO;

public class OrderFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원 아이디, 주소, 상품번호, 수량, 총금액
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String address = req.getParameter("address");
		String productNo = req.getParameter("productNo");
		String qty = req.getParameter("qty");
		String amount = req.getParameter("amount");

		// 주문 테이블 데이터 추가
		OrderVO order = new OrderVO();
		order.setUserId(userId);
		order.setAddress(address);
		order.setAmount(Integer.parseInt(amount));

		OrderService orderService = new OrderServiceImpl();
		boolean orderComp = false;
		if (orderService.addOrder(order)) {
			int orderNo = orderService.getOrderNo();

			String[] productNoList = productNo.split(",");
			String[] productCntList = qty.split(",");

			for (int i = 0; i < productNoList.length; i++) {
				OrderDetailVO orderDetail = new OrderDetailVO();
				ProductVO product = orderService.getProductInfo(Integer.parseInt(productNoList[i]));

				orderDetail.setOrderNo(orderNo);
				orderDetail.setUserId(userId);
				orderDetail.setQuantity(Integer.parseInt(productCntList[i]));
				orderDetail.setProductName(product.getProductName());

				if (Integer.parseInt(product.getOffPrice()) == 0) {
					orderDetail.setPrice(Integer.parseInt(product.getPrice()));
				} else {
					orderDetail.setPrice(Integer.parseInt(product.getOffPrice()));
				}

				orderComp = orderService.addOrderDetail(orderDetail);
			}
			if (orderComp) {
				DeliveryVO dvo = new DeliveryVO();
				dvo.setUserId(userId);
				dvo.setOrderNo(orderNo);
				DeliveryService deliveryService = new DeliveryServiceImpl();
				deliveryService.addDelivery(dvo);
			}

			req.setAttribute("productNo", productNo);
			String path = "orderSuccess.do";
			req.getRequestDispatcher(path).forward(req, resp);
		} else {
			System.out.println("주문 실패");
			resp.sendRedirect("orderFailed.do");
		}

	}

}
