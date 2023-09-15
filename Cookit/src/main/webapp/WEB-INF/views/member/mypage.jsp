<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠킷!</title>
<link href="${path }/resources/css/bootstrap.css" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/css/common.css" rel="stylesheet">
<link href="${path }/resources/css/mypage.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/81736b67fc.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../nav.jsp" />
<div id="container" style="">
	<div id="contents">
		<div class="myapge_top_wrap">
			<div class="titleArea">
				<h2>마이페이지</h2>
			</div>
			<div class="mypage_wrapper">
				<div class="mypage_top_wrap_left {$display_benefit|display}">
					<div class="xans-element- xans-myshop xans-myshop-asyncbenefit ">
						<div class="description01">
							<span class="icon"><span class="xans-member-var-group_name">골드</span><span class="myshop_benefit_ship_free_message"></span></span><span><span><span class="xans-member-var-name">서유나</span></span> 님 <a href="/member/modify.html">정보관리</a></span>
						</div>
						<p class="myshop_benefit_display_no_benefit">
							<strong class="txtEm"><span class="myshop_benefit_dc_pay"></span><span class="myshop_benefit_dc_min_price">1,000원 이상</span></strong> 구매시 <strong class="txtEm"><span class="myshop_benefit_dc_price">4</span><span class="myshop_benefit_dc_type">%</span></strong>을 <span class="myshop_benefit_use_dc">추가적립</span> 받으실 수 있습니다. <span class="myshop_benefit_dc_max_percent"></span>
						</p>
					</div>
					<div class="xans-element- xans-myshop xans-myshop-asyncbankbook description02 ">
						<ul>
							<li><strong class="title">총주문</strong><strong class="data"><span id="xans_myshop_bankbook_order_price">820,500원</span>(<span id="xans_myshop_bankbook_order_count">14</span>회)</strong></li>
							<li><strong class="title">총적립금</strong><strong class="data"><span id="xans_myshop_bankbook_total_mileage">188,287원</span></strong></li>
						</ul>
					</div>
				</div>
				<div class="mypage_top_wrap_right">
					<div class="xans-element- xans-myshop xans-myshop-orderstate right_top ">
						<div class="order_wrap">
							<div>
								<a href="/myshop/order/list.html?order_status=shipped_before" class="count"><span>입금전 <i class="xi-angle-right"></i></span>
								<span id="xans_myshop_orderstate_shppied_before_count">0</span>
								</a>
							</div>
							<div>
								<a href="/myshop/order/list.html?order_status=shipped_standby" class="count"><span>배송준비중 <i class="xi-angle-right"></i></span><span id="xans_myshop_orderstate_shppied_standby_count">0</span>
								</a>
							</div>
							<div>
								<a href="/myshop/order/list.html?order_status=shipped_begin" class="count"><span>배송중 <i class="xi-angle-right"></i></span>
								<span id="xans_myshop_orderstate_shppied_begin_count">0</span>
								</a>
							</div>
							<div>
								<a href="/myshop/order/list.html?order_status=shipped_complate" class="count"><span>배송완료 <i class="xi-angle-right"></i></span>
								<span id="xans_myshop_orderstate_shppied_complate_count">2</span>
								</a>
							</div>
							<div class="last">
								<ul class="cs_total">
									<li><a href="/myshop/order/list.html?order_status=order_cancel" class="count"><span>취소</span><span><span id="xans_myshop_orderstate_order_cancel_count">0</span></span>
									</a></li>
									<li><a href="/myshop/order/list.html?order_status=order_exchange" class="count"><span>교환</span><span><span id="xans_myshop_orderstate_order_exchange_count">0</span></span>
									</a></li>
									<li><a href="/myshop/order/list.html?order_status=order_return" class="count"><span>반품</span><span><span id="xans_myshop_orderstate_order_return_count">0</span></span>
									</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="xans-element- xans-myshop xans-myshop-asyncbankbook right_bottom">
						<div class="">
							<ul>
								<li class=""><a href="/myshop/mileage/historyList.html">
								<strong class="title">가용적립금</strong><strong class="data use">&nbsp;<span id="xans_myshop_bankbook_avail_mileage">1,110원</span></strong>
								</a></li>
							</ul>
						</div>
						<div class="">
							<ul>
								<li class=""><a href="/myshop/mileage/historyList.html">
								<strong class="title">사용적립금</strong><strong class="data"><span id="xans_myshop_bankbook_used_mileage">187,177원</span></strong>
								</a></li>
							</ul>
						</div>
						<div class="">
							<ul>
								<li class=""><a href="/myshop/coupon/coupon.html"><strong class="title">쿠폰</strong><strong class="data"><span id="xans_myshop_bankbook_coupon_cnt">0</span><span>개</span></strong>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="mypage_wrapper">
			<div class="mypage_leftcon headroomLeft headroom headroom--not-bottom headroom--pinned headroom--top">
				<div id="myshopMain" class="xans-element- xans-myshop xans-myshop-main ">
					<h2>나의 쇼핑</h2>
					<ul>
						<li class="shopMain order active"><a href="/myshop/order/list.html">주문내역</a></li>
						<li class="shopMain wishlist"><a href="/myshop/wish_list.html">관심 상품</a></li>
						<li class="shopMain likeIt displaynone"><a href="">좋아요</a></li>
						<li class="shopMain mileage"><a href="/myshop/mileage/historyList.html">적립금</a></li>
						<li class="shopMain deposits "><a href="/myshop/deposits/historyList.html">예치금</a></li>
						<li class="shopMain coupon "><a href="/myshop/coupon/coupon.html">쿠폰</a></li>
						<li class="shopMain board "><a href="/myshop/board_list.html">게시물/후기 관리</a></li>
						<li class="shopMain address"><a href="/myshop/addr/list.html">주소록</a></li>
						<li class="shopMain profile"><a href="/member/modify.html">개인 정보 수정</a></li>
						<li class="shopMain attendance"><a href="/attend/stamp.html">출석체크</a></li>
					</ul>
				</div>
			</div>
			<div class="mypage_rightcon">
				<div class="titleArea">
					<h2>주문조회</h2>
				</div>
				<div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab gFlex ">
					<ul class="menu">
						<li class="tab_class selected"><a href="/myshop/order/list.html?history_start_date=2023-06-17&amp;history_end_date=2023-09-15&amp;past_year=2022">주문내역조회 (<span id="xans_myshop_total_orders">1</span>) </a></li>
						<li class="tab_class_cs"><a href="/myshop/order/list.html?mode=cs&amp;history_start_date=2023-06-17&amp;history_end_date=2023-09-15&amp;past_year=2022">취소/반품/교환 내역 (<span id="xans_myshop_total_orders_cs">0</span>) </a></li>
						<li class="tab_class_past"><a href="/myshop/order/list_past.html?history_start_date=2023-06-17&amp;history_end_date=2023-09-15&amp;past_year=2022">과거주문내역 (<span id="xans_myshop_total_orders_past">0</span>) </a></li>
					</ul>
				</div>
				<form method="GET" id="" name="">
					<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead">
						<fieldset class="ec-base-box">
							<legend>검색기간설정</legend>
							<div class="stateSelect ">
								<select id="order_status" name="order_status" class="fSelect">
									<option value="all">전체 주문처리상태</option>
									<option value="shipped_before">입금전</option>
									<option value="shipped_standby">배송준비중</option>
									<option value="shipped_begin">배송중</option>
									<option value="shipped_complate">배송완료</option>
									<option value="order_cancel">취소</option>
									<option value="order_exchange">교환</option>
									<option value="order_return">반품</option>
								</select>
							</div>
							<span class="period"><a href="#none" class="period_now" days="00">오늘</a><a href="#none" class="period_search" days="07">1주일</a><a href="#none" class="period_month" days="30">1개월</a><a href="#none" class="period_three" days="90">3개월</a><a href="#none" class="period_six" days="180">6개월</a>
							</span><span class="formWrap"><input id="history_start_date" name="history_start_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2023-06-17" type="text">
							<button type="button" class="ui-datepicker-trigger">
							<img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="...">
							</button></span> ~ <span class="formWrap"><input id="history_end_date" name="history_end_date" class="fText hasDatepicker" readonly="readonly" size="10" value="2023-09-15" type="text">
							<button type="button" class="ui-datepicker-trigger">
							<img src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/ico_cal.gif" alt="..." title="...">
							</button></span><span class="formSubmit"><span class="dummy">검색 <i class="xi-search"></i>
							</span><input alt="조회" id="order_search_btn" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif"></span>
						</fieldset>
						<ul>
							<li class="displaynone">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
							<li class=" ">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</li>
							<li class=" ">완료 후 36개월 이상 경과한 주문은 <a href="javascript:OrderHistory.searchPast(false)">[과거주문내역]</a>에서 확인할 수 있습니다. </li>
							<li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
							<li class="">교환/반품은 배송완료일 기준 7일까지 가능합니다.</li>
						</ul>
					</div>
					<input id="mode" name="mode" value="" type="hidden"><input id="term" name="term" value="" type="hidden">
				</form>
				<div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
	<!--
        $login_url = /member/login.html
    -->
	<div class="title">
		<h3>주문 상품 정보</h3>
	</div>
	<div>
	</div>
	<div>
	</div>
	<div>
	</div>
	<div>
	</div>
	<table border="1" summary="">
	<caption>주문 상품 정보</caption>
	<colgroup>
	<col style="width:135px;">
	<col style="width:93px;">
	<col style="width:auto;">
	<col style="width:61px;">
	<col style="width:111px;">
	<col style="width:111px;">
	<col style="width:111px;">
	</colgroup>
	<thead>
	<tr>
		<th scope="col">
			주문일자<br>
			[주문번호]
		</th>
		<th scope="col">
			이미지
		</th>
		<th scope="col">
			상품정보
		</th>
		<th scope="col">
			수량
		</th>
		<th scope="col">
			상품구매금액
		</th>
		<th scope="col">
			주문처리상태
		</th>
		<th scope="col">
			취소/교환/반품
		</th>
	</tr>
	</thead>
	<tbody class="center ">
	<tr class="xans-record-">
		<td rowspan="2" class="number ">
			<p>
			</p>
			 2023-07-23
			<p>
				<a href="detail.html?order_id=20230723-0002621&amp;page=1&amp;history_start_date=2023-06-17&amp;history_end_date=2023-09-15" class="line">[20230723-0002621]</a>
			</p>
			<a href="#none" class="btnNormal displaynone" onclick="OrderHistory.orderCancel('20230723-0002621')">주문취소</a>
			<a href="cancel.html?order_id=20230723-0002621" class="btnNormal displaynone">취소신청</a>
			<a href="exchange.html?order_id=20230723-0002621" class="btnNormal displaynone">교환신청</a>
			<a href="return.html?order_id=20230723-0002621" class="btnNormal displaynone">반품신청</a>
		</td>
		<td class="thumb">
			<a href=""><img src="" onerror="this.src='';" alt=""></a>
		</td>
		<td class="product left top">
			<strong class="name"><a href="" class="ec-product-name">dddd</a></strong>
			<div class="option ">
				[옵션: 1111]
			</div>
		</td>
		<td>
			1
		</td>
		<td class="right">
			<div class="">
				<strong>19,900원</strong>
			</div>
		</td>
		<td class="state">
			<p class="txtEm">
				배송완료
			</p>
			<p class="">
				<a href="/common/delivery_trace.php?is12RFront=T&amp;order_id=20230723-0002621&amp;invoice_no=6065743118828&amp;product_no=134414&amp;opt_id=000X&amp;is_second_delivery=F" target="_blank">우체국택배</a>
			</p>
			<p class="">
				<a href="#none" class="line" onclick="window.open('/common/delivery_trace.php?is12RFront=T&amp;order_id=20230723-0002621&amp;invoice_no=6065743118828&amp;product_no=134414&amp;opt_id=000X&amp;is_second_delivery=F', '', 'scrollbars=yes, resizeable=0, status=0, directories=0, toolbar=0'); return false;">[6065743118828]</a>
			</p>
			<a href="#" class="btnSubmit snap_review_write_btn set" style="display: none;" data-params="?board_no=4&amp;product_no=134414&amp;order_id=20230723-0002621" data-detail="OrderHistory.getDetailInfo('?product_no=134414&amp;cate_no=86&amp;order_id=20230723-0002621&amp;ord_item_code=20230723-0002621-02');">구매후기</a>
			<a href="#none" class="btnNormal displaynone" onclick="OrderHistory.withdraw('C','20230723-0002621|134414|000X|49798014','F', 'F', 'F', '' , '')">취소철회</a>
			<a href="#none" class="btnNormal displaynone" onclick="OrderHistory.withdraw('E','20230723-0002621|134414|000X|49798014','F', 'F', 'F', '' , '')">교환철회</a>
			<a href="#none" class="btnNormal displaynone" onclick="OrderHistory.withdraw('R','20230723-0002621|134414|000X|49798014','F', 'F', 'F', '' , '')">반품철회</a>
			<a href="#none" class="btnNormal displaynone" onclick="OrderHistory.purchaseConfirmation('20230723-0002621-02')">구매확정</a>
		</td>
		<td>
			<p class="">
				-
			</p>
		</td>
	</tr>
	<tr class="payDetail displaynone">
		<td colspan="7" class="right">
			 상품구매금액 <span></span> + 배송비 <span></span><span class="displaynone"> - 총 할인금액 </span><span class="displaynone"> - 총 부가결제금액 </span><span class="displaynone"> + 세액 </span> = <strong>총 결제금액</strong>: <strong class="txtEm">27,120원 </strong><span></span>
		</td>
	</tr>
	
	</tbody>
	</table>
	<p class="message displaynone">
		주문 내역이 없습니다.
	</p>
</div>				
				
				
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
</body>

</html>