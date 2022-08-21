<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set
        var="signInOut"
        value="${sessionScope.memberResponse==null ? '로그인' : '로그아웃'}"
/>
<c:set
        var="signInOutLink"
        value="${sessionScope.memberResponse==null ? '/members' : '/members/signout'}"
/>
<c:set
        var="name"
        value="${sessionScope.memberResponse==null ? '회원가입' : sessionScope.memberResponse.user_nm}"
/>
<c:set
        var="nameLink"
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage/coupon'}"
/>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[${productDetailDto.company}] ${productDetailDto.title} :: DevKurly</title>
  <link rel="stylesheet" type="text/css" href="/product_detail/reset.css">
  <link rel="stylesheet" type="text/css" href="/product_detail/navigation.css">
  <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css">
  <style>
    #whole_container {
      width: 100%;
      height: 100vh;
    }

    #content_body {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      padding: 0 200 0 200;
    }

    .content {
      width: 400px;
      border: 1px solid #8b00ff;
    }

    button {
      width: 200px;
      height: 100px;
    }

    #content {
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 30 200 160 200;
    }

    /* input {
        width: 80%;
    } */
  </style>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
  <div id="navigation">
    <div id="signup_signin_container">
      <div id="signup_signin">
        <a id="signup"href="${nameLink}">${name}</a>
        <div></div>
        <a id="signin"href="${signInOutLink}">${signInOut}</a>
        <div></div>
        <a id="cust">고객센터</a>
      </div>
    </div>
    <div id="search">
      <div id="search_first">
        <img style="width:82px; height: 42px" src="/product_detail/logo.png" alt="logo" />
        <a>마켓컬리</a>
        <div></div>
        <a>뷰티컬리</a>
      </div>
      <div id="input_container">
        <input placeholder="검색어를 입력해주세요" />
        <img src="/product_detail/imgs/loupe.png" style="width: 20px; height: 20px" />
      </div>
      <div id="icon_container">
        <img src="/product_detail/imgs/location.png" />
        <img src="/product_detail/imgs/heart.png" />
        <img src="/product_detail/imgs/shopping-cart.png" />
      </div>
    </div>
    <div id="menubar">
      <div id="category_container">
        <img src="" />
        <span>카테고리</span>
      </div>
      <div id="menus">
        <span>신상품</span>
        <span>베스트</span>
        <span>알뜰쇼핑</span>
        <span>특가/혜택</span>
      </div>
      <div id="deli_info">
        <span id="purple_deli_info">샛별·낮</span>
        <span id="gray_deli_info">배송안내</span>
      </div>
    </div>
  </div>
  <div id="content">
    <div id="detail_container">
      <img id="pdt_img"
           src="https://images.unsplash.com/photo-1563636619-e9143da7973b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1065&q=80" />
      <div id="detail_price_button_container">
        <p id="is_early_deli">${productDetailDto.de_type==true ? '샛별배송':'낮배송'}</p>
        <h2>[${productDetailDto.company}] ${productDetailDto.title}</h2>
        <p id="sub_title">${productDetailDto.sub_title}</p>
        <div style="margin-bottom: 10px;">
          <span id="price"></span>
          <span id="won">원</span>
        </div>
        <p id="mileage_except">적립 제외 상품입니다.</p> <!-- 여기에 border-bottom 넣기 -->
        <div class="detail_column">
          <div class="column_title">배송</div>
          <div>
            <p class="main_desc">${productDetailDto.de_type==true ? '샛별배송':'낮배송'}</p>
            <p class="sub_desc">23시 전 주문 씨 내일 아침 7시 전 도착</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">판매자</div>
          <div>
            <p class="main_desc">컬리</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">포장타입</div>
          <div>
            <p class="main_desc">${productDetailDto.pack_cd}</p>
            <p class="sub_desc">택배배송은 에코 포장이 스티로폼으로 대체됩니다.</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">판매단위</div>
          <div>
            <p class="main_desc">${productDetailDto.sell_cd}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">중량/용량</div>
          <div>
            <p class="main_desc">${productDetailDto.weca_cd}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">알레르기정보</div>
          <div>
            <p class="main_desc">${productDetailDto.allg_dt}</p>
            <p class="sub_desc">본 제품은 대두,땅콩,알류,밀,복숭아,토마토,호두,메밀,아황산류,잣을 사용한 제품과 같은 시설에서 제조하고 있습니다.</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">유통기한정보</div>
          <div>
            <p class="main_desc">${productDetailDto.ex_dt}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">안내사항</div>
          <div>
            <p class="main_desc">${productDetailDto.notice}</p>
          </div>
        </div>
        <div class="detail_column">
          <div class="column_title">구매수량</div>
          <div>
            <div class="quantity_control_box">
              <button>-</button>
              <div>1</div>
              <button>+</button>
            </div>
          </div>
        </div>
        <div>
          <div id="price_container">
            <span id="total_price">총 상품금액: </span>
            <span id="actual_price">2,070</span>
            <span id="unit">원</span>
          </div>
          <div id="mileage">
            구매 시 0원 적립
          </div>
        </div>
        <div id="button_container">
          <button><img src="/product_detail/imgs/purpleheart.svg"/></button>
          <button><img src="/product_detail/imgs/bell.svg"/></button>
          <button>장바구니 담기</button>
        </div>
      </div>
    </div>
    <nav>
      <div id="">상품설명</div>
      <div id="">상세정보</div>
      <div id="">후기 (261734)</div>
      <div id="">문의</div>
    </nav>
    <img style="margin-bottom: 30px;"
         src="https://images.unsplash.com/photo-1446126102442-f6b2b73257fd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80" />
    <img
            src="https://images.unsplash.com/photo-1552404200-b22566b2317b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=985&q=80" />

    <div id ="board_container">
      <div id="review_board">
        <iframe src="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=1&page=1&pageSize=10" width="100%" height="1000px">
        </iframe>
      </div>
      <div id="inquiry_board">
        <iframe src="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=2&page=1&pageSize=10" width="100%" height="1000px">
        </iframe>
      </div>
    </div>
  </div>
</div>
<script>
  //가격단위 콤마 추가
  let sel_price = ${productDetailDto.sel_price};
  let priceLocale= sel_price.toLocaleString()
  $("#price").text(priceLocale);




</script>

</body>
</html>