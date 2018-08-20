
-- ��Ÿ��
CREATE TABLE "STYLE" (
	"STYLE_CODE" VARCHAR2(20) NOT NULL, -- ��Ÿ���ڵ�
	"STYLE_NAME" VARCHAR2(50) NOT NULL  -- ��Ÿ������
);

-- ��Ÿ�� �⺻Ű
CREATE UNIQUE INDEX "PK_STYLE"
	ON "STYLE" ( -- ��Ÿ��
		"STYLE_CODE" ASC -- ��Ÿ���ڵ�
	);

-- ��Ÿ��
ALTER TABLE "STYLE"
	ADD
		CONSTRAINT "PK_STYLE" -- ��Ÿ�� �⺻Ű
		PRIMARY KEY (
			"STYLE_CODE" -- ��Ÿ���ڵ�
		);

-- �Ƿ���ǰ
CREATE TABLE "PRODUCTS" (
	"PD_CODE"          VARCHAR2(50) NOT NULL, -- ��ǰ�ڵ�
	"PD_NAME"          VARCHAR2(100) NOT NULL, -- ��ǰ�̸�
	"PD_ORIGINALPRICE" NUMBER        NOT NULL, -- ����
	"PD_SELLPRICE"     NUMBER        NOT NULL, -- �ǸŰ�
	"PD_REGDATE"       DATE          DEFAULT sysdate, -- ��ϳ�¥
	"PD_EXPLANATION"   VARCHAR2(100) NULL,     -- ��ǰ����
	"PD_WARNING"       VARCHAR2(100) NULL,     -- ���ǻ���
	"PD_IMAGE"         VARCHAR2(100) NULL,     -- ��ǰ�̹���
	"STYLE_CODE"       VARCHAR2(20) NULL,     -- ��Ÿ���ڵ�
	"COLOR_CODE"       VARCHAR2(20) NULL,     -- �����ڵ�
	"SEASON_CODE"      VARCHAR2(20) NULL,     -- �����ڵ�
	"SIZE_CODE"        VARCHAR2(20) NULL,     -- �������ڵ�
	"ACC_CODE"         VARCHAR2(50) NULL,     -- ����ó
	"GENDER_CODE"      VARCHAR2(10)   NULL      -- ����
);

-- �Ƿ���ǰ �⺻Ű
CREATE UNIQUE INDEX "PK_PRODUCTS"
	ON "PRODUCTS" ( -- �Ƿ���ǰ
		"PD_CODE" ASC -- ��ǰ�ڵ�
	);

-- �Ƿ���ǰ
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "PK_PRODUCTS" -- �Ƿ���ǰ �⺻Ű
		PRIMARY KEY (
			"PD_CODE" -- ��ǰ�ڵ�
		);

-- ����
CREATE TABLE "COLOR" (
	"COLOR_CODE"  VARCHAR2(20) NOT NULL, -- �����ڵ�
	"COLOR_NAME"  VARCHAR2(50) NOT NULL, -- �����̸�
	"COLOR_IMAGE" VARCHAR2(100) NULL      -- �����̹���
);

-- ���� �⺻Ű
CREATE UNIQUE INDEX "PK_COLOR"
	ON "COLOR" ( -- ����
		"COLOR_CODE" ASC -- �����ڵ�
	);

-- ����
ALTER TABLE "COLOR"
	ADD
		CONSTRAINT "PK_COLOR" -- ���� �⺻Ű
		PRIMARY KEY (
			"COLOR_CODE" -- �����ڵ�
		);

-- ����
CREATE TABLE "SEASON" (
	"SEASON_CODE" VARCHAR2(20) NOT NULL, -- �����ڵ�
	"SEASON_NAME" VARCHAR2(20)  NOT NULL  -- ����
);

-- ���� �⺻Ű
CREATE UNIQUE INDEX "PK_SEASON"
	ON "SEASON" ( -- ����
		"SEASON_CODE" ASC -- �����ڵ�
	);

-- ����
ALTER TABLE "SEASON"
	ADD
		CONSTRAINT "PK_SEASON" -- ���� �⺻Ű
		PRIMARY KEY (
			"SEASON_CODE" -- �����ڵ�
		);



-- ������
CREATE TABLE "SIZE" (
	"SIZE_CODE" VARCHAR2(20) NOT NULL, -- �������ڵ�
	"SIZE_NAME" NUMBER        NOT NULL  -- ������
);

-- ������ �⺻Ű
CREATE UNIQUE INDEX "PK_SIZE"
	ON "SIZE" ( -- ������
		"SIZE_CODE" ASC -- �������ڵ�
	);

-- ������
ALTER TABLE "SIZE"
	ADD
		CONSTRAINT "PK_SIZE" -- ������ �⺻Ű
		PRIMARY KEY (
			"SIZE_CODE" -- �������ڵ�
		);

-- ����
CREATE TABLE "STORE" (
	"STORE_CODE"    VARCHAR2(50) NOT NULL, -- �����ڵ�
	"EMP_NO"        VARCHAR2(50) NOT NULL, -- ����
	"STORE_ZIPCODE" VARCHAR2(20) NOT NULL, -- �����ȣ
	"STORE_ADDRESS" VARCHAR2(100) NOT NULL, -- �����ּ�
	"STORE_JOIN"    DATE         DEFAULT sysdate, -- ��ϳ�¥
	"STORE_IMAGE"   VARCHAR2(100) NULL,     -- �̹���
	"STA_CODE"     VARCHAR2(50) NOT NULL, -- �����ġ�ڵ�
	"STORE_DEL"     DATE     NULL      -- ��⳯¥
);

-- ���� �⺻Ű2
CREATE UNIQUE INDEX "PK_STORE"
	ON "STORE" ( -- ����
		"STORE_CODE" ASC -- �����ڵ�
	);

-- ����
ALTER TABLE "STORE"
	ADD
		CONSTRAINT "PK_STORE" -- ���� �⺻Ű2
		PRIMARY KEY (
			"STORE_CODE" -- �����ڵ�
		);

-- â��
CREATE TABLE "WAREHOUSE" (
	"WH_CODE"    VARCHAR2(50) NOT NULL, -- â���ڵ�
	"WH_NAME"    VARCHAR2(50) NOT NULL, -- â���̸�
	"WH_ADDRESS" VARCHAR2(100) NOT NULL, -- â���ּ�
	"WH_IMAGE"   VARCHAR2(100) NULL,     -- â���̹���
	"WH_REGDATE" DATE        DEFAULT sysdate, -- ��ϳ�¥
	"STA_CODE"  VARCHAR2(50) NOT NULL, -- �����ġ�ڵ�
	"WH_ZIPCODE"        VARCHAR2(20)  NOT NULL  -- â�� �����ȣ
);

-- â�� �⺻Ű
CREATE UNIQUE INDEX "PK_WAREHOUSE"
	ON "WAREHOUSE" ( -- â��
		"WH_CODE" ASC -- â���ڵ�
	);

-- â��
ALTER TABLE "WAREHOUSE"
	ADD
		CONSTRAINT "PK_WAREHOUSE" -- â�� �⺻Ű
		PRIMARY KEY (
			"WH_CODE" -- â���ڵ�
		);

-- �μ�
CREATE TABLE "DEPT" (
	"DEPT_NO"   VARCHAR2(50) NOT NULL, -- �μ��ڵ�
	"DEPT_NAME" VARCHAR2(50) NOT NULL  -- �μ��̸�
);

-- �μ� �⺻Ű3
CREATE UNIQUE INDEX "PK_DEPT"
	ON "DEPT" ( -- �μ�
		"DEPT_NO" ASC -- �μ��ڵ�
	);

-- �μ�
ALTER TABLE "DEPT"
	ADD
		CONSTRAINT "PK_DEPT" -- �μ� �⺻Ű3
		PRIMARY KEY (
			"DEPT_NO" -- �μ��ڵ�
		);

-- �����ġ
CREATE TABLE "STOCK_AREA" (
	"STA_CODE" VARCHAR2(50) NOT NULL, -- �����ġ�ڵ�
	"AREA_CODE" VARCHAR2(50) NOT NULL
);

-- ����
CREATE TABLE "AREA" (
    "AREA_CODE" VARCHAR2(50) PRIMARY KEY,   --�����ڵ�
    "AREA_NAME" VARCHAR2(30) NOT NULL,  --���� �̸�
    "EMP_NO"    VARCHAR2(50) NULL   -- ���������
);

-- ����
ALTER TABLE "STOCK_AREA"
	ADD
		CONSTRAINT "FK_AREA_TO_STOCK_AREA" -- ���� -> �Ƿ���ǰ
		FOREIGN KEY (
			"AREA_CODE" -- �����ڵ�
		)
		REFERENCES "AREA" ( -- ����
			"AREA_CODE" -- �����ڵ�
		);

ALTER TABLE "AREA"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_AREA" -- ���� -> �Ƿ���ǰ
		FOREIGN KEY (
			"EMP_NO" -- �����ڵ�
		)
		REFERENCES "EMPLOYEE" ( -- ����
			"EMP_NO" -- �����ڵ�
		);
		
		
-- �����ġ �⺻Ű
CREATE UNIQUE INDEX "PK_STOCK_AREA"
	ON "STOCK_AREA" ( -- �����ġ
		"STA_CODE" ASC -- �����ġ�ڵ�
	);

-- �����ġ
ALTER TABLE "STOCK_AREA"
	ADD
		CONSTRAINT "PK_STOCK_AREA" -- �����ġ �⺻Ű
		PRIMARY KEY (
			"STA_CODE" -- �����ġ�ڵ�
		);

-- ���
CREATE TABLE "STOCK" (
	"STOCK_PK"  NUMBER        NOT NULL, -- ���PK
	"STA_CODE" VARCHAR2(50) NOT NULL, -- �����ġ�ڵ�
	"PD_CODE"   VARCHAR2(50) NULL,     -- ��ǰ�ڵ�
	"STOCK_QTY" NUMBER        NULL      -- ����
);

-- ��� �⺻Ű2
CREATE UNIQUE INDEX "PK_STOCK"
	ON "STOCK" ( -- ���
		"STOCK_PK" ASC -- ���PK
	);

-- ���
ALTER TABLE "STOCK"
	ADD
		CONSTRAINT "PK_STOCK" -- ��� �⺻Ű2
		PRIMARY KEY (
			"STOCK_PK" -- ���PK
		);

-- ���
CREATE TABLE "EMPLOYEE" (
	"EMP_NO"       VARCHAR2(50) NOT NULL, -- ����ڵ�
	"DEPT_NO"      VARCHAR2(50) NOT NULL, -- �μ��ڵ�
	"EMP_NAME"     VARCHAR2(30) NOT NULL, -- �̸�
	"EMP_PWD"      VARCHAR2(50) NOT NULL, -- ��й�ȣ
	"EMP_COUNT"    NUMBER       DEFAULT 0 , -- ��й�ȣ 5ȸ
	"EMP_ZIPCODE"  VARCHAR2(20) NOT NULL, -- �����ȣ
	"EMP_ADDRESS"  VARCHAR2(100) NOT NULL, -- �ּ�
	"EMP_JUMIN"    VARCHAR2(30) NOT NULL, -- �ֹι�ȣ
	"EMP_TEL"      VARCHAR2(30) NOT NULL, -- ��ȭ��ȣ
	"EMP_FACE"     VARCHAR2(100) NULL,     -- �̹���
	"EMP_JOB"      VARCHAR2(100) NULL,     -- ������
	"EMP_JOINDATE" DATE     NULL,     -- �Ի糯¥
	"EMP_OUTDATE"  DATE     NULL,     -- ��糯¥
	"GRADE_CODE"   VARCHAR2(20) NOT NULL, -- �����ڵ�
	"EMP_DEL"      VARCHAR2(10)      DEFAULT 'N', -- �����Ͽ���
	"STORE_CODE"   VARCHAR2(50) NULL,     -- �����ڵ�
	"EMP_EMAIL"    VARCHAR2(100)  NOT NULL  -- �̸���
);

-- ��� �⺻Ű
CREATE UNIQUE INDEX "PK_EMPLOYEE"
	ON "EMPLOYEE" ( -- ���
		"EMP_NO" ASC -- ����ڵ�
	);

-- ���
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "PK_EMPLOYEE" -- ��� �⺻Ű
		PRIMARY KEY (
			"EMP_NO" -- ����ڵ�
		);

-- ����
CREATE TABLE "SALES" (
	"SALES_CODE"    VARCHAR2(50) NOT NULL, -- �����ڵ�
	"SALES_REGDATE" DATE     NOT NULL, -- ��¥
	"STORE_CODE"    VARCHAR2(50) NOT NULL  -- �����ڵ�
);

-- ���� �⺻Ű2
CREATE UNIQUE INDEX "PK_SALES"
	ON "SALES" ( -- ����
		"SALES_CODE" ASC -- �����ڵ�
	);

-- ����
ALTER TABLE "SALES"
	ADD
		CONSTRAINT "PK_SALES" -- ���� �⺻Ű2
		PRIMARY KEY (
			"SALES_CODE" -- �����ڵ�
		);

-- �����
CREATE TABLE "SALES_DETAIL" (
	"SALES_DETAIL_PK"    NUMBER        NOT NULL, -- �����PK
	"SALES_CODE"         VARCHAR2(50) NOT NULL, -- �����ڵ�
	"PD_CODE"            VARCHAR2(50) NOT NULL, -- ��ǰ�ڵ�
	"SALES_DETAIL_QTY"   NUMBER        NOT NULL, -- ����
	"SALES_DETAIL_TOTAL" NUMBER        NOT NULL, -- �Ѱ���
	"SALES_DETAIL_DATE"  DATE         DEFAULT sysdate, -- ������
	"MEMBER_CODE"        VARCHAR2(50) NULL,     -- ������
	"SALES_DETAIL_PLUSP" NUMBER        NULL,     -- ��������Ʈ
	"SALES_DETAIL_USEP"  NUMBER        NULL,     -- �������Ʈ
	"CP_CODE"            VARCHAR2(50) NULL      -- ���������ȣ
);

-- ����� �⺻Ű
CREATE UNIQUE INDEX "PK_SALES_DETAIL"
	ON "SALES_DETAIL" ( -- �����
		"SALES_DETAIL_PK" ASC -- �����PK
	);

-- �����
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "PK_SALES_DETAIL" -- ����� �⺻Ű
		PRIMARY KEY (
			"SALES_DETAIL_PK" -- �����PK
		);


-- ���Ѵܰ�
CREATE TABLE "GRADE" (
	"GRADE_CODE" VARCHAR2(20) NOT NULL, -- �����ڵ�
	"GRADE_NAME" VARCHAR2(30) NULL      -- ���Ѹ�
);

-- ���Ѵܰ� �⺻Ű
CREATE UNIQUE INDEX "PK_GRADE"
	ON "GRADE" ( -- ���Ѵܰ�
		"GRADE_CODE" ASC -- �����ڵ�
	);

-- ���Ѵܰ�
ALTER TABLE "GRADE"
	ADD
		CONSTRAINT "PK_GRADE" -- ���Ѵܰ� �⺻Ű
		PRIMARY KEY (
			"GRADE_CODE" -- �����ڵ�
		);

-- ��������
CREATE TABLE "LOG" (
	"LOG_PK"  NUMBER        NOT NULL, -- ��������PK
	"EMP_NO"  VARCHAR2(50) NOT NULL, -- ����ڵ�
	"LOG_IP"  VARCHAR2(30) NOT NULL, -- ����IP
	"LOG_IN"  DATE     NULL,     -- �α��νð�
	"LOG_OUT" DATE     NULL      -- �α׾ƿ��ð�
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX "PK_LOG"
	ON "LOG" ( -- ��������
		"LOG_PK" ASC -- ��������PK
	);

-- ��������
ALTER TABLE "LOG"
	ADD
		CONSTRAINT "PK_LOG" -- �������� �⺻Ű
		PRIMARY KEY (
			"LOG_PK" -- ��������PK
		);

-- �԰�/��ǰ����(�������)
CREATE TABLE "INOUT" (
	"INOUT_CODE"      VARCHAR2(50) NOT NULL, -- �԰�/��ǰ�ڵ�
	"INOUT_STARTDATE" DATE     NOT NULL, -- ����Ͻ�
	"INOUT_STATUS"    VARCHAR2(20)      DEFAULT '���δ��', -- ����
	"INOUT_ENDDATE"   DATE     NULL,     -- ���������Ͻ�
	"AREA_START"      VARCHAR2(50) NOT NULL, -- �����
	"AREA_END"        VARCHAR2(50) NOT NULL, -- ������
	"IS_IN"           VARCHAR2(10)    DEFAULT '�԰�', -- �԰�/��ǰ����
	"OUT_DETAIL"      VARCHAR2(100) NULL      -- ��ǰ����
);

-- �԰�/��ǰ����(�������) �⺻Ű
CREATE UNIQUE INDEX "PK_INOUT"
	ON "INOUT" ( -- �԰�/��ǰ����(�������)
		"INOUT_CODE" ASC -- �԰�/��ǰ�ڵ�
	);

-- �԰�/��ǰ����(�������)
ALTER TABLE "INOUT"
	ADD
		CONSTRAINT "PK_INOUT" -- �԰�/��ǰ����(�������) �⺻Ű
		PRIMARY KEY (
			"INOUT_CODE" -- �԰�/��ǰ�ڵ�
		);

-- �԰�/��ǰǰ��
CREATE TABLE "INOUT_DETAIL" (
	"INOUT_DETAIL_PK"  number        NOT NULL, -- �԰�/��ǰPK
	"INOUT_CODE"       VARCHAR2(50) NOT NULL, -- �԰�/��ǰ�ڵ�
	"PD_CODE"          VARCHAR2(50) NOT NULL, -- ��ǰ�ڵ�
	"INOUT_DETAIL_QTY" NUMBER        NOT NULL  -- ����
);

-- �԰�/��ǰǰ�� �⺻Ű
CREATE UNIQUE INDEX "PK_INOUT_DETAIL"
	ON "INOUT_DETAIL" ( -- �԰�/��ǰǰ��
		"INOUT_DETAIL_PK" ASC -- �԰�/��ǰPK
	);

-- �԰�/��ǰǰ��
ALTER TABLE "INOUT_DETAIL"
	ADD
		CONSTRAINT "PK_INOUT_DETAIL" -- �԰�/��ǰǰ�� �⺻Ű
		PRIMARY KEY (
			"INOUT_DETAIL_PK" -- �԰�/��ǰPK
		);

-- �����̵���Ȳ
CREATE TABLE "TRANSPORT" (
	"TP_CODE"     VARCHAR2(50) NOT NULL, -- �����̵��ڵ�
	"STORE_CODE"  VARCHAR2(50) NOT NULL, -- �������
	"TP_REGDATE"  DATE     NOT NULL, -- ��û��¥
	"TP_ISAGREE"  VARCHAR2(10)     DEFAULT 'N', -- �³�����
	"STORE_CODE2" VARCHAR2(50) NOT NULL  -- ��������
);

-- �����̵���Ȳ �⺻Ű
CREATE UNIQUE INDEX "PK_TRANSPORT"
	ON "TRANSPORT" ( -- �����̵���Ȳ
		"TP_CODE" ASC -- �����̵��ڵ�
	);

-- �����̵���Ȳ
ALTER TABLE "TRANSPORT"
	ADD
		CONSTRAINT "PK_TRANSPORT" -- �����̵���Ȳ �⺻Ű
		PRIMARY KEY (
			"TP_CODE" -- �����̵��ڵ�
		);

-- �����̵���
CREATE TABLE "TRANSPORT_DETAIL" (
	"TP_DETAIL_PK" NUMBER        NOT NULL, -- �����̵���PK
	"TP_CODE"      VARCHAR2(50) NOT NULL, -- �����̵��ڵ�
	"PD_CODE"      VARCHAR2(50) NOT NULL, -- ��ǰ�ڵ�
	"QUANTITY"     NUMBER        NOT NULL  -- ����
);

-- �����̵��� �⺻Ű
CREATE UNIQUE INDEX "PK_TRANSPORT_DETAIL"
	ON "TRANSPORT_DETAIL" ( -- �����̵���
		"TP_DETAIL_PK" ASC -- �����̵���PK
	);

-- �����̵���
ALTER TABLE "TRANSPORT_DETAIL"
	ADD
		CONSTRAINT "PK_TRANSPORT_DETAIL" -- �����̵��� �⺻Ű
		PRIMARY KEY (
			"TP_DETAIL_PK" -- �����̵���PK
		);


-- ����ó
CREATE TABLE "ACCOUNT" (
	"ACC_CODE"    VARCHAR2(50) NOT NULL, -- ����ó�ڵ�
	"ACC_NAME"    VARCHAR2(100) NOT NULL, -- ȸ���
	"ACC_ZIPCODE" VARCHAR2(20) NOT NULL, -- �����ȣ
	"ACC_ADDRESS" VARCHAR2(100) NOT NULL, -- �ּ�
	"ACC_TEL"     VARCHAR2(30) NOT NULL, -- ��ȭ��ȣ
	"ACC_CEO"     VARCHAR2(50) NOT NULL, -- ��ǥ�ڼ���
	"ACC_NO"      VARCHAR2(30) NOT NULL, -- ����ڵ�Ϲ�ȣ
	"ACC_ISDEAL"  VARCHAR2(10)    DEFAULT 'Y', -- ��뿩��
	"ACC_UNIQUE"  VARCHAR2(100) NULL      -- Ư�̻���
);

-- ����ó �⺻Ű
CREATE UNIQUE INDEX "PK_ACCOUNT"
	ON "ACCOUNT" ( -- ����ó
		"ACC_CODE" ASC -- ����ó�ڵ�
	);

-- ����ó
ALTER TABLE "ACCOUNT"
	ADD
		CONSTRAINT "PK_ACCOUNT" -- ����ó �⺻Ű
		PRIMARY KEY (
			"ACC_CODE" -- ����ó�ڵ�
		);

-- ������Ȳ
CREATE TABLE "ACCOUNT_DETAIL" (
	"ACC_DT_CODE"    VARCHAR2(50) NOT NULL, -- ��Ȳ�ڵ�
	"ACC_CODE"       VARCHAR2(50) NOT NULL, -- ����ó�ڵ�
	"ACC_DT_REGDATE" DATE      DEFAULT sysdate, -- �ֹ�����
	"PD_CODE"        VARCHAR2(50) NOT NULL, -- ��ǰ�ڵ�
	"ACC_DT_QTY"     NUMBER        NOT NULL, -- �ֹ�����
	"ACC_DT_INDATE"  DATE     NULL,     -- �԰�����
	"ACC_DT_ISAGREE" VARCHAR2(10)      DEFAULT 'N', -- �ֹ�Ȯ�ο���
	"WH_CODE"        VARCHAR2(50) NOT NULL  -- ����â��
);

-- ������Ȳ �⺻Ű
CREATE UNIQUE INDEX "PK_ACCOUNT_DETAIL"
	ON "ACCOUNT_DETAIL" ( -- ������Ȳ
		"ACC_DT_CODE" ASC -- ��Ȳ�ڵ�
	);

-- ������Ȳ
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "PK_ACCOUNT_DETAIL" -- ������Ȳ �⺻Ű
		PRIMARY KEY (
			"ACC_DT_CODE" -- ��Ȳ�ڵ�
		);
-- ��������
CREATE TABLE "NOTICE" (
	"NOTICE_NO"      NUMBER        NOT NULL, -- �۹�ȣ
	"NOTICE_TITLE"   VARCHAR2(200) NOT NULL, -- ����
	"EMP_NO"         VARCHAR2(50) NOT NULL, -- ����ڵ�
	"NOTICE_CONTENT" CLOB          NOT NULL, -- ����
	"NOTICE_READ"    NUMBER           DEFAULT 0 -- ��ȸ��
);

-- �������� �⺻Ű
CREATE UNIQUE INDEX "PK_NOTICE"
	ON "NOTICE" ( -- ��������
		"NOTICE_NO" ASC -- �۹�ȣ
	);

-- ��������
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "PK_NOTICE" -- �������� �⺻Ű
		PRIMARY KEY (
			"NOTICE_NO" -- �۹�ȣ
		);


-- ����������
CREATE TABLE "MAIL" (
	"MAIL_NO"        NUMBER        NOT NULL, -- ���Ϲ�ȣ
	"SENDER"         VARCHAR2(50) NOT NULL, -- �������
	"MAIL_CONTENT"   CLOB          NULL,     -- ����
	"MAIL_FILE"      VARCHAR2(100) NULL,     -- ����
	"MAIL_SDATE"     DATE        DEFAULT SYSDATE, -- �߼۳�¥
	"MAIL_SENDERDEL" VARCHAR2(10)      DEFAULT 'N', -- �����̻�������
	"MAIL_SAVE"      VARCHAR2(10)  NULL      -- ��������
);

-- ���������� �⺻Ű
CREATE UNIQUE INDEX "PK_MAIL"
	ON "MAIL" ( -- ����������
		"MAIL_NO" ASC -- ���Ϲ�ȣ
	);

-- ����������
ALTER TABLE "MAIL"
	ADD
		CONSTRAINT "PK_MAIL" -- ���������� �⺻Ű
		PRIMARY KEY (
			"MAIL_NO" -- ���Ϲ�ȣ
		);

-- �޴�����
CREATE TABLE "GET_MAIL" (
	"GET_MAIL_PK"   NUMBER        NOT NULL, -- �޴�����PK
	"MAIL_NO"       NUMBER        NOT NULL, -- ���Ϲ�ȣ
	"EMP_NO"        VARCHAR2(50) NOT NULL, -- �޴»��
	"GET_MAIL_DEL"  VARCHAR2(10)  DEFAULT 'N',   -- �޴��̻�������
	"GET_MAIL_SAVE" VARCHAR2(10)  NULL,      -- ��������
	"GET_MAIL_READ" VARCHAR2(10)  DEFAULT 'N'      -- ��������
);

-- �޴����� �⺻Ű
CREATE UNIQUE INDEX "PK_GET_MAIL"
	ON "GET_MAIL" ( -- �޴�����
		"GET_MAIL_PK" ASC -- �޴�����PK
	);

-- �޴�����
ALTER TABLE "GET_MAIL"
	ADD
		CONSTRAINT "PK_GET_MAIL" -- �޴����� �⺻Ű
		PRIMARY KEY (
			"GET_MAIL_PK" -- �޴�����PK
		);

-- �Ƿ���ǰ
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_STYLE_TO_PRODUCTS" -- ��Ÿ�� -> �Ƿ���ǰ
		FOREIGN KEY (
			"STYLE_CODE" -- ��Ÿ���ڵ�
		)
		REFERENCES "STYLE" ( -- ��Ÿ��
			"STYLE_CODE" -- ��Ÿ���ڵ�
		);

-- �Ƿ���ǰ
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_COLOR_TO_PRODUCTS" -- ���� -> �Ƿ���ǰ
		FOREIGN KEY (
			"COLOR_CODE" -- �����ڵ�
		)
		REFERENCES "COLOR" ( -- ����
			"COLOR_CODE" -- �����ڵ�
		);

-- �Ƿ���ǰ
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_SEASON_TO_PRODUCTS" -- ���� -> �Ƿ���ǰ
		FOREIGN KEY (
			"SEASON_CODE" -- �����ڵ�
		)
		REFERENCES "SEASON" ( -- ����
			"SEASON_CODE" -- �����ڵ�
		);

-- �Ƿ���ǰ
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_SIZE_TO_PRODUCTS" -- ������ -> �Ƿ���ǰ
		FOREIGN KEY (
			"SIZE_CODE" -- �������ڵ�
		)
		REFERENCES "SIZE" ( -- ������
			"SIZE_CODE" -- �������ڵ�
		);

-- �Ƿ���ǰ
ALTER TABLE "PRODUCTS"
	ADD
		CONSTRAINT "FK_ACC_TO_PD" -- ����ó -> �Ƿ���ǰ
		FOREIGN KEY (
			"ACC_CODE" -- ����ó
		)
		REFERENCES "ACCOUNT" ( -- ����ó
			"ACC_CODE" -- ����ó�ڵ�
		);

-- ����
ALTER TABLE "STORE"
	ADD
		CONSTRAINT "FK_STOCK_AREA_TO_STORE" -- �����ġ -> ����
		FOREIGN KEY (
			"STA_CODE" -- �����ġ�ڵ�
		)
		REFERENCES "STOCK_AREA" ( -- �����ġ
			"STA_CODE" -- �����ġ�ڵ�
		);

-- ����
ALTER TABLE "STORE"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_STORE" -- ��� -> ����
		FOREIGN KEY (
			"EMP_NO" -- ����
		)
		REFERENCES "EMPLOYEE" ( -- ���
			"EMP_NO" -- ����ڵ�
		);


-- â��
ALTER TABLE "WAREHOUSE"
	ADD
		CONSTRAINT "FK_STOCK_AREA_TO_WAREHOUSE" -- �����ġ -> â��
		FOREIGN KEY (
			"STA_CODE" -- �����ġ�ڵ�
		)
		REFERENCES "STOCK_AREA" ( -- �����ġ
			"STA_CODE" -- �����ġ�ڵ�
		);

-- �����ġ
ALTER TABLE "AREA"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_AREA" -- ��� -> �����ġ
		FOREIGN KEY (
			"EMP_NO" -- ����ڵ�
		)
		REFERENCES "EMPLOYEE" ( -- ���
			"EMP_NO" -- ����ڵ�
		);

-- ���
ALTER TABLE "STOCK"
	ADD
		CONSTRAINT "FK_PRODUCTS_TO_STOCK" -- �Ƿ���ǰ -> ���
		FOREIGN KEY (
			"PD_CODE" -- ��ǰ�ڵ�
		)
		REFERENCES "PRODUCTS" ( -- �Ƿ���ǰ
			"PD_CODE" -- ��ǰ�ڵ�
		);

-- ���
ALTER TABLE "STOCK"
	ADD
		CONSTRAINT "FK_STOCK_AREA_TO_STOCK" -- �����ġ -> ���
		FOREIGN KEY (
			"STA_CODE" -- �����ġ�ڵ�
		)
		REFERENCES "STOCK_AREA" ( -- �����ġ
			"STA_CODE" -- �����ġ�ڵ�
		);

-- ���
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "FK_DEPT_TO_EMPLOYEE" -- �μ� -> ���
		FOREIGN KEY (
			"DEPT_NO" -- �μ��ڵ�
		)
		REFERENCES "DEPT" ( -- �μ�
			"DEPT_NO" -- �μ��ڵ�
		);

-- ���
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "FK_GRADE_TO_EMPLOYEE" -- ���Ѵܰ� -> ���
		FOREIGN KEY (
			"GRADE_CODE" -- �����ڵ�
		)
		REFERENCES "GRADE" ( -- ���Ѵܰ�
			"GRADE_CODE" -- �����ڵ�
		);

-- ���
ALTER TABLE "EMPLOYEE"
	ADD
		CONSTRAINT "FK_STORE_TO_EMPLOYEE" -- ���� -> ���
		FOREIGN KEY (
			"STORE_CODE" -- �����ڵ�
		)
		REFERENCES "STORE" ( -- ����
			"STORE_CODE" -- �����ڵ�
		);

-- ����
ALTER TABLE "SALES"
	ADD
		CONSTRAINT "FK_STORE_TO_SALES" -- ���� -> ����2
		FOREIGN KEY (
			"STORE_CODE" -- �����ڵ�
		)
		REFERENCES "STORE" ( -- ����
			"STORE_CODE" -- �����ڵ�
		);

-- �����
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_SALES_DE" -- �Ƿ���ǰ -> �����
		FOREIGN KEY (
			"PD_CODE" -- ��ǰ�ڵ�
		)
		REFERENCES "PRODUCTS" ( -- �Ƿ���ǰ
			"PD_CODE" -- ��ǰ�ڵ�
		);

-- �����
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_SALES_TO_SALES_DE" -- ���� -> �����
		FOREIGN KEY (
			"SALES_CODE" -- �����ڵ�
		)
		REFERENCES "SALES" ( -- ����
			"SALES_CODE" -- �����ڵ�
		);

-- �����
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_MEMBER_TO_SALES_DE" -- ȸ�� -> �����
		FOREIGN KEY (
			"MEMBER_CODE" -- ������
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ���ڵ�
		);

-- �����
ALTER TABLE "SALES_DETAIL"
	ADD
		CONSTRAINT "FK_COUPON_TO_SALES_DE" -- �������� -> �����
		FOREIGN KEY (
			"CP_CODE" -- ���������ȣ
		)
		REFERENCES "COUPON" ( -- ��������
			"CP_CODE" -- ������ȣ
		);

-- ��������
ALTER TABLE "LOG"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_LOG" -- ��� -> ��������
		FOREIGN KEY (
			"EMP_NO" -- ����ڵ�
		)
		REFERENCES "EMPLOYEE" ( -- ���
			"EMP_NO" -- ����ڵ�
		);

-- �԰�/��ǰ����(�������)
ALTER TABLE "INOUT"
	ADD
		CONSTRAINT "FK_STOCK_AREA_TO_INOUT" -- �����ġ -> �԰�/��ǰ����(�������)
		FOREIGN KEY (
			"AREA_START" -- �����
		)
		REFERENCES "STOCK_AREA" ( -- �����ġ
			"STA_CODE" -- �����ġ�ڵ�
		);

-- �԰�/��ǰ����(�������)
ALTER TABLE "INOUT"
	ADD
		CONSTRAINT "FK_STOCK_AREA_TO_INOUT2" -- �����ġ -> �԰�/��ǰ����(�������)2
		FOREIGN KEY (
			"AREA_END" -- ������
		)
		REFERENCES "STOCK_AREA" ( -- �����ġ
			"STA_CODE" -- �����ġ�ڵ�
		);

-- �԰�/��ǰǰ��
ALTER TABLE "INOUT_DETAIL"
	ADD
		CONSTRAINT "FK_INOUT_TO_INOUT_DETAIL" -- �԰�/��ǰ����(�������) -> �԰�/��ǰǰ��
		FOREIGN KEY (
			"INOUT_CODE" -- �԰�/��ǰ�ڵ�
		)
		REFERENCES "INOUT" ( -- �԰�/��ǰ����(�������)
			"INOUT_CODE" -- �԰�/��ǰ�ڵ�
		);

-- �԰�/��ǰǰ��
ALTER TABLE "INOUT_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_INOUT_DETAIL" -- �Ƿ���ǰ -> �԰�/��ǰǰ��
		FOREIGN KEY (
			"PD_CODE" -- ��ǰ�ڵ�
		)
		REFERENCES "PRODUCTS" ( -- �Ƿ���ǰ
			"PD_CODE" -- ��ǰ�ڵ�
		);



-- �����̵���Ȳ
ALTER TABLE "TRANSPORT"
	ADD
		CONSTRAINT "FK_STORE_TO_TP" -- ���� -> �����̵���Ȳ
		FOREIGN KEY (
			"STORE_CODE" -- �������
		)
		REFERENCES "STORE" ( -- ����
			"STORE_CODE" -- �����ڵ�
		);

-- �����̵���Ȳ
ALTER TABLE "TRANSPORT"
	ADD
		CONSTRAINT "FK_STORE_TO_TP2" -- ���� -> �����̵���Ȳ2
		FOREIGN KEY (
			"STORE_CODE2" -- ��������
		)
		REFERENCES "STORE" ( -- ����
			"STORE_CODE" -- �����ڵ�
		);

-- �����̵���
ALTER TABLE "TRANSPORT_DETAIL"
	ADD
		CONSTRAINT "FK_TP_TO_TP_DETAIL" -- �����̵���Ȳ -> �����̵���
		FOREIGN KEY (
			"TP_CODE" -- �����̵��ڵ�
		)
		REFERENCES "TRANSPORT" ( -- �����̵���Ȳ
			"TP_CODE" -- �����̵��ڵ�
		);

-- �����̵���
ALTER TABLE "TRANSPORT_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_TP_DETAIL" -- �Ƿ���ǰ -> �����̵���
		FOREIGN KEY (
			"PD_CODE" -- ��ǰ�ڵ�
		)
		REFERENCES "PRODUCTS" ( -- �Ƿ���ǰ
			"PD_CODE" -- ��ǰ�ڵ�
		);

-- ȸ��
ALTER TABLE "MEMBER"
	ADD
		CONSTRAINT "FK_STORE_TO_MEMBER" -- ���� -> ȸ��
		FOREIGN KEY (
			"STORE_CODE" -- ��������
		)
		REFERENCES "STORE" ( -- ����
			"STORE_CODE" -- �����ڵ�
		);

-- ����Ʈ�̷�
ALTER TABLE "POINT"
	ADD
		CONSTRAINT "FK_MEMBER_TO_POINT" -- ȸ�� -> ����Ʈ�̷�
		FOREIGN KEY (
			"MEMBER_CODE" -- ȸ���ڵ�
		)
		REFERENCES "MEMBER" ( -- ȸ��
			"MEMBER_CODE" -- ȸ���ڵ�
		);


-- ������Ȳ
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "FK_PD_TO_ACC_DETAIL" -- �Ƿ���ǰ -> ������Ȳ
		FOREIGN KEY (
			"PD_CODE" -- ��ǰ�ڵ�
		)
		REFERENCES "PRODUCTS" ( -- �Ƿ���ǰ
			"PD_CODE" -- ��ǰ�ڵ�
		);

-- ������Ȳ
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "FK_ACC_TO_ACC_DETAIL" -- ����ó -> ������Ȳ
		FOREIGN KEY (
			"ACC_CODE" -- ����ó�ڵ�
		)
		REFERENCES "ACCOUNT" ( -- ����ó
			"ACC_CODE" -- ����ó�ڵ�
		);

-- ������Ȳ
ALTER TABLE "ACCOUNT_DETAIL"
	ADD
		CONSTRAINT "FK_WH_TO_ACC_DETAIL" -- â�� -> ������Ȳ
		FOREIGN KEY (
			"WH_CODE" -- ����â��
		)
		REFERENCES "WAREHOUSE" ( -- â��
			"WH_CODE" -- â���ڵ�
		);

-- ��������
ALTER TABLE "NOTICE"
	ADD
		CONSTRAINT "FK_EMP_TO_NOTICE" -- ��� -> ��������
		FOREIGN KEY (
			"EMP_NO" -- ����ڵ�
		)
		REFERENCES "EMPLOYEE" ( -- ���
			"EMP_NO" -- ����ڵ�
		);

-- ����������
ALTER TABLE "MAIL"
	ADD
		CONSTRAINT "FK_EMP_TO_MAIL" -- ��� -> ����������
		FOREIGN KEY (
			"SENDER" -- �������
		)
		REFERENCES "EMPLOYEE" ( -- ���
			"EMP_NO" -- ����ڵ�
		);

-- �޴�����
ALTER TABLE "GET_MAIL"
	ADD
		CONSTRAINT "FK_MAIL_TO_GET_MAIL" -- ���������� -> �޴�����
		FOREIGN KEY (
			"MAIL_NO" -- ���Ϲ�ȣ
		)
		REFERENCES "MAIL" ( -- ����������
			"MAIL_NO" -- ���Ϲ�ȣ
		);

-- �޴�����
ALTER TABLE "GET_MAIL"
	ADD
		CONSTRAINT "FK_EMPLOYEE_TO_GET_MAIL" -- ��� -> �޴�����
		FOREIGN KEY (
			"EMP_NO" -- �޴»��
		)
		REFERENCES "EMPLOYEE" ( -- ���
			"EMP_NO" -- ����ڵ�
		);