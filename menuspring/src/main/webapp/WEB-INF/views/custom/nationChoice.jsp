<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

function choice(eng,korea){
	
	opener.nationChoice(eng,korea);
	
	window.close();
}

</script>

<script>
$(document).ready(function(){

	$('tr').on('click',function(){
		
		choice( $(this).children('td:eq(0)').html() , $(this).children('td:eq(1)').html() );
	});
});
	
	
</script>

<title>육식</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<thead>
					<tr>
						<th>영문명</th>
						<th>한글명</th>
					</tr>
				</thead>
				<tbody>
				
<%

Map<String, String> map = new HashMap<String, String>();
map.put("GH","가나");
map.put("GA","가봉");
map.put("GY","가이아나");
map.put("GM","감비아");
map.put("GP","프랑스(과데루프섬)");
map.put("GT","과테말라");
map.put("GU","미국(괌)");
map.put("GD","그레나다");
map.put("GE","그루지야");
map.put("GR","그리스");
map.put("GL","덴마크(그린란드)");
map.put("GW","기니비소");
map.put("GN","기니");
map.put("NA","나미비아");
map.put("NG","나이지리아");
map.put("ZA","남아프리카공화국");
map.put("NL","네덜란드(네델란드)");
map.put("AN","네덜란드(네덜란드령앤틸리");
map.put("NP","네팔");
map.put("NO","노르웨이");
map.put("NF","오스트레일리아(노퍽섬)");
map.put("NZ","뉴질랜드");
map.put("NC","프랑스(뉴칼레도니아섬)");
map.put("NE","니제르");
map.put("NI","니카라과");
map.put("TW","타이완(대만)");
map.put("DK","덴마크");
map.put("DM","도미니카연방");
map.put("DO","도미니카공화국");
map.put("DE","독일");
map.put("LA","라오스");
map.put("LV","라트비아");
map.put("RU","러시아");
map.put("LB","레바논");
map.put("LS","레소토");
map.put("RO","루마니아");
map.put("RW","르완다");
map.put("LU","룩셈부르크");
map.put("LR","라이베리아");
map.put("LY","리비아");
map.put("RE","프랑스(레위니옹섬)");
map.put("LT","리투아니아");
map.put("LI","리첸쉬테인");
map.put("MG","마다가스카르");
map.put("MH","미국(마아샬제도)");
map.put("FM","미크로네시아(마이크로네시");
map.put("MK","마케도니아");
map.put("MW","말라위");
map.put("MY","말레이지아");
map.put("ML","말리");
map.put("MT","몰타");
map.put("MQ","프랑스(마르티니크섬)");
map.put("MX","멕시코");
map.put("MC","모나코");
map.put("MA","모로코");
map.put("MU","모리셔스");
map.put("MR","모리타니");
map.put("MZ","모잠비크");
map.put("MS","영국(몽세라)");
map.put("MD","몰도바");
map.put("MV","몰디브");
map.put("MN","몽고");
map.put("US","미국");
map.put("VI","미국(버진제도)");
map.put("AS","미국(사모아제도)");
map.put("MM","미얀마");
map.put("VU","바누아투");
map.put("BH","바레인");
map.put("BB","바베이도스");
map.put("BS","바하마");
map.put("BD","방글라데시");
map.put("BY","벨라루스");
map.put("BM","영국(버뮤다섬)");
map.put("VE","베네수엘라");
map.put("BJ","베넹");
map.put("VN","베트남");
map.put("BE","벨기에");
map.put("BZ","벨리세");
map.put("BA","보스니아헤르체코비나");
map.put("BW","보츠와나");
map.put("BO","볼리비아");
map.put("BF","부르키나파소");
map.put("BT","부탄");
map.put("MP","미국(사이판)");
map.put("BG","불가리아");
map.put("BR","브라질");
map.put("BN","브루네이(나이)");
map.put("BI","브룬디");
map.put("WS","미국(사모아,구서사모아)");
map.put("SA","사우디아라비아");
map.put("CY","사이프러스");
map.put("SM","산마리노");
map.put("SN","세네갈");
map.put("SC","세이셸");
map.put("LC","세인트루시아");
map.put("VC","세인트빈센트그레나딘");
map.put("KN","세인트키츠네비스");
map.put("SB","솔로몬아일란드");
map.put("SR","수리남");
map.put("LK","스리랑카");
map.put("SZ","스와질랜드");
map.put("SE","스웨덴");
map.put("CH","스위스");
map.put("ES","스페인(에스파니아)");
map.put("SK","슬로바키아");
map.put("SI","슬로베니아");
map.put("SL","시에라리온");
map.put("SG","싱가포르");
map.put("AE","아랍에미레이트연합국");
map.put("AW","네덜란드(아루바섬)");
map.put("AM","아르메니아");
map.put("AR","아르헨티나");
map.put("IS","아이슬란드");
map.put("HT","아이티");
map.put("IE","아일란드(에이레)");
map.put("AZ","아제르바이잔");
map.put("AF","아프가니스탄");
map.put("AI","영국(안귈라섬)");
map.put("AD","안도라");
map.put("AG","앤티과바부다");
map.put("AL","알바니아");
map.put("DZ","알제리");
map.put("AO","앙골라");
map.put("ER","에리트리아");
map.put("EE","에스토니아");
map.put("EC","에콰도르");
map.put("SV","엘살바도르");
map.put("GB","영국");
map.put("VG","영국(버진제도)");
map.put("YE","예멘");
map.put("OM","오만");
map.put("AU","오스트레일리아(호주)");
map.put("AT","오스트리아");
map.put("HN","온두라스");
map.put("JO","요르단");
map.put("UG","우간다");
map.put("UY","우루과이");
map.put("UZ","우즈베크");
map.put("UA","우크라이나");
map.put("ET","이디오피아");
map.put("IQ","이라크");
map.put("IR","이란");
map.put("IL","이스라엘");
map.put("EG","이집트");
map.put("IT","이탈리아(이태리)");
map.put("IN","인도");
map.put("ID","인도네시아");
map.put("JP","일본");
map.put("JM","자메이카");
map.put("ZM","잠비아");
map.put("CN","중국");
map.put("MO","중국(마카오)");
map.put("HK","중국(홍콩)");
map.put("CF","중앙아프리카");
map.put("DJ","지부티");
map.put("GI","영국(지브롤터)");
map.put("ZW","짐바브웨");
map.put("TD","차드");
map.put("CZ","체코");
map.put("CS","체코슬로바키아");
map.put("CL","칠레");
map.put("CA","카나다");
map.put("CM","카메룬");
map.put("CV","카보베르데");
map.put("KY","영국(케이만제도)");
map.put("KZ","카자흐");
map.put("QA","카타르");
map.put("KH","캄보디아");
map.put("KE","케냐");
map.put("KR","한국");
map.put("CR","코스타리카");
map.put("CI","코트디봐르");
map.put("CO","콜롬비아");
map.put("CG","콩고");
map.put("CU","쿠바");
map.put("KW","쿠웨이트");
map.put("HR","크로아티아");
map.put("KG","키르키즈스탄");
map.put("KI","키리바티");
map.put("TJ","타지키스탄");
map.put("TZ","탄자니아");
map.put("TH","타이(태국)");
map.put("TC","영국(터크스케이코스제도)");
map.put("TR","터키");
map.put("TG","토고");
map.put("TO","통가");
map.put("TV","투발루");
map.put("TN","튀니지");
map.put("TT","트리니다드토바고");
map.put("PA","파나마");
map.put("PY","파라과이");
map.put("PK","파키스탄");
map.put("PG","파푸아뉴기니");
map.put("PW","미국(팔라우섬)");
map.put("FO","덴마크(페로즈제도)");
map.put("PE","페루");
map.put("PT","포르투갈");
map.put("PL","폴란드");
map.put("PR","미국(푸에르토리코섬)");
map.put("FR","프랑스");
map.put("GF","프랑스(기아나)");
map.put("PF","프랑스(폴리네시아)");
map.put("FJ","피지");
map.put("FI","필란드");
map.put("PH","필리핀");
map.put("HU","헝가리");

Iterator<String> keys = map.keySet().iterator();
while(keys.hasNext()){
		String key = keys.next();
%>
					<tr style="cursor: pointer" >
						<td><%= key %></td>
						<td><%= map.get(key) %></td>
					</tr>
				</tbody>
<% 
	} 
%>
			
			
			</table>
		 </div>
	</div>
</body>
</html>