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
    <title>여기에 상품 제목 들어가유 c 태그로 잘 넣어주세용</title>
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/navigation.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/mypage.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/myCoupon.css">
    <style>
        #whole_container {
            width: 100%;
            height: 100vh;
        }

        button {
            width: 200px;
            height: 100px;
        }

        #content {
            display: flex;
            padding: 30px 200px 160px 200px;
        }


        #mypage_content {
            width: 50%;
            height: auto;
        }

        #mypage_content_body {

        }

/*        #main_addr {  // 다음주소 API를 통해서 자동으로 입력되게 해야함 하지만 일단은 하드코딩으로 작섣하는 방식으로 선택
            border: none;
            width: 80%;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        #sub_addr {
            width: 80%;
            padd
        }



    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
    <div id="navigation">
        <div id="signup_signin_container">
            <div id="signup_signin">
                <a id="signup" href="${nameLink}">${name}</a>
                <div></div>
                <a id="signin" href="${signInOutLink}">${signInOut}</a>
                <div></div>
                <a id="cust">고객센터</a>
            </div>
        </div>
        <div id="search">
            <div id="search_first">
                <img style="width:82px; height: 42px" src="/mypage/myCoupon/imgs/logo.png" alt="logo"/>
                <a>마켓컬리</a>
                <div></div>
                <a>뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요"/>
                <img src="/mypage/myCoupon/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <img src="/mypage/myCoupon/imgs/location.png"/>
                <img src="/mypage/myCoupon/imgs/heart.png"/>
                <img src="/mypage/myCoupon/imgs/shopping-cart.png"/>
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src=""/>
                <span>카테고리</span>
            </div>
            <div id="menus">
                <span><a href="">신상품</a></span>
                <span><a href="">베스트</a></span>
                <span><a href="">알뜰쇼핑</a></span>
                <span><a href="/event/main">특가/혜택</a></span>
            </div>
            <div id="deli_info">
                <span id="purple_deli_info">샛별·낮</span>
                <span id="gray_deli_info">배송안내</span>
            </div>
        </div>
    </div>
    <div id="content">
        <div id="my_kurly">
            <h2>마이컬리</h2>
            <ul>
                <a href="">
                    <li>주문 내역</li>
                </a>
                <a href="">
                    <li>선물 내역</li>
                </a>
                <a href="">
                    <li>찜한 상품</li>
                </a>
                <a href="">
                    <li>배송지 관리</li>
                </a>
                <a href="">
                    <li>상품 후기</li>
                </a>
                <a href="">
                    <li>상품 문의</li>
                </a>
                <a href="">
                    <li>적립금</li>
                </a>
                <a href="">
                    <li>쿠폰</li>
                </a>
                <a href="">
                    <li>개인 정보 수정</li>
                </a>
            </ul>
        </div>
        <div id="mypage_content">
            <h3>배송지 등록</h3>
            <form id="mypage_content_body">
                <div id="coupons">
                    <div>
                        <span>주소</span><br>
                        <input type="text" id="main_addr" name="main_addr" value="${addressDto.main_addr}"/>
                    </div>
                    <div>
                        <span>상세주소</span><br>
                        <input type="text" id="sub_addr" name="sub_addr" value="${addressDto.sub_addr}"/>
                    </div>
                    <div>
                        <span>받으실 분</span><br>
                        <input type="text" name="addr_name" placeholder="이름을 입력해주세요" value="${addressDto.addr_name}"/>
                    </div>
                    <div>
                        <span>연락처</span><br>
                        <input type="text" name="addr_tel" placeholder="번호를 입력해주세요" value="${addressDto.addr_tel}"
                               maxlength="11"
                               oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                    </div>
                </div>
                <div>
                    <input type="checkbox" name="chk_addr" value="true" onclick="checkAlert()">기본배송지로 저장
                </div>
                <div>
                    <a href="/address/create">
                        <button id="insertBtn">
                            배송지 등록
                        </button>
                    </a>
                </div>
                <div>
                    <a href="/address/list">
                        <button id="listBtn">
                            목록으로 돌아가기
                        </button>
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
</div>
</div>
<script>
    $(document).ready(function() {  // main()와 같다. jquery
        $('#listBtn').on("click", function (){
            location.href="<c:url value='/address/list'/>";
        });

        $('#insertBtn').on("click", function (){
            let form = $('#mypage_content_body');
            form.attr("action", "<c:url value='/address/create'/>");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>
</body>
</html>