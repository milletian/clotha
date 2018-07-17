
-- 스타일
CREATE TABLE "STYLE" (
	"STYLE_CODE" VARCHAR2(20) NOT NULL, -- 스타일코드
	"STYLE_NAME" VARCHAR2(50) NOT NULL  -- 스타일종류
);

-- 스타일 기본키
CREATE UNIQUE INDEX "PK_STYLE"
	ON "STYLE" ( -- 스타일
		"STYLE_CODE" ASC -- 스타일코드
	);

-- 스타일
ALTER TABLE "STYLE"
	ADD
		CONSTRAINT "PK_STYLE" -- 스타일 기본키
		PRIMARY KEY (
			"STYLE_CODE" -- 스타일코드
		);

-- 의류상품
CREATE TABLE "PRODUCTS" (
	"PD_CODE"          VARCHAR2(50) NOT NULL, -- 상품코드
	"PD_NAME"          VARCHAR2(100) NOT NULL, -- 상품이름
	"PD_ORIGINALPRICE" NUMBER        NOT NULL, -- 원가
	"PD_SELLPRICE"     NUMBER        NOT NULL, -- 판매가
	"PD_REGDATE"       TIMESTAMP          DEFAULT sysdate, -- 등록날짜
	"PD_EXPLANATION"   VARCHAR2(100) NULL,     -- 상품설명
	"PD_WARNING"       VARCHAR2(100) NULL,     -- 주의사항
	"PD_IMAGE"         VARCHAR2(100) NULL,     -- 상품이미지
	"STYLE_CODE"       VARCHAR2(20) NULL,     -- 스타일코드
	"COLOR_CODE"       VARCHAR2(20) NULL,     -- 색상코드
	"SEASON_CODE"      VARCHAR2(20) NULL,     -- 시즌코드
	"SIZE_CODE"        VARCHAR2(20) NULL,     -- 사이즈코드
	"ACC_CODE"         VARCHAR2(50) NULL,     -- 구매처
	"GENDER_CODE"      VARCHAR2(10)   NULL      -- 성별
);

-- 의류상품 기본키
CREATE UNIQUE INDEX "PK_PRODUCTS"
	ON "PRODUCTS" ( -- 의류상품
		"PD_CODE" ASC -- 상품코드
	);

-- 의류상품
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "PK_PRODUCTS" -- 의류상품 기본키
		PRIMARY KEY (
			"PD_CODE" -- 상품코드
		);

-- 색상
CREATE TABLE "COLOR" (
	"COLOR_CODE"  VARCHAR2(20) NOT NULL, -- 색상코드
	"COLOR_NAME"  VARCHAR2(50) NOT NULL, -- 색상이름
	"COLOR_IMAGE" VARCHAR2(100) NULL      -- 색상이미지
);

-- 색상 기본키
CREATE UNIQUE INDEX "PK_COLOR"
	ON "COLOR" ( -- 색상
		"COLOR_CODE" ASC -- 색상코드
	);

-- 색상
ALTER TABLE "COLOR"
	ADD
		CONSTRAINT "PK_COLOR" -- 색상 기본키
		PRIMARY KEY (
			"COLOR_CODE" -- 색상코드
		);

-- 시즌
CREATE TABLE "SEASON" (
	"SEASON_CODE" VARCHAR2(20) NOT NULL, -- 시즌코드
	"SEASON_NAME" VARCHAR2(20)  NOT NULL  -- 계절
);

-- 시즌 기본키
CREATE UNIQUE INDEX "PK_SEASON"
	ON "SEASON" ( -- 시즌
		"SEASON_CODE" ASC -- 시즌코드
	);

-- 시즌
ALTER TABLE "SEASON"
	ADD
		CONSTRAINT "PK_SEASON" -- 시즌 기본키
		PRIMARY KEY (
			"SEASON_CODE" -- 시즌코드
		);



-- 사이즈
CREATE TABLE "SIZE" (
	"SIZE_CODE" VARCHAR2(20) NOT NULL, -- 사이즈코드
	"SIZE_NAME" NUMBER        NOT NULL  -- 사이즈
);

-- 사이즈 기본키
CREATE UNIQUE INDEX "PK_SIZE"
	ON "SIZE" ( -- 사이즈
		"SIZE_CODE" ASC -- 사이즈코드
	);

-- 사이즈
ALTER TABLE "SIZE"
	ADD
		CONSTRAINT "PK_SIZE" -- 사이즈 기본키
		PRIMARY KEY (
			"SIZE_CODE" -- 사이즈코드
		);

-- 점포
CREATE TABLE "STORE" (
	"STORE_CODE"    VARCHAR2(50) NOT NULL, -- 점포코드
	"EMP_NO"        VARCHAR2(50) NOT NULL, -- 점장
	"STORE_ZIPCODE" VARCHAR2(20) NOT NULL, -- 우편번호
	"STORE_ADDRESS" VARCHAR2(100) NOT NULL, -- 점포주소
	"STORE_JOIN"    TIMESTAMP         DEFAULT sysdate, -- 등록날짜
	"STORE_IMAGE"   VARCHAR2(100) NULL,     -- 이미지
	"AREA_CODE"     VARCHAR2(50) NOT NULL, -- 재고위치코드
	"STORE_DEL"     TIMESTAMP     NULL      -- 폐쇄날짜
);

-- 점포 기본키2
CREATE UNIQUE INDEX "PK_STORE"
	ON "STORE" ( -- 점포
		"STORE_CODE" ASC -- 점포코드
	);

-- 점포
ALTER TABLE "STORE"
	ADD
		CONSTRAINT "PK_STORE" -- 점포 기본키2
		PRIMARY KEY (
			"STORE_CODE" -- 점포코드
		);

-- 창고
CREATE TABLE "WAREHOUSE" (
	"WH_CODE"    VARCHAR2(50) NOT NULL, -- 창고코드
	"WH_NAME"    VARCHAR2(50) NOT NULL, -- 창고이름
	"WH_ADDRESS" VARCHAR2(100) NOT NULL, -- 창고주소
	"WH_IMAGE"   VARCHAR2(100) NULL,     -- 창고이미지
	"WH_REGDATE" TIMESTAMP        DEFAULT sysdate, -- 등록날짜
	"AREA_CODE"  VARCHAR2(50) NOT NULL, -- 재고위치코드
	"WH_ZIPCODE"        VARCHAR2(20)  NOT NULL  -- 창고 우편번호
);

-- 창고 기본키
CREATE UNIQUE INDEX "PK_WAREHOUSE"
	ON "WAREHOUSE" ( -- 창고
		"WH_CODE" ASC -- 창고코드
	);

-- 창고
ALTER TABLE "WAREHOUSE"
	ADD
		CONSTRAINT "PK_WAREHOUSE" -- 창고 기본키
		PRIMARY KEY (
			"WH_CODE" -- 창고코드
		);

-- 부서
CREATE TABLE "DEPT" (
	"DEPT_NO"   VARCHAR2(50) NOT NULL, -- 부서코드
	"DEPT_NAME" VARCHAR2(50) NOT NULL  -- 부서이름
);

-- 부서 기본키3
CREATE UNIQUE INDEX "PK_DEPT"
	ON "DEPT" ( -- 부서
		"DEPT_NO" ASC -- 부서코드
	);

-- 부서
ALTER TABLE "DEPT"
	ADD
		CONSTRAINT "PK_DEPT" -- 부서 기본키3
		PRIMARY KEY (
			"DEPT_NO" -- 부서코드
		);

-- 재고위치
CREATE TABLE "AREA" (
	"AREA_CODE" VARCHAR2(50) NOT NULL, -- 재고위치코드
	"AREA_NAME" VARCHAR2(100) NULL,     -- 지역명
	"EMP_NO"    VARCHAR2(50) NULL      -- 사원코드
);

-- 재고위치 기본키
CREATE UNIQUE INDEX "PK_AREA"
	ON "AREA" ( -- 재고위치
		"AREA_CODE" ASC -- 재고위치코드
	);

-- 재고위치
ALTER TABLE "AREA"
	ADD
		CONSTRAINT "PK_AREA" -- 재고위치 기본키
		PRIMARY KEY (
			"AREA_CODE" -- 재고위치코드
		);

-- 재고
CREATE TABLE "STOCK" (
	"STOCK_PK"  NUMBER        NOT NULL, -- 재고PK
	"AREA_CODE" VARCHAR2(50) NOT NULL, -- 재고위치코드
	"PD_CODE"   VARCHAR2(50) NULL,     -- 상품코드
	"STOCK_QTY" NUMBER        NULL      -- 수량
);

-- 재고 기본키2
CREATE UNIQUE INDEX "PK_STOCK"
	ON "STOCK" ( -- 재고
		"STOCK_PK" ASC -- 재고PK
	);

-- 재고
ALTER TABLE "STOCK"
	ADD
		CONSTRAINT "PK_STOCK" -- 재고 기본키2
		PRIMARY KEY (
			"STOCK_PK" -- 재고PK
		);

-- 사원
CREATE TABLE "EMPLOYEE" (
	"EMP_NO"       VARCHAR2(50) NOT NULL, -- 사원코드
	"DEPT_NO"      VARCHAR2(50) NOT NULL, -- 부서코드
	"EMP_NAME"     VARCHAR2(30) NOT NULL, -- 이름
	"EMP_PWD"      VARCHAR2(50) NOT NULL, -- 비밀번호
	"EMP_ZIPCODE"  VARCHAR2(20) NOT NULL, -- 우편번호
	"EMP_ADDRESS"  VARCHAR2(100) NOT NULL, -- 주소
	"EMP_JUMIN"    VARCHAR2(30) NOT NULL, -- 주민번호
	"EMP_TEL"      VARCHAR2(30) NOT NULL, -- 전화번호
	"EMP_FACE"     VARCHAR2(100) NULL,     -- 이미지
	"EMP_JOB"      VARCHAR2(100) NULL,     -- 담당업무
	"EMP_JOINDATE" TIMESTAMP     NULL,     -- 입사날짜
	"EMP_OUTDATE"  TIMESTAMP     NULL,     -- 퇴사날짜
	"GRADE_CODE"   VARCHAR2(20) NOT NULL, -- 권한코드
	"EMP_DEL"      VARCHAR2(10)      DEFAULT 'N', -- 사원등록여부
	"STORE_CODE"   VARCHAR2(50) NULL,     -- 점포코드
	"EMP_EMAIL"    VARCHAR2(100)  NOT NULL  -- 이메일
);

-- 사원 기본키
CREATE UNIQUE INDEX "PK_EMPLOYEE"
	ON "EMPLOYEE" ( -- 사원
		"EMP_NO" ASC -- 사원코드
	);

-- 사원
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "PK_EMPLOYEE" -- 사원 기본키
		PRIMARY KEY (
			"EMP_NO" -- 사원코드
		);

-- 매출
CREATE TABLE "SALES" (
	"SALES_CODE"    VARCHAR2(50) NOT NULL, -- 매출코드
	"SALES_REGDATE" TIMESTAMP     NOT NULL, -- 날짜
	"STORE_CODE"    VARCHAR2(50) NOT NULL  -- 점포코드
);

-- 매출 기본키2
CREATE UNIQUE INDEX "PK_SALES"
	ON "SALES" ( -- 매출
		"SALES_CODE" ASC -- 매출코드
	);

-- 매출
ALTER TABLE "SALES"
	ADD
		CONSTRAINT "PK_SALES" -- 매출 기본키2
		PRIMARY KEY (
			"SALES_CODE" -- 매출코드
		);

-- 매출상세
CREATE TABLE "SALES_DETAIL" (
	"SALES_DETAIL_PK"    NUMBER        NOT NULL, -- 매출상세PK
	"SALES_CODE"         VARCHAR2(50) NOT NULL, -- 매출코드
	"PD_CODE"            VARCHAR2(50) NOT NULL, -- 상품코드
	"SALES_DETAIL_QTY"   NUMBER        NOT NULL, -- 수량
	"SALES_DETAIL_TOTAL" NUMBER        NOT NULL, -- 총가격
	"SALES_DETAIL_DATE"  TIMESTAMP         DEFAULT sysdate, -- 구매일
	"MEMBER_CODE"        VARCHAR2(50) NULL,     -- 구매자
	"SALES_DETAIL_PLUSP" NUMBER        NULL,     -- 적립포인트
	"SALES_DETAIL_USEP"  NUMBER        NULL,     -- 사용포인트
	"CP_CODE"            VARCHAR2(50) NULL      -- 사용쿠폰번호
);

-- 매출상세 기본키
CREATE UNIQUE INDEX "PK_SALES_DETAIL"
	ON "SALES_DETAIL" ( -- 매출상세
		"SALES_DETAIL_PK" ASC -- 매출상세PK
	);

-- 매출상세
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "PK_SALES_DETAIL" -- 매출상세 기본키
		PRIMARY KEY (
			"SALES_DETAIL_PK" -- 매출상세PK
		);


-- 권한단계
CREATE TABLE "GRADE" (
	"GRADE_CODE" VARCHAR2(20) NOT NULL, -- 권한코드
	"GRADE_NAME" VARCHAR2(30) NULL      -- 권한명
);

-- 권한단계 기본키
CREATE UNIQUE INDEX "PK_GRADE"
	ON "GRADE" ( -- 권한단계
		"GRADE_CODE" ASC -- 권한코드
	);

-- 권한단계
ALTER TABLE "GRADE"
	ADD
		CONSTRAINT "PK_GRADE" -- 권한단계 기본키
		PRIMARY KEY (
			"GRADE_CODE" -- 권한코드
		);

-- 접속정보
CREATE TABLE "LOG" (
	"LOG_PK"  NUMBER        NOT NULL, -- 접속정보PK
	"EMP_NO"  VARCHAR2(50) NOT NULL, -- 사원코드
	"LOG_IP"  VARCHAR2(30) NOT NULL, -- 접속IP
	"LOG_IN"  TIMESTAMP     NULL,     -- 로그인시간
	"LOG_OUT" TIMESTAMP     NULL      -- 로그아웃시간
);

-- 접속정보 기본키
CREATE UNIQUE INDEX "PK_LOG"
	ON "LOG" ( -- 접속정보
		"LOG_PK" ASC -- 접속정보PK
	);

-- 접속정보
ALTER TABLE "LOG"
	ADD
		CONSTRAINT "PK_LOG" -- 접속정보 기본키
		PRIMARY KEY (
			"LOG_PK" -- 접속정보PK
		);

-- 입고/반품관리(매장기준)
CREATE TABLE "INOUT" (
	"INOUT_CODE"      VARCHAR2(50) NOT NULL, -- 입고/반품코드
	"INOUT_STARTDATE" TIMESTAMP     NOT NULL, -- 출발일시
	"INOUT_STATUS"    VARCHAR2(20)      DEFAULT '승인대기', -- 상태
	"INOUT_ENDDATE"   TIMESTAMP     NULL,     -- 도착예정일시
	"AREA_START"      VARCHAR2(50) NOT NULL, -- 출발지
	"AREA_END"        VARCHAR2(50) NOT NULL, -- 도착지
	"IS_IN"           VARCHAR2(10)    DEFAULT '입고', -- 입고/반품여부
	"OUT_DETAIL"      VARCHAR2(100) NULL      -- 반품사유
);

-- 입고/반품관리(매장기준) 기본키
CREATE UNIQUE INDEX "PK_INOUT"
	ON "INOUT" ( -- 입고/반품관리(매장기준)
		"INOUT_CODE" ASC -- 입고/반품코드
	);

-- 입고/반품관리(매장기준)
ALTER TABLE "INOUT"
	ADD
		CONSTRAINT "PK_INOUT" -- 입고/반품관리(매장기준) 기본키
		PRIMARY KEY (
			"INOUT_CODE" -- 입고/반품코드
		);

-- 입고/반품품목
CREATE TABLE "INOUT_DETAIL" (
	"INOUT_DETAIL_PK"  number        NOT NULL, -- 입고/반품PK
	"INOUT_CODE"       VARCHAR2(50) NOT NULL, -- 입고/반품코드
	"PD_CODE"          VARCHAR2(50) NOT NULL, -- 상품코드
	"INOUT_DETAIL_QTY" NUMBER        NOT NULL  -- 수량
);

-- 입고/반품품목 기본키
CREATE UNIQUE INDEX "PK_INOUT_DETAIL"
	ON "INOUT_DETAIL" ( -- 입고/반품품목
		"INOUT_DETAIL_PK" ASC -- 입고/반품PK
	);

-- 입고/반품품목
ALTER TABLE "INOUT_DETAIL"
	ADD
		CONSTRAINT "PK_INOUT_DETAIL" -- 입고/반품품목 기본키
		PRIMARY KEY (
			"INOUT_DETAIL_PK" -- 입고/반품PK
		);

-- 점간이동현황
CREATE TABLE "TRANSPORT" (
	"TP_CODE"     VARCHAR2(50) NOT NULL, -- 점간이동코드
	"STORE_CODE"  VARCHAR2(50) NOT NULL, -- 출발지점
	"TP_REGDATE"  TIMESTAMP     NOT NULL, -- 신청날짜
	"TP_ISAGREE"  VARCHAR2(10)     DEFAULT 'N', -- 승낙여부
	"STORE_CODE2" VARCHAR2(50) NOT NULL  -- 도착지점
);

-- 점간이동현황 기본키
CREATE UNIQUE INDEX "PK_TRANSPORT"
	ON "TRANSPORT" ( -- 점간이동현황
		"TP_CODE" ASC -- 점간이동코드
	);

-- 점간이동현황
ALTER TABLE "TRANSPORT"
	ADD
		CONSTRAINT "PK_TRANSPORT" -- 점간이동현황 기본키
		PRIMARY KEY (
			"TP_CODE" -- 점간이동코드
		);

-- 점간이동상세
CREATE TABLE "TRANSPORT_DETAIL" (
	"TP_DETAIL_PK" NUMBER        NOT NULL, -- 점간이동상세PK
	"TP_CODE"      VARCHAR2(50) NOT NULL, -- 점간이동코드
	"PD_CODE"      VARCHAR2(50) NOT NULL, -- 상품코드
	"QUANTITY"     NUMBER        NOT NULL  -- 수량
);

-- 점간이동상세 기본키
CREATE UNIQUE INDEX "PK_TRANSPORT_DETAIL"
	ON "TRANSPORT_DETAIL" ( -- 점간이동상세
		"TP_DETAIL_PK" ASC -- 점간이동상세PK
	);

-- 점간이동상세
ALTER TABLE "TRANSPORT_DETAIL"
	ADD
		CONSTRAINT "PK_TRANSPORT_DETAIL" -- 점간이동상세 기본키
		PRIMARY KEY (
			"TP_DETAIL_PK" -- 점간이동상세PK
		);

-- 회원
CREATE TABLE "MEMBER" (
	"MEMBER_CODE"    VARCHAR2(50) NOT NULL, -- 회원코드
	"MEMBER_NAME"    VARCHAR2(40) NOT NULL, -- 이름
	"MEMBER_TEL"     VARCHAR2(30) NOT NULL, -- 전화번호
	"STORE_CODE"     VARCHAR2(50) NOT NULL, -- 가입지점
	"MEMBER_POINT"   NUMBER            DEFAULT 0, -- 포인트
	"MEMBER_REGDATE" TIMESTAMP        DEFAULT sysdate -- 가입일
);

-- 회원 기본키
CREATE UNIQUE INDEX "PK_MEMBER"
	ON "MEMBER" ( -- 회원
		"MEMBER_CODE" ASC -- 회원코드
	);

-- 회원
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "PK_MEMBER" -- 회원 기본키
		PRIMARY KEY (
			"MEMBER_CODE" -- 회원코드
		);

-- 포인트이력
CREATE TABLE "POINT" (
	"POINT_PK"      NUMBER        NOT NULL, -- 포인트이력PK
	"MEMBER_CODE"   VARCHAR2(50) NOT NULL, -- 회원코드
	"POINT_REGDATE" TIMESTAMP       DEFAULT sysdate, -- 발생일
	"POINT_CHANGE"  NUMBER        NOT NULL  -- 변동포인트
);

-- 포인트이력 기본키
CREATE UNIQUE INDEX "PK_POINT"
	ON "POINT" ( -- 포인트이력
		"POINT_PK" ASC -- 포인트이력PK
	);

-- 포인트이력
ALTER TABLE "POINT"
	ADD
		CONSTRAINT "PK_POINT" -- 포인트이력 기본키
		PRIMARY KEY (
			"POINT_PK" -- 포인트이력PK
		);

-- 할인쿠폰
CREATE TABLE "COUPON" (
	"CP_CODE"        VARCHAR2(50) NOT NULL, -- 쿠폰번호
	"CP_DISCOUNT"    NUMBER        NOT NULL, -- 할인율
	"CP_LIMITPRICE"  NUMBER        NULL,     -- 한도
	"CP_USEOK"       VARCHAR2(10)    DEFAULT 'Y', -- 사용가능여부
	"CP_TERM"        TIMESTAMP     NOT NULL, -- 사용가능기간
	"CP_USEDATE"     TIMESTAMP     NULL,     -- 사용일
	"CP_PUBLISHDATE" TIMESTAMP        DEFAULT SYSDATE -- 발행일
);

-- 할인쿠폰 기본키
CREATE UNIQUE INDEX "PK_COUPON"
	ON "COUPON" ( -- 할인쿠폰
		"CP_CODE" ASC -- 쿠폰번호
	);

-- 할인쿠폰
ALTER TABLE "COUPON"
	ADD
		CONSTRAINT "PK_COUPON" -- 할인쿠폰 기본키
		PRIMARY KEY (
			"CP_CODE" -- 쿠폰번호
		);

-- 구매처
CREATE TABLE "ACCOUNT" (
	"ACC_CODE"    VARCHAR2(50) NOT NULL, -- 구매처코드
	"ACC_NAME"    VARCHAR2(100) NOT NULL, -- 회사명
	"ACC_ZIPCODE" VARCHAR2(20) NOT NULL, -- 우편번호
	"ACC_ADDRESS" VARCHAR2(100) NOT NULL, -- 주소
	"ACC_TEL"     VARCHAR2(30) NOT NULL, -- 전화번호
	"ACC_CEO"     VARCHAR2(50) NOT NULL, -- 대표자성명
	"ACC_NO"      VARCHAR2(30) NOT NULL, -- 사업자등록번호
	"ACC_ISDEAL"  VARCHAR2(10)    DEFAULT 'Y', -- 사용여부
	"ACC_UNIQUE"  VARCHAR2(100) NULL      -- 특이사항
);

-- 구매처 기본키
CREATE UNIQUE INDEX "PK_ACCOUNT"
	ON "ACCOUNT" ( -- 구매처
		"ACC_CODE" ASC -- 구매처코드
	);

-- 구매처
ALTER TABLE "ACCOUNT"
	ADD
		CONSTRAINT "PK_ACCOUNT" -- 구매처 기본키
		PRIMARY KEY (
			"ACC_CODE" -- 구매처코드
		);

-- 구매현황
CREATE TABLE "ACCOUNT_DETAIL" (
	"ACC_DT_CODE"    VARCHAR2(50) NOT NULL, -- 현황코드
	"ACC_CODE"       VARCHAR2(50) NOT NULL, -- 구매처코드
	"ACC_DT_REGDATE" TIMESTAMP      DEFAULT sysdate, -- 주문일자
	"PD_CODE"        VARCHAR2(50) NOT NULL, -- 상품코드
	"ACC_DT_QTY"     NUMBER        NOT NULL, -- 주문수량
	"ACC_DT_INDATE"  TIMESTAMP     NULL,     -- 입고예정일
	"ACC_DT_ISAGREE" VARCHAR2(10)      DEFAULT 'N', -- 주문확인여부
	"WH_CODE"        VARCHAR2(50) NOT NULL  -- 받을창고
);

-- 구매현황 기본키
CREATE UNIQUE INDEX "PK_ACCOUNT_DETAIL"
	ON "ACCOUNT_DETAIL" ( -- 구매현황
		"ACC_DT_CODE" ASC -- 현황코드
	);

-- 구매현황
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "PK_ACCOUNT_DETAIL" -- 구매현황 기본키
		PRIMARY KEY (
			"ACC_DT_CODE" -- 현황코드
		);
-- 공지사항
CREATE TABLE "NOTICE" (
	"NOTICE_NO"      NUMBER        NOT NULL, -- 글번호
	"NOTICE_TITLE"   VARCHAR2(200) NOT NULL, -- 제목
	"EMP_NO"         VARCHAR2(50) NOT NULL, -- 사원코드
	"NOTICE_CONTENT" CLOB          NOT NULL, -- 내용
	"NOTICE_READ"    NUMBER           DEFAULT 0 -- 조회수
);

-- 공지사항 기본키
CREATE UNIQUE INDEX "PK_NOTICE"
	ON "NOTICE" ( -- 공지사항
		"NOTICE_NO" ASC -- 글번호
	);

-- 공지사항
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "PK_NOTICE" -- 공지사항 기본키
		PRIMARY KEY (
			"NOTICE_NO" -- 글번호
		);


-- 보내는쪽지
CREATE TABLE "MAIL" (
	"MAIL_NO"        NUMBER        NOT NULL, -- 메일번호
	"SENDER"         VARCHAR2(50) NOT NULL, -- 보낸사람
	"MAIL_CONTENT"   CLOB          NULL,     -- 내용
	"MAIL_FILE"      VARCHAR2(100) NULL,     -- 파일
	"MAIL_SDATE"     TIMESTAMP        DEFAULT SYSDATE, -- 발송날짜
	"MAIL_SENDERDEL" VARCHAR2(10)      DEFAULT 'N', -- 보낸이삭제여부
	"MAIL_SAVE"      VARCHAR2(10)  NULL      -- 보관여부
);

-- 보내는쪽지 기본키
CREATE UNIQUE INDEX "PK_MAIL"
	ON "MAIL" ( -- 보내는쪽지
		"MAIL_NO" ASC -- 메일번호
	);

-- 보내는쪽지
ALTER TABLE "MAIL"
	ADD
		CONSTRAINT "PK_MAIL" -- 보내는쪽지 기본키
		PRIMARY KEY (
			"MAIL_NO" -- 메일번호
		);

-- 받는쪽지
CREATE TABLE "GET_MAIL" (
	"GET_MAIL_PK"   NUMBER        NOT NULL, -- 받는쪽지PK
	"MAIL_NO"       NUMBER        NOT NULL, -- 메일번호
	"EMP_NO"        VARCHAR2(50) NOT NULL, -- 받는사람
	"GET_MAIL_DEL"  VARCHAR2(10)  DEFAULT 'N',   -- 받는이삭제여부
	"GET_MAIL_SAVE" VARCHAR2(10)  NULL,      -- 보관여부
	"GET_MAIL_READ" VARCHAR2(10)  DEFAULT 'N'      -- 보관여부
);

-- 받는쪽지 기본키
CREATE UNIQUE INDEX "PK_GET_MAIL"
	ON "GET_MAIL" ( -- 받는쪽지
		"GET_MAIL_PK" ASC -- 받는쪽지PK
	);

-- 받는쪽지
ALTER TABLE "GET_MAIL"
	ADD
		CONSTRAINT "PK_GET_MAIL" -- 받는쪽지 기본키
		PRIMARY KEY (
			"GET_MAIL_PK" -- 받는쪽지PK
		);

-- 의류상품
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_STYLE_TO_PRODUCTS" -- 스타일 -> 의류상품
		FOREIGN KEY (
			"STYLE_CODE" -- 스타일코드
		)
		REFERENCES "STYLE" ( -- 스타일
			"STYLE_CODE" -- 스타일코드
		);

-- 의류상품
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_COLOR_TO_PRODUCTS" -- 색상 -> 의류상품
		FOREIGN KEY (
			"COLOR_CODE" -- 색상코드
		)
		REFERENCES "COLOR" ( -- 색상
			"COLOR_CODE" -- 색상코드
		);

-- 의류상품
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_SEASON_TO_PRODUCTS" -- 시즌 -> 의류상품
		FOREIGN KEY (
			"SEASON_CODE" -- 시즌코드
		)
		REFERENCES "SEASON" ( -- 시즌
			"SEASON_CODE" -- 시즌코드
		);

-- 의류상품
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_SIZE_TO_PRODUCTS" -- 사이즈 -> 의류상품
		FOREIGN KEY (
			"SIZE_CODE" -- 사이즈코드
		)
		REFERENCES "SIZE" ( -- 사이즈
			"SIZE_CODE" -- 사이즈코드
		);

-- 의류상품
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_ACC_TO_PD" -- 구매처 -> 의류상품
		FOREIGN KEY (
			"ACC_CODE" -- 구매처
		)
		REFERENCES "ACCOUNT" ( -- 구매처
			"ACC_CODE" -- 구매처코드
		);

-- 점포
ALTER TABLE "STORE"
	ADD
		CONSTRAINT "FK_AREA_TO_STORE" -- 재고위치 -> 점포
		FOREIGN KEY (
			"AREA_CODE" -- 재고위치코드
		)
		REFERENCES "AREA" ( -- 재고위치
			"AREA_CODE" -- 재고위치코드
		);

-- 점포
ALTER TABLE "STORE"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_STORE" -- 사원 -> 점포
		FOREIGN KEY (
			"EMP_NO" -- 점장
		)
		REFERENCES "EMPLOYEE" ( -- 사원
			"EMP_NO" -- 사원코드
		);


-- 창고
ALTER TABLE "WAREHOUSE"
	ADD
		CONSTRAINT "FK_AREA_TO_WAREHOUSE" -- 재고위치 -> 창고
		FOREIGN KEY (
			"AREA_CODE" -- 재고위치코드
		)
		REFERENCES "AREA" ( -- 재고위치
			"AREA_CODE" -- 재고위치코드
		);

-- 재고위치
ALTER TABLE "AREA"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_AREA" -- 사원 -> 재고위치
		FOREIGN KEY (
			"EMP_NO" -- 사원코드
		)
		REFERENCES "EMPLOYEE" ( -- 사원
			"EMP_NO" -- 사원코드
		);

-- 재고
ALTER TABLE "STOCK"
	ADD
		CONSTRAINT "FK_PRODUCTS_TO_STOCK" -- 의류상품 -> 재고
		FOREIGN KEY (
			"PD_CODE" -- 상품코드
		)
		REFERENCES "PRODUCTS" ( -- 의류상품
			"PD_CODE" -- 상품코드
		);

-- 재고
ALTER TABLE "STOCK"
	ADD
		CONSTRAINT "FK_AREA_TO_STOCK" -- 재고위치 -> 재고
		FOREIGN KEY (
			"AREA_CODE" -- 재고위치코드
		)
		REFERENCES "AREA" ( -- 재고위치
			"AREA_CODE" -- 재고위치코드
		);

-- 사원
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "FK_DEPT_TO_EMPLOYEE" -- 부서 -> 사원
		FOREIGN KEY (
			"DEPT_NO" -- 부서코드
		)
		REFERENCES "DEPT" ( -- 부서
			"DEPT_NO" -- 부서코드
		);

-- 사원
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "FK_GRADE_TO_EMPLOYEE" -- 권한단계 -> 사원
		FOREIGN KEY (
			"GRADE_CODE" -- 권한코드
		)
		REFERENCES "GRADE" ( -- 권한단계
			"GRADE_CODE" -- 권한코드
		);

-- 사원
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "FK_STORE_TO_EMPLOYEE" -- 점포 -> 사원
		FOREIGN KEY (
			"STORE_CODE" -- 점포코드
		)
		REFERENCES "STORE" ( -- 점포
			"STORE_CODE" -- 점포코드
		);

-- 매출
ALTER TABLE "SALES"
	ADD
		CONSTRAINT "FK_STORE_TO_SALES" -- 점포 -> 매출2
		FOREIGN KEY (
			"STORE_CODE" -- 점포코드
		)
		REFERENCES "STORE" ( -- 점포
			"STORE_CODE" -- 점포코드
		);

-- 매출상세
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_SALES_DE" -- 의류상품 -> 매출상세
		FOREIGN KEY (
			"PD_CODE" -- 상품코드
		)
		REFERENCES "PRODUCTS" ( -- 의류상품
			"PD_CODE" -- 상품코드
		);

-- 매출상세
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_SALES_TO_SALES_DE" -- 매출 -> 매출상세
		FOREIGN KEY (
			"SALES_CODE" -- 매출코드
		)
		REFERENCES "SALES" ( -- 매출
			"SALES_CODE" -- 매출코드
		);

-- 매출상세
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_MEMBER_TO_SALES_DE" -- 회원 -> 매출상세
		FOREIGN KEY (
			"MEMBER_CODE" -- 구매자
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원코드
		);

-- 매출상세
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_COUPON_TO_SALES_DE" -- 할인쿠폰 -> 매출상세
		FOREIGN KEY (
			"CP_CODE" -- 사용쿠폰번호
		)
		REFERENCES "COUPON" ( -- 할인쿠폰
			"CP_CODE" -- 쿠폰번호
		);

-- 접속정보
ALTER TABLE "LOG"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_LOG" -- 사원 -> 접속정보
		FOREIGN KEY (
			"EMP_NO" -- 사원코드
		)
		REFERENCES "EMPLOYEE" ( -- 사원
			"EMP_NO" -- 사원코드
		);

-- 입고/반품관리(매장기준)
ALTER TABLE "INOUT"
	ADD
		CONSTRAINT "FK_AREA_TO_INOUT" -- 재고위치 -> 입고/반품관리(매장기준)
		FOREIGN KEY (
			"AREA_START" -- 출발지
		)
		REFERENCES "AREA" ( -- 재고위치
			"AREA_CODE" -- 재고위치코드
		);

-- 입고/반품관리(매장기준)
ALTER TABLE "INOUT"
	ADD
		CONSTRAINT "FK_AREA_TO_INOUT2" -- 재고위치 -> 입고/반품관리(매장기준)2
		FOREIGN KEY (
			"AREA_END" -- 도착지
		)
		REFERENCES "AREA" ( -- 재고위치
			"AREA_CODE" -- 재고위치코드
		);

-- 입고/반품품목
ALTER TABLE "INOUT_DETAIL"
	ADD
		CONSTRAINT "FK_INOUT_TO_INOUT_DETAIL" -- 입고/반품관리(매장기준) -> 입고/반품품목
		FOREIGN KEY (
			"INOUT_CODE" -- 입고/반품코드
		)
		REFERENCES "INOUT" ( -- 입고/반품관리(매장기준)
			"INOUT_CODE" -- 입고/반품코드
		);

-- 입고/반품품목
ALTER TABLE "INOUT_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_INOUT_DETAIL" -- 의류상품 -> 입고/반품품목
		FOREIGN KEY (
			"PD_CODE" -- 상품코드
		)
		REFERENCES "PRODUCTS" ( -- 의류상품
			"PD_CODE" -- 상품코드
		);



-- 점간이동현황
ALTER TABLE "TRANSPORT"
	ADD
		CONSTRAINT "FK_STORE_TO_TP" -- 점포 -> 점간이동현황
		FOREIGN KEY (
			"STORE_CODE" -- 출발지점
		)
		REFERENCES "STORE" ( -- 점포
			"STORE_CODE" -- 점포코드
		);

-- 점간이동현황
ALTER TABLE "TRANSPORT"
	ADD
		CONSTRAINT "FK_STORE_TO_TP2" -- 점포 -> 점간이동현황2
		FOREIGN KEY (
			"STORE_CODE2" -- 도착지점
		)
		REFERENCES "STORE" ( -- 점포
			"STORE_CODE" -- 점포코드
		);

-- 점간이동상세
ALTER TABLE "TRANSPORT_DETAIL"
	ADD
		CONSTRAINT "FK_TP_TO_TP_DETAIL" -- 점간이동현황 -> 점간이동상세
		FOREIGN KEY (
			"TP_CODE" -- 점간이동코드
		)
		REFERENCES "TRANSPORT" ( -- 점간이동현황
			"TP_CODE" -- 점간이동코드
		);

-- 점간이동상세
ALTER TABLE "TRANSPORT_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_TP_DETAIL" -- 의류상품 -> 점간이동상세
		FOREIGN KEY (
			"PD_CODE" -- 상품코드
		)
		REFERENCES "PRODUCTS" ( -- 의류상품
			"PD_CODE" -- 상품코드
		);

-- 회원
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "FK_STORE_TO_MEMBER" -- 점포 -> 회원
		FOREIGN KEY (
			"STORE_CODE" -- 가입지점
		)
		REFERENCES "STORE" ( -- 점포
			"STORE_CODE" -- 점포코드
		);

-- 포인트이력
ALTER TABLE "POINT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_POINT" -- 회원 -> 포인트이력
		FOREIGN KEY (
			"MEMBER_CODE" -- 회원코드
		)
		REFERENCES "MEMBER" ( -- 회원
			"MEMBER_CODE" -- 회원코드
		);


-- 구매현황
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_ACC_DETAIL" -- 의류상품 -> 구매현황
		FOREIGN KEY (
			"PD_CODE" -- 상품코드
		)
		REFERENCES "PRODUCTS" ( -- 의류상품
			"PD_CODE" -- 상품코드
		);

-- 구매현황
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "FK_ACC_TO_ACC_DETAIL" -- 구매처 -> 구매현황
		FOREIGN KEY (
			"ACC_CODE" -- 구매처코드
		)
		REFERENCES "ACCOUNT" ( -- 구매처
			"ACC_CODE" -- 구매처코드
		);

-- 구매현황
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "FK_WH_TO_ACC_DETAIL" -- 창고 -> 구매현황
		FOREIGN KEY (
			"WH_CODE" -- 받을창고
		)
		REFERENCES "WAREHOUSE" ( -- 창고
			"WH_CODE" -- 창고코드
		);

-- 공지사항
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "FK_EMP_TO_NOTICE" -- 사원 -> 공지사항
		FOREIGN KEY (
			"EMP_NO" -- 사원코드
		)
		REFERENCES "EMPLOYEE" ( -- 사원
			"EMP_NO" -- 사원코드
		);

-- 보내는쪽지
ALTER TABLE "MAIL"
	ADD
		CONSTRAINT "FK_EMP_TO_MAIL" -- 사원 -> 보내는쪽지
		FOREIGN KEY (
			"SENDER" -- 보낸사람
		)
		REFERENCES "EMPLOYEE" ( -- 사원
			"EMP_NO" -- 사원코드
		);

-- 받는쪽지
ALTER TABLE "GET_MAIL"
	ADD
		CONSTRAINT "FK_MAIL_TO_GET_MAIL" -- 보내는쪽지 -> 받는쪽지
		FOREIGN KEY (
			"MAIL_NO" -- 메일번호
		)
		REFERENCES "MAIL" ( -- 보내는쪽지
			"MAIL_NO" -- 메일번호
		);

-- 받는쪽지
ALTER TABLE "GET_MAIL"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_GET_MAIL" -- 사원 -> 받는쪽지
		FOREIGN KEY (
			"EMP_NO" -- 받는사람
		)
		REFERENCES "EMPLOYEE" ( -- 사원
			"EMP_NO" -- 사원코드
		);