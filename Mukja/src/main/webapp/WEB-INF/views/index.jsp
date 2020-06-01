<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
     <!-- 부트스트랩 -->
    
    <link href="<c:url value="/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
  
    <!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- kokomap -->
	  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
	  
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be8b4c494b923442e4a549fa1dd7f645&libraries=services"></script>
	
    <title>여러개 마커 표시하기</title>
 <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padd	ing: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
    .wrapper{
	  display: grid;
	  grid-template-columns: 350px auto;
	 
	}
	
    .overlayDiv{    	
    	background-color: white;       	
    	margin-top: -150px
    }
   
   #selecter{
  	 height: 100px;
   }
</style>
 
</head>
<body>

 <div class="wrapper">
 	<!-- 왼쪽 매뉴 -->
    <div>		
	   <h2>골라먹을 음식점 찾기 </h2>
	    <!-- 
			<div class="form-inline">
			  	<input  class="form-control" type="text" name = "dong" placeholder=""> &nbsp;	
		  		<a class="btn btn-primary" >검색</a>
			</div>
			 -->
		<form id="frm">
			<div class="row">			 
			  <div class="col-md-12">
			    <div class="input-group">
			      <input id="dong" name ="dong"type="text" class="form-control" placeholder="원하는 시 ,동을 검색하세요.">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button" id ="searchButton">검색</button>
			      </span>
			    </div><!-- /input-group -->
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
	 	  </form>	
	 	 <form id="frm2">
		    <div class="col-md-12">
				<input id ="namsualat" name ="namsualat" type="hidden">
				<input id ="namsualng" name ="namsualng" type="hidden">
				<input id ="bukdonglat" name ="bukdonglat" type="hidden">
				<input id ="bukdonglng" name ="bukdonglng" type="hidden">
			  
			  	<div id="addr"></div>
	   			<div id="stores"></div>
   			  </div>
		</form>
   		 <div class="btn-group" role="group">
   		  <button type="button" class="btn btn-info" id ="getMarker">음식점 검색</button>
		  <button type="button" class="btn btn-default">채식주의</button>
		  <button type="button" class="btn btn-default">종교</button>
		  <button type="button" class="btn btn-default"></button>
		</div>
    </div>
   
    <!-- 왼쪽 매뉴 끝 -->
    <div>
	    <div id="searchWindow">1</div>
	   	<div id="selecter"> 1</div>
	   	<div id="map" style="width:100%;height:800px;"></div>
	</div>  
	</div>
    
    
    
    
  


<!------------ 같이먹자 모달 -------------------------------->
<div class="modal fade" id="storeModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">같이먹자 정보창</h4>
      </div>
      <div class="modal-body">
   		  <!-- ---------------------------------채팅방 다이브--------------------------- -->
		    <div class='row'><!-- 컨테이너 -->
		     <div class="col-sm-12"> 
		
			
				<form>
					<div class="form-group">
						<label for="nickname" class="col-sm-1">닉네임</label>
						<div class="col-sm-4">
							<input class="form-control " type="text" id="nickname">
						</div>
					</div>
					<input class="btn btn-info" type="button" id="enterBtn" value="입장">
					<input class="btn btn-danger" type="button" id="exitBtn" value="퇴장">


					<div class="form-group">
						<h4>대화내용</h4>
						<div id="chatArea">
							<div id="chatMessage"
								style="height: 300px; border: 1px gray solid; overflow: auto"></div>
						</div>
					</div>

					<div class="form-group">
						<label for="message" class="col-sm-1">메시지</label>
						<div class="col-sm-8">
							<input class="form-control" type="text" id="message" />
						</div>
					</div>
					<input class="btn btn-success" type="button" id="sendBtn"
						value="닫기">
				</form>

		
		

	</div>
    
    </div>
  <!-- ---------------------------------채팅방 다이브끝--------------------------- -->
   			
   
   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!------------ 같이먹자 모달 -------------------------------->





<script>
//웹소켓 객체 저장용
var wsocket;
//닉 네임 저장용
var nickname;
$(function() {
	//입장버튼 클릭시 ]-서버와 연결된 웹소켓 클라이언트 생성
	$('#enterBtn').one('click',function(){
		console.log("ws://localhost:8080<c:url value='/chat.do'/>");
		wsocket = new WebSocket("ws://localhost:8080<c:url value='/chat.do'/>");
		//서버와 연결된 소켓에 이벤트 등록
		wsocket.onopen = open;
		wsocket.onclose = function(){
			appendMessage("연결이 끊어졌어요");
		};
		//메세지를 받는 이벤트 리스너 설정 <리시브 메시지는 아래에 정의되어있음.
		//연결이 되면 부착한다 = 연결이 되면 서버로부터 오는 브로드 캐스팅을 받을 수 있다./
		wsocket.addEventListener('message',receiveMessage);
	});
	//퇴장버튼 클릭시]
	$('#exitBtn').one('click',function(){
		wsocket.send('msg:'+nickname+'가(이) 퇴장 했어요');
		wsocket.close();
		
	});
	//전송버튼 클릭시]
	$('#sendBtn').click(function(){
		sendMessage();
	});
	
	//메시지 입력후 전송 버튼 클릭이 아닌 엔터키 처리]
	$('#message').on('keypress',function(e){
		
		console.log("e.keyCode:%s,e.which:%s",e.keyCode,e.which);
		var keyValue = e.keyCode ? e.keyCode : e.which;
		if(keyValue == 13){//엔터 입력
			sendMessage();
		}
	});
	
	
	
});
//함수 정의]
//서버에 연결되었을때 호출되는 콜백함수
var open =function(){
	//서버로 연결한 사람의 정보(닉네임) 전송
	//msg:kim가(이) 입장했어요
	//사용자가 입력한 닉네임 저장
	nickname = $('#nickname').val();
	wsocket.send('msg:'+nickname+'가(이) 입장했어요');
	appendMessage('연결되었습니다');
};
//메시지를 DIV태그에 뿌려주기 위한 함수]
var appendMessage = function(msg){
	//메시지 출력
	$('#chatMessage').append(msg+"<br/>");
};

//서버에서 메시지를 받을때마다 호출되는 함수 
var receiveMessage = function(e){
	//서버로부터 받은 데이타는 이벤트객체(e).data속성에 저장되어 있다
	var receiveData=e.data;
	if(receiveData.substring(0,4) =='msg:')
		//서버로부터 받은 메시지를 msg:부분을 제외하고 
		//div에 출력
		appendMessage(receiveData.substring(4));
	
};
//서버로 메시지 전송하는 함수]
function sendMessage(){
	//서버로 메시지 전송
	wsocket.send('msg:'+nickname+':'+$('#message').val());//msg:Superman:안녕
	//DIV(대화영역)에 메시지 출력
	appendMessage($('#message').val());
	//기존 메시지 클리어
	$('#message').val('');
	//포커스 주기
	$('#message').focus();
}
</script>
<!-- 채팅방 스크립트 -->

<script>

var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    mapOption = { 
        center: new kakao.maps.LatLng(37.498825, 126.722265), // 지도의 중심좌표 37.498825, 126.722265 부평시장역
        level: 2 // 지도의 확대 레벨
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var bounds = map.getBounds();  


console.log("맵생성시 바운즈 초기화");
//인풋타입 히든에 위경도 바운더리 주는 함수
latLngSendInput(bounds);


function latLngSendInput(bounds){
	 //남서 위경도
	  namsua= bounds.getSouthWest();
	  
	  //북동 위경도
	  bukdong = bounds.getNorthEast();
	  
	  //lat 최소
	  $("#namsualat").val(namsua.getLat());
	  //lng 최소
	  $("#namsualng").val(namsua.getLng());
	  //lat 최대
	  $("#bukdonglat").val(bukdong.getLat());
	  //lng 최대
	  $("#bukdonglng").val(bukdong.getLng());
	 
	  
	
	 var latlng = map.getCenter(); 
	
}
var namsua;
var bukdong;
var bnksua;
var namdong;
kakao.maps.event.addListener(map, 'dragend', function() {
	  var bounds = map.getBounds();    
	  console.log("드래그 진입:");
	  
	  //인풋타입 히든에 위경도 바운더리 주는 함수
	  latLngSendInput(bounds);
	 
});


//중앙점 잡아서 이동하는 메소드
function setCenter() {            
    var moveLatLon = new kakao.maps.LatLng(lat, lng);    
    // 지도 중심을 이동 시킵니다
    map.setCenter(moveLatLon);
}






function panTo(lat,lan) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(lat, lng);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);   
    var bounds = map.getBounds();   
    var namsua = bounds.getSouthWest();
    var bukdong = bounds.getNorthEast();
  
}        



</script>



	 <script>
  var lat,lng;
  
  function fnToaddr(index,fnlat,fnlng){	
	  console.log("lat"+fnlat);
	  console.log("lng"+fnlng);
	  console.log("index"+index);
	  lat = fnlat;
	  lng = fnlng;
  }  
  
  $(function(){
	  $('.wrapper').hide();
	  $('.wrapper').fadeIn();
		//마커들이 들어가는 배열
		var markers = new Array();
	  	
	  	//레이아웃들이 들어가는 배열
	 	var coustomLayouts = new Array();
	
	  
	  $("#searchButton").click(function(){
		  var dong=document.getElementById('dong').value;
		  if(!dong){
			 alert('동 검색어를 입력해주세요');
			 return;
		  }
		  console.log("빈문자 리턴확인용");
		  
		  $('#addr').empty();   
		  $.ajax({
				url:"<c:url value='/Search/Place.do'/>",
				data:$('#frm').serialize(),
				dataType:'json',
				success: function (data){
					console.log(data[0] );
					var list_html="";
					 for(var i in data){
						//json배열에서 각 방의  데이터를 시 군구 동으로 파싱하여 다이브에 삽입
						   	list_html+=data[i].sido+" "+data[i].si_goon_go+" "+data[i].dong;
						   	//삽입
						   $('#searchWindow').append("<div id='div"+i+"' style='background-color: gray;' onclick='fnToaddr("+i+","+data[i].lat+","+data[i].lng+");panTo("+data[i].lat+","+data[i].lng+")'>"+list_html+"</div>");	
						   list_html='';
					   }
			},
				error:function(request,status,error){
					console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
							request.status,request.responseText,error,status);
				}
				
			}); 
	      
	  });
	  
	  
		  

		  
	  
	  
	  $("#getMarker").click(function(){
		  $.ajax({
				url:"<c:url value='/getMarker.pbs'/>",
				data:$('#frm2').serialize(),
				dataType:'json',
				success: function (data){
					
					 console.log("겟마켓 안의 겟바운즈");
					 console.log(bounds);
					 
					function closeOverlay(){
						console.log("레이아웃 닫기이벤트메스도 click");
						console.log(coustomLayouts);
						  for (var i = 0; i < coustomLayouts.length; i++) {
					    	coustomLayouts[i].setMap(null)
						  }
						  coustomLayouts=new Array();
					}
					
					
					kakao.maps.event.addListener(map, 'dragstart', function() {
						 closeOverlay();
					});
					
					
					
					

					
					//마커상태를 세팅하는 함수	
				  function setMarkers(markers) {
					  for (var i = 0; i < markers.length; i++) {
					        markers[i].setMap(null);
					    }            
					
					}//setMarkers
					
					//coustomLayouts를 세팅하는 함수	선언
					  function setcustomOverlays(coustomLayout,data) {
						console.log("setcustomOverlays의 내부의 data");
						console.log(data);
						console.log("coustomLayout");
						console.log(coustomLayout);								
						
						
							          
						
						}//setcustomOverlays
					
					//음식점 마커 요청시 기존에 마커가 있을경우 전부 삭제
				
					setMarkers(markers);
					markers=new Array();
					console.log('markers.length');
					console.log(markers.length);
					var list_html="";
				
					
					// 마커를 생성하고 지도위에 표시하는 함수입니다
					function addMarker(position) {
					    
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        position: position
					    });
					
					    // 마커가 지도 위에 표시되도록 설정합니다
					    marker.setMap(map);
					    markers.push(marker);
					    console.log(marker.getPosition());
					    
					    
						
					
					}//addMarker
					
					function addOverlay(data,marker){
						
						//클릭이벤트 리스너 :마커가 생성되면 마커에 클릭 이벤트 생성
						//배열에 추가된 마커에 이벤트 리스너 부착하기
						console.log("marker의 포지션");
						console.log(marker.getPosition());
						
						kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
							// 커스텀 오버레이에 표시할 컨텐츠 입니다
							// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
							// 별도의 이벤트 메소드를 제공하지 않습니다 
							//오버레이아웃 컨텐츠
						    closeOverlay();
							 var content = '<div class="overlayDiv">' +
								'    <div><a href="<c:url value="Store/StoreDetail.do"/>">'+data.store_name+'</a></div>' +
								'    <div>' +
								'        <div>'+data.store_intro+'</div>' +
								'        <div>'+data.store_phonenumber+'</div>' +
								'        <div>'+data.store_time+'</div>' +
								'        <a id="closeOver" class="btn btn-info">닫기</a>'+
								'        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#storeModal" data-whatever="@mdo">같이먹자</button>'+
								'    </div>';
								
				
							//마커 클릭시
						    // 마커가 추가될 시점에
							//커스텀 오버레이를 생성한다.
							
							// 커스텀 오버레이가 표시될 랫랭 정보받기
							var overlayPosition = new kakao.maps.LatLng(data.store_lat, data.store_lng);  
							console.log(overlayPosition.toString());
							
							// 표시 위치 정보로 커스텀 오버레이를 생성합니다
							var customOverlay = new kakao.maps.CustomOverlay({
							    position: overlayPosition,
							    content: content,
							   
							});
							
							// 커스텀 오버레이를 지도에 표시합니다
					    	customOverlay.setMap(map);		
						    
							//오버레이 디버깅
							/* 
							console.log(customOverlay);
							console.log(customOverlay.getPosition());
							console.log(coustomLayouts); */
							
							//오버레이들을 배열에 넣어줌
							coustomLayouts.push(customOverlay);
							 $("#closeOver").click(function(){
								  console.log("closeOver 메소드 내부");
									closeOverlay();
								});	
						    
						});//addListener
						
					}//addOverlay
					
					
					 for(var i in data){
						 /*   	list_html+=data[i].store_name+" "+data[i].store_intro+" "+data[i].store_lng;
						console.log(list_html) ;  */
							//마커 포지션 객체에 포지션 입력
							console.log(data[i] );
						
							//마커를 생성하교 맵에 표시하며 동시에 마커배열에 해당마커를 추가함
							addMarker(new kakao.maps.LatLng(data[i].store_lat, data[i].store_lng));
							  
							addOverlay(data[i],markers[i]);
						
						
					
						
						
					   }//for
			},
				error:function(request,status,error){
					console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
							request.status,request.responseText,error,status);
				}
				
			});
		 
			
	  });
	  
	  
	 
  });
	
  </script>
</body>
</html>