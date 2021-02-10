CREATE TABLE notice(
	noticeNumber int(11) primary key,
	noticeTitle varchar(50),
	noticeContent varchar(2048),
	noticeDate datetime,
	noticeId varchar(20),
	noticeAvailable int(3)
);

CREATE TABLE user (
	id varchar(50) primary key,
	password varchar(50),
	name varchar(20),
	memberdate varchar(20),
	gender varchar(5),
	email varchar(50)
);


CREATE TABLE menu (
	menuNumber int(11) primary key auto_increment,
	menuTitle varchar(50),
	menuContent varchar(2048),
	menuDate datetime default NOW(),
	id varchar(50),
	menuImageNumber int(11),
	menuAvailable int(3),
	readCnt int(11),
	sumAppraisal int(3)
);

CREATE TABLE menuImage (
	menuImageNumber int(11) primary key auto_increment,		-- 파일 번호
	menuNumber int(11) not null,							-- 메뉴 번호
	orgFileName varchar(260) not null,						-- 원본 파일 이름
	storedFileName varchar(36) not null,					-- 변경된 파일 이름
	fileSize varchar(20),									-- 파일 크기
	regdate datetime default NOW(),							-- 파일 등록일
	delGB varchar(1) default 'N' not null					-- 삭제구분
);

CREATE TABLE menuAppraisal (
	menuNumber int(11),
	id varchar(50),
	menuAppraisal int(3)
);


CREATE TABLE CUSTOM (
	BUSI_NUM CHAR(20),          	-- 사업자번호	
	CUSTOM CHAR(20),          		-- 거래처명
	SHORT CHAR(20),          		-- 약칭	
	CEO CHAR(10),          			-- 대표자
	CHARGE_PERSON CHAR(10),         -- 담당자
	BUSI_CONDITION CHAR(10),        -- 업태
	ITEM CHAR(10),          		-- 종목
	POST_NUM CHAR(10),          	-- 우편번호
	ADDR1 VARCHAR(80),          	-- 주소1
	ADDR2 VARCHAR(80),          	-- 주소2
	TEL CHAR(10),          			-- 전화번호
	FAX CHAR(10),          			-- 팩스번호
	HOMEPAGE CHAR(20),          	-- 홈페이지
	CO_YN BIT,          			-- 법인여부  0 법인 1 개인
	FOREIGN_YN BIT,          		-- 해외여부  0 국내 1  해외
	TAX_YN BIT,          			-- 과세구분  0 과세 1 비과세
	COUNTRY_ENG CHAR(20),           -- 국가_영문
	COUNTRY_KOR CHAR(20),           -- 국가_한글
	SPECIAL_RELATION BIT,           -- 특수관계자  yes 1  no 0
	TRADE_STOP BIT,          		-- 거래중지    yes 1 no 0
	CONTRACT_PERIOD_S DATE,         -- 계약기간(시작)
	CONTRACT_PERIOD_E DATE,         -- 계약기간(끝)
	REGI_INFO_MAN CHAR(10),         -- 등록정보(등록인)
	REGI_INFO_DATE DATETIME,          	-- 등록정보(등록날짜)
	MODI_INFO_MAN CHAR(10),         -- 변경정보(변경인)
	MODI_INFO_DATE DATETIME,         	-- 변경정보(변경날짜)
	PRIMARY KEY(BUSI_NUM,CUSTOM)
);

INSERT INTO CUSTOM VALUES( '111-11-11111' , '동아제약' , '동아' , '동아사장' , '동아부장' ,
'A' , '타이레놀' , '357-12' , '서울 ...' , 'xx빌딩 1401호 ',
'025677891','025677412','ehddk123@ehkt.com',1,1,
1,'KOR','대한민국',0,1,'2021-01-14 10:41:11',
'2021-01-14 10:41:11','동아사장','2021-01-14 10:41:11','동아부장','2021-01-14 10:41:11' );
INSERT INTO CUSTOM VALUES( '123-22-2345' , 'asdf동아제약' , 'asdf동아' , '동아사장' , '동아부장' ,
'A' , '타이레놀' , '357-12' , '서울 ...' , 'xx빌딩 1401호 ',
'025677891','025677412','ehddk123@ehkt.com',1,1,
1,'KOR','대한민국',1,1,'2021-01-15 10:41:11',
'2021-01-15 10:41:11','동아사장','2021-01-15 10:41:11','동아부장','2021-01-15 10:41:11' );
INSERT INTO CUSTOM VALUES( '111-12-23451' , '흥국제약' , '흥국' , 'ㅎㄱ사장' ,
'ㅎㄱ부장' , 'A' , '게보린' , '357-55' , '서울 ㅁㅁ...' ,
'흥국빌딩 1401호 ','026786631','021112222','흥국123@ehdd.com',0,
0,0,'KOR','대한민국',1,0,
'2021-01-16 10:41:11','2021-01-16 10:41:11','ㅎㄱ사장','2021-01-16 10:41:11','ㅎㄱ부장','2021-01-16 10:41:11' );

INSERT INTO CUSTOM VALUES( '12345' , '맛동산' , '흥국' , 'ㅎㄱ사장' ,
'ㅎㄱ부장' , 'A' , '게보린' , '357-55' , '서울 ㅁㅁ...' ,
'흥국빌딩 1401호 ','026786631','021112222','흥국123@ehdd.com',0,
0,0,'KOR','대한민국',1,0,
'2021-01-16 10:41:11','2021-01-16 10:41:11','ㅎㄱ사장','2021-01-16 10:41:11','ㅎㄱ부장','2021-01-16 10:41:11' );

	CREATE TABLE ACCOUNT(
		BUSI_NUM CHAR(20) PRIMARY KEY,  -- 사업자번호
		FACTORY CHAR(20),          		-- 사무소
		TRADE_BANK CHAR(20),          	-- 거래은행
		ACCOUNT_NUM CHAR(20)			-- 계좌번호
	);

INSERT INTO ACCOUNT VALUES( '111-11-11111','강서구어딘가','신한은행' ,'22-334-5345345');
INSERT INTO ACCOUNT VALUES( '123-22-2345','서구어딘가','국민은행' ,'11-222-33333');
INSERT INTO ACCOUNT VALUES( '111-12-23451','남서구어딘가','흥국은행' ,'5555-55-5555');
INSERT INTO ACCOUNT VALUES( '111-12-23452','남서구어asdf','asd은행' ,'5555-55-5555');





CREATE TABLE NATION (
	ENG_NAME CHAR(20),
	KOREA_NAME CHAR(30)
);

INSERT INTO NATION VALUES('GH','가나');
INSERT INTO NATION VALUES('GA','가봉');
INSERT INTO NATION VALUES('GY','가이아나');
INSERT INTO NATION VALUES('GM','감비아');
INSERT INTO NATION VALUES('GP','프랑스(과데루프섬)');
INSERT INTO NATION VALUES('GT','과테말라');
INSERT INTO NATION VALUES('GU','미국(괌)');
INSERT INTO NATION VALUES('GD','그레나다');
INSERT INTO NATION VALUES('GE','그루지야');
INSERT INTO NATION VALUES('GR','그리스');
INSERT INTO NATION VALUES('GL','덴마크(그린란드)');
INSERT INTO NATION VALUES('GW','기니비소');
INSERT INTO NATION VALUES('GN','기니');
INSERT INTO NATION VALUES('NA','나미비아');
INSERT INTO NATION VALUES('NG','나이지리아');
INSERT INTO NATION VALUES('ZA','남아프리카공화국');
INSERT INTO NATION VALUES('NL','네덜란드(네델란드)');
INSERT INTO NATION VALUES('AN','네덜란드(네덜란드령앤틸리');
INSERT INTO NATION VALUES('NP','네팔');
INSERT INTO NATION VALUES('NO','노르웨이');
INSERT INTO NATION VALUES('NF','오스트레일리아(노퍽섬)');
INSERT INTO NATION VALUES('NZ','뉴질랜드');
INSERT INTO NATION VALUES('NC','프랑스(뉴칼레도니아섬)');
INSERT INTO NATION VALUES('NE','니제르');
INSERT INTO NATION VALUES('NI','니카라과');
INSERT INTO NATION VALUES('TW','타이완(대만)');
INSERT INTO NATION VALUES('DK','덴마크');
INSERT INTO NATION VALUES('DM','도미니카연방');
INSERT INTO NATION VALUES('DO','도미니카공화국');
INSERT INTO NATION VALUES('DE','독일');
INSERT INTO NATION VALUES('LA','라오스');
INSERT INTO NATION VALUES('LV','라트비아');
INSERT INTO NATION VALUES('RU','러시아');
INSERT INTO NATION VALUES('LB','레바논');
INSERT INTO NATION VALUES('LS','레소토');
INSERT INTO NATION VALUES('RO','루마니아');
INSERT INTO NATION VALUES('RW','르완다');
INSERT INTO NATION VALUES('LU','룩셈부르크');
INSERT INTO NATION VALUES('LR','라이베리아');
INSERT INTO NATION VALUES('LY','리비아');
INSERT INTO NATION VALUES('RE','프랑스(레위니옹섬)');
INSERT INTO NATION VALUES('LT','리투아니아');
INSERT INTO NATION VALUES('LI','리첸쉬테인');
INSERT INTO NATION VALUES('MG','마다가스카르');
INSERT INTO NATION VALUES('MH','미국(마아샬제도)');
INSERT INTO NATION VALUES('FM','미크로네시아(마이크로네시');
INSERT INTO NATION VALUES('MK','마케도니아');
INSERT INTO NATION VALUES('MW','말라위');
INSERT INTO NATION VALUES('MY','말레이지아');
INSERT INTO NATION VALUES('ML','말리');
INSERT INTO NATION VALUES('MT','몰타');
INSERT INTO NATION VALUES('MQ','프랑스(마르티니크섬)');
INSERT INTO NATION VALUES('MX','멕시코');
INSERT INTO NATION VALUES('MC','모나코');
INSERT INTO NATION VALUES('MA','모로코');
INSERT INTO NATION VALUES('MU','모리셔스');
INSERT INTO NATION VALUES('MR','모리타니');
INSERT INTO NATION VALUES('MZ','모잠비크');
INSERT INTO NATION VALUES('MS','영국(몽세라)');
INSERT INTO NATION VALUES('MD','몰도바');
INSERT INTO NATION VALUES('MV','몰디브');
INSERT INTO NATION VALUES('MN','몽고');
INSERT INTO NATION VALUES('US','미국');
INSERT INTO NATION VALUES('VI','미국(버진제도)');
INSERT INTO NATION VALUES('AS','미국(사모아제도)');
INSERT INTO NATION VALUES('MM','미얀마');
INSERT INTO NATION VALUES('VU','바누아투');
INSERT INTO NATION VALUES('BH','바레인');
INSERT INTO NATION VALUES('BB','바베이도스');
INSERT INTO NATION VALUES('BS','바하마');
INSERT INTO NATION VALUES('BD','방글라데시');
INSERT INTO NATION VALUES('BY','벨라루스');
INSERT INTO NATION VALUES('BM','영국(버뮤다섬)');
INSERT INTO NATION VALUES('VE','베네수엘라');
INSERT INTO NATION VALUES('BJ','베넹');
INSERT INTO NATION VALUES('VN','베트남');
INSERT INTO NATION VALUES('BE','벨기에');
INSERT INTO NATION VALUES('BZ','벨리세');
INSERT INTO NATION VALUES('BA','보스니아헤르체코비나');
INSERT INTO NATION VALUES('BW','보츠와나');
INSERT INTO NATION VALUES('BO','볼리비아');
INSERT INTO NATION VALUES('BF','부르키나파소');
INSERT INTO NATION VALUES('BT','부탄');
INSERT INTO NATION VALUES('MP','미국(사이판)');
INSERT INTO NATION VALUES('BG','불가리아');
INSERT INTO NATION VALUES('BR','브라질');
INSERT INTO NATION VALUES('BN','브루네이(나이)');
INSERT INTO NATION VALUES('BI','브룬디');
INSERT INTO NATION VALUES('WS','미국(사모아,구서사모아)');
INSERT INTO NATION VALUES('SA','사우디아라비아');
INSERT INTO NATION VALUES('CY','사이프러스');
INSERT INTO NATION VALUES('SM','산마리노');
INSERT INTO NATION VALUES('SN','세네갈');
INSERT INTO NATION VALUES('SC','세이셸');
INSERT INTO NATION VALUES('LC','세인트루시아');
INSERT INTO NATION VALUES('VC','세인트빈센트그레나딘');
INSERT INTO NATION VALUES('KN','세인트키츠네비스');
INSERT INTO NATION VALUES('SB','솔로몬아일란드');
INSERT INTO NATION VALUES('SR','수리남');
INSERT INTO NATION VALUES('LK','스리랑카');
INSERT INTO NATION VALUES('SZ','스와질랜드');
INSERT INTO NATION VALUES('SE','스웨덴');
INSERT INTO NATION VALUES('CH','스위스');
INSERT INTO NATION VALUES('ES','스페인(에스파니아)');
INSERT INTO NATION VALUES('SK','슬로바키아');
INSERT INTO NATION VALUES('SI','슬로베니아');
INSERT INTO NATION VALUES('SL','시에라리온');
INSERT INTO NATION VALUES('SG','싱가포르');
INSERT INTO NATION VALUES('AE','아랍에미레이트연합국');
INSERT INTO NATION VALUES('AW','네덜란드(아루바섬)');
INSERT INTO NATION VALUES('AM','아르메니아');
INSERT INTO NATION VALUES('AR','아르헨티나');
INSERT INTO NATION VALUES('IS','아이슬란드');
INSERT INTO NATION VALUES('HT','아이티');
INSERT INTO NATION VALUES('IE','아일란드(에이레)');
INSERT INTO NATION VALUES('AZ','아제르바이잔');
INSERT INTO NATION VALUES('AF','아프가니스탄');
INSERT INTO NATION VALUES('AI','영국(안귈라섬)');
INSERT INTO NATION VALUES('AD','안도라');
INSERT INTO NATION VALUES('AG','앤티과바부다');
INSERT INTO NATION VALUES('AL','알바니아');
INSERT INTO NATION VALUES('DZ','알제리');
INSERT INTO NATION VALUES('AO','앙골라');
INSERT INTO NATION VALUES('ER','에리트리아');
INSERT INTO NATION VALUES('EE','에스토니아');
INSERT INTO NATION VALUES('EC','에콰도르');
INSERT INTO NATION VALUES('SV','엘살바도르');
INSERT INTO NATION VALUES('GB','영국');
INSERT INTO NATION VALUES('VG','영국(버진제도)');
INSERT INTO NATION VALUES('YE','예멘');
INSERT INTO NATION VALUES('OM','오만');
INSERT INTO NATION VALUES('AU','오스트레일리아(호주)');
INSERT INTO NATION VALUES('AT','오스트리아');
INSERT INTO NATION VALUES('HN','온두라스');
INSERT INTO NATION VALUES('JO','요르단');
INSERT INTO NATION VALUES('UG','우간다');
INSERT INTO NATION VALUES('UY','우루과이');
INSERT INTO NATION VALUES('UZ','우즈베크');
INSERT INTO NATION VALUES('UA','우크라이나');
INSERT INTO NATION VALUES('ET','이디오피아');
INSERT INTO NATION VALUES('IQ','이라크');
INSERT INTO NATION VALUES('IR','이란');
INSERT INTO NATION VALUES('IL','이스라엘');
INSERT INTO NATION VALUES('EG','이집트');
INSERT INTO NATION VALUES('IT','이탈리아(이태리)');
INSERT INTO NATION VALUES('IN','인도');
INSERT INTO NATION VALUES('ID','인도네시아');
INSERT INTO NATION VALUES('JP','일본');
INSERT INTO NATION VALUES('JM','자메이카');
INSERT INTO NATION VALUES('ZM','잠비아');
INSERT INTO NATION VALUES('CN','중국');
INSERT INTO NATION VALUES('MO','중국(마카오)');
INSERT INTO NATION VALUES('HK','중국(홍콩)');
INSERT INTO NATION VALUES('CF','중앙아프리카');
INSERT INTO NATION VALUES('DJ','지부티');
INSERT INTO NATION VALUES('GI','영국(지브롤터)');
INSERT INTO NATION VALUES('ZW','짐바브웨');
INSERT INTO NATION VALUES('TD','차드');
INSERT INTO NATION VALUES('CZ','체코');
INSERT INTO NATION VALUES('CS','체코슬로바키아');
INSERT INTO NATION VALUES('CL','칠레');
INSERT INTO NATION VALUES('CA','카나다');
INSERT INTO NATION VALUES('CM','카메룬');
INSERT INTO NATION VALUES('CV','카보베르데');
INSERT INTO NATION VALUES('KY','영국(케이만제도)');
INSERT INTO NATION VALUES('KZ','카자흐');
INSERT INTO NATION VALUES('QA','카타르');
INSERT INTO NATION VALUES('KH','캄보디아');
INSERT INTO NATION VALUES('KE','케냐');
INSERT INTO NATION VALUES('KR','한국');
INSERT INTO NATION VALUES('CR','코스타리카');
INSERT INTO NATION VALUES('CI','코트디봐르');
INSERT INTO NATION VALUES('CO','콜롬비아');
INSERT INTO NATION VALUES('CG','콩고');
INSERT INTO NATION VALUES('CU','쿠바');
INSERT INTO NATION VALUES('KW','쿠웨이트');
INSERT INTO NATION VALUES('HR','크로아티아');
INSERT INTO NATION VALUES('KG','키르키즈스탄');
INSERT INTO NATION VALUES('KI','키리바티');
INSERT INTO NATION VALUES('TJ','타지키스탄');
INSERT INTO NATION VALUES('TZ','탄자니아');
INSERT INTO NATION VALUES('TH','타이(태국)');
INSERT INTO NATION VALUES('TC','영국(터크스케이코스제도)');
INSERT INTO NATION VALUES('TR','터키');
INSERT INTO NATION VALUES('TG','토고');
INSERT INTO NATION VALUES('TO','통가');
INSERT INTO NATION VALUES('TV','투발루');
INSERT INTO NATION VALUES('TN','튀니지');
INSERT INTO NATION VALUES('TT','트리니다드토바고');
INSERT INTO NATION VALUES('PA','파나마');
INSERT INTO NATION VALUES('PY','파라과이');
INSERT INTO NATION VALUES('PK','파키스탄');
INSERT INTO NATION VALUES('PG','파푸아뉴기니');
INSERT INTO NATION VALUES('PW','미국(팔라우섬)');
INSERT INTO NATION VALUES('FO','덴마크(페로즈제도)');
INSERT INTO NATION VALUES('PE','페루');
INSERT INTO NATION VALUES('PT','포르투갈');
INSERT INTO NATION VALUES('PL','폴란드');
INSERT INTO NATION VALUES('PR','미국(푸에르토리코섬)');
INSERT INTO NATION VALUES('FR','프랑스');
INSERT INTO NATION VALUES('GF','프랑스(기아나)');
INSERT INTO NATION VALUES('PF','프랑스(폴리네시아)');
INSERT INTO NATION VALUES('FJ','피지');
INSERT INTO NATION VALUES('FI','필란드');
INSERT INTO NATION VALUES('PH','필리핀');
INSERT INTO NATION VALUES('HU','헝가리');















