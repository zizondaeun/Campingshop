package com.camcam.category.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.camcam.common.Control;
import com.camcam.product.service.ProductService;
import com.camcam.product.service.impl.ProductServiceImpl;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GetCategoryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
//		List<Map<String, Object>> cateList = new ArrayList<>();
//
//		Map<String, Object> map = new HashMap<>();
//		List<CategoryVO> list = new ArrayList<>();
//		List<String> list2 = new ArrayList<>();

		ProductService productService = new ProductServiceImpl();
		List<Map<String, String>> list = productService.categoryTemp();

		List<Map<String, Object>> categoryList = new ArrayList<>();
		Map<String, Object> catMap = null;
		List<String> catList = null;
		List<String> codeList = null;
		String curCateName = null, preCateName = null;
		for (Map<String, String> map : list) {
			String p_code, p_name, c_code, c_name, categoryCode;
			p_code = map.get("CATE_1");
			p_name = map.get("CATE_2");
			c_code = map.get("CATE_3");
			c_name = map.get("CATE_4");
			categoryCode = String.valueOf(map.get("CATEGORY_CODE"));
			
			curCateName = p_name == null ? curCateName : p_name;
			if (p_code != null) {
				catMap = new HashMap<String, Object>();
				catList = new ArrayList<>();
				codeList = new ArrayList<>();
				catMap.put("parent", p_name);
				catMap.put("parentCode", categoryCode);
			} else {
				catList.add(c_name);
				codeList.add(categoryCode);
			}
			if (!curCateName.equals(preCateName)) {
				catMap.put("child", catList);
				catMap.put("childCode", codeList);
				categoryList.add(catMap);
			}
			preCateName = curCateName;
		}
		// 결과보기.
//		for (Map<String, Object> tmap : categoryList) {
//			System.out.println(tmap);
//		}

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(categoryList);

		resp.getWriter().print(json);

//		for (Map<String, String> map : list) {
//			map.keySet();
//			for (String key : map.keySet()) {
//				System.out.println("key = " + key + " val = " + map.get(key));
//			}
//
//		}
	}

//		List<CategoryVO> categoryList = productService.categoryTemp();
//		
//		String preCode = null;
//		for (CategoryVO categoryVO : categoryList) {
////			System.out.println("loop 전 ptCode = " + categoryVO.getPtCat() + " preCode = " + preCode);
//			if(!categoryVO.getPtCat().equals(preCode)) {
//				System.out.println("categoryVO = " + categoryVO);
//				preCode = categoryVO.getPtCat();
////				System.out.println(preCode);
//				list.add(categoryVO);
//			} else {
//				list.add(categoryVO);
//			}
//		}

//		for (CategoryVO categoryVO : ) {
//			System.out.println("1categoryVO = " + categoryVO);
//		}
//		
//		list.add("Men's Dress");
//		list.add("Women's Dress");
//		list.add("Baby's Dress");

//		map.put("대분류", "Dress");
//		map.put("소분류", list);
//		
//		cateList.add(map);
//		

}
