<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/* BASIC css start */
/* aside */
#aside { position:relative; overflow:hidden }
#aside .aside-tit { padding:120px 0 30px; font-size:24px; color:#000; font-weight:bold; text-align:center; line-height:24px }
/* lnb */
#aside .lnb-wrap { padding:19px 0; border:1px solid #000;; overflow:hidden; *zoom:1 }
#aside .lnb-wrap:after { display:block; clear:both; content:'' }
#aside .lnb-wrap .lnb-bx { margin-left:-1px; padding-left:39px; float:left; width:327px; min-height:130px; border-left:1px solid #e2e2e2; overflow:hidden }
#aside .lnb-wrap .lnb-bx .txt { margin-top:14px; padding-left:27px; height:18px; font-size:14px; font-weight:bold; line-height:18px; background:url(//image.makeshop.co.kr/makeshop/d3/basic_simple/common/sp_mypage_aside.gif) 0 0 no-repeat }
#aside .lnb-wrap .lnb-bx .txt1 { background-position:0 0 }
#aside .lnb-wrap .lnb-bx .txt2 { background-position:0 -18px }
#aside .lnb-wrap .lnb-bx .txt3 { background-position:0 -36px }
#aside .lnb-wrap .lnb { overflow:hidden }
#aside .lnb-wrap .lnb ul { margin-left:-10px; padding-top:20px;  *zoom:1 }
#aside .lnb-wrap .lnb ul:after { display:block; clear:both; content:'' }
#aside .lnb-wrap .lnb ul li { padding:5px 0; float:left; white-space:nowrap }
#aside .lnb-wrap .lnb ul li a { padding:0 10px; font-size:12px; color:#8d8d8d; background:url(//image.makeshop.co.kr/makeshop/d3/basic_simple/common/bu_2x8.gif) 0 2px no-repeat }

/* BASIC css end */
</style>
<div id="contentWrapper">
	<div id="contentWrap">
		<div id="aside">
			<h2 class="aside-tit">MY PAGE</h2>
			<div class="lnb-wrap">
				<div class="lnb-bx">
					<h2 class="txt txt1">SHOPPING INFO</h2>
					<div class="lnb">
						<ul>
							<li><a>주문내역</a></li>
							<li><a>게시글 관리</a></li>
							<li><a>관심 상품</a></li>
							<li><a>회원 정보 수정, 탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- .lnb-wrap -->
		</div>
		<!-- #aside -->
		<hr />
		<div id="content">
			<div id="myOrder">
				<div class="tit-page-2">
					<h2>주문내역</h2>
					<p class="dsc">
						<span>${result.userName }</span>님께서 주문하신 내역입니다.
					</p>
				</div>
				<div class="page-body">
					<!-- 주문 내역 리스트 -->
					<div class="table-d2-list">
						<table summary="주문번호, 주문일자, 상품이름, 결제금액, 주문상세, 배송현황">
							<caption>주문내역</caption>
							<colgroup>
								<col width="70" />
								<col width="100" />
								<col width="*" />
								<col width="100" />
								<col width="90" />
								<col width="90" />
							</colgroup>
							<thead>
								<tr>
									<th scope="row"><div class="tb-center">주문번호</div></th>
									<th scope="row"><div class="tb-center">주문일자</div></th>
									<th scope="row"><div class="tb-center">상품이름</div></th>
									<th scope="row"><div class="tb-center">결제금액</div></th>
									<th scope="row"><div class="tb-center">주문상세</div></th>
									<th scope="row"><div class="tb-center">배송현황</div></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><div class="tb-center">1</div></td>
									<td><div class="tb-center">2024.05.22</div></td>
									<td><div class="tb-left">체어원 / 블랙아웃 에디션</div></td>
									<td><div class="tb-center">0원</div></td>
									<td><div class="tb-center">
											<a
												href="javascript:smart_order_detail('20240522094644-46852501202');"
												class="CSSbuttonWhite CSSbuttonMin">VIEW</a>
										</div></td>
									<td><div class="tb-center">
											<a
												href="javascript:alert('상품 주문서에 송장번호가 등록되지 않았습니다.
주문 상세 조회를 하셔서 주문 현황을 확인해주세요.')"
												class="CSSbuttonWhite CSSbuttonMin">VIEW</a>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //주문 내역 리스트 -->

					<!-- 주문 내역 페이징 -->
					<div class="paging">
						<a
							href="/shop/mypage.html?mypage_type=myorder&qna_page=&page=1&order_date_search=&search_date_start=&search_date_end=&order_search_word="
							class="now">1</a>
					</div>
					<!-- //주문 내역 페이징 -->

					<!-- 주문 내역 info -->
					<ul class="foot-dsc">
						<li>- 상품명 또는 주문상세의 조회 버튼을 클릭하시면, 주문상세 내역을 확인하실 수 있습니다.</li>
						<li>- 배송현황의 조회 버튼을 클릭하시면, 해당 주문의 배송 현황을 한눈에 확인하실 수 있습니다.</li>
					</ul>
					<!-- //주문 내역 info -->

				</div>
				<!-- .page-body -->
			</div>
			<!-- #myOrder -->
		</div>
		<!-- #content -->
	</div>
	<!-- #contentWrap -->
</div>
<!-- #contentWrapper-->
<hr />