
//운동꿀팁 게시글 등록
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '집에서 부담없이 하는 10분 하체운동!', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/6qDagGUbERM" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>남자는 하체가 생명이죠!</p><p>집에서 할 수 있는 10분 하체운동을 소개드립니다.</p><p><span style="background-color: rgb(255, 255, 0);"><u>[운동방법]</u></span></p>
	   <p>1. 스쿼드 - 1세트 20개</p><p>2. 한다리 런지- 1세트 10개</p><p>3. 사이드 스쿼트 - 1세트 5개</p><p>4. 점프 스쿼트 - 1세트 15개</p><p><br></p><p>총 4가지 운동방법으로 하루 4세트 운동을 꾸준히 하시기 바랍니다.</p><p>WhatTheHealth와 함께 말벅지를 만들어 볼까요 ?!    </p>', 
	   'admin', sysdate, null, 1, seq_ex_info_ex_info_no.nextval, 203, '0', '2', '1:07', 0, null, null, null, null, 'https://i.ytimg.com/vi/6qDagGUbERM/mqdefault.jpg');

INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '하루 4분 복부 부위별 자극운동 !', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/CTmyurd-Ke4" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p><b>복부를 마구마구 괴롭히는 운동방법 !</b></p><p><br></p><p><u>첫번째 - 트위스트 사이클 (0:37)</u></p>
	   <p>무릎은 좌우로 옮기며 자전거 타듯 운동하세요. 20초 진행</p><p></p><p><u>두번째 - 윈드밀 크런치(1:03)</u></p><p>무릎 모았다가 V자로 펴주세요</p><p>*거북목, 목디스크있으신 분들은 하지마세요!</p><p><br></p><p><u>세번째 - 러시안 트위스트(1:49초)</u></p><p><u><br></u></p><p>3가지 운동을 하루 3세트 꾸준히 반복하시기 바랍니다. !</p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 112, '0', '1', '3:51', 0, null, null, null, null, 'https://i.ytimg.com/vi/CTmyurd-Ke4/mqdefault.jpg');

INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '올바른 턱걸이 자세', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/IveEGQnvOKk" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>안녕하세요. WhatTheHealth입니다.!</p><p>날씨가 많이 풀려 야외에서 운동하시는 분들이 점점 많아지고 있는데요.</p><p>우리 WTH 남성 회원분들 턱걸이 운동하시는 분들을 위해 올바른 턱걸이 영상 올립니다.</p>
      <p><br></p><p><span style="font-weight: bold; background-color: rgb(231, 99, 99);">턱걸이 운동 시, 주의사항!</span></p><p>1. 올라가기 전 자세와 내려간 자세가 동일해야합니다. (수직하강)</p><p>* 힘들어도 자세를 유지해주세요.</p><p>2. 넓히는 목적으로 턱걸이 할 경우, 몸통선상에 걸칠 정도로만 해주세요!</p><p><br></p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 115, '1', '2', '5:02', 0, '37.507697024501866, 126.92769424598214', '서울 동작구 대방동 15-45', '노량진 근린공원', null, 'https://i.ytimg.com/vi/IveEGQnvOKk/mqdefault.jpg');
 
	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '어깨 통증 스트레칭 !', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/UCXXq-wEevg" width="640" height="360" class="note-video-clip"></iframe></p><p>안녕하세요! WhatTheHealth 입니다. !</p><p><br></p><p>오늘 소개드릴 운동은 어깨 통증 스트레칭입니다.</p><p><br></p><p>오랫동안 책상에 앉아있으면 어꺠가 구부러져 승모근쪽의 어깨가 뭉칩니다.</p><p><br></p>
       <p>위의 영상과 같이 어깨 통증을 같이 풀어볼까요 ?</p><p><br></p><p><span style="background-color: rgb(231, 156, 156);">주의사항</span></p><p>어깨에 통증이 오신분은 무리하게 따라하지 마세요!</p><p><br></p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 31, '0', '4', '7:04', 0, null, null, null, null, 'https://i.ytimg.com/vi/UCXXq-wEevg/mqdefault.jpg');
	
	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '하루 5분운동 !', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/bo6G-AWcFpM" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>운동소개</p><p>1. 무릎 직각 스텝(30초 진행)</p><p>2. 푸쉬 다운 업 (30 초 진행)</p><p>3. 한 팔 스윙 당기기(30초 진행)</p><p>4. 두팔 스윙 당기기 (30초 진행)</p>
	  <p>위의 4가지 동작을 총 2세트 진행하시는 걸 권유드립니다.</p><p><br></p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 189, '0', '0', '7:12', 0, null, null, null, null, 'https://i.ytimg.com/vi/bo6G-AWcFpM/mqdefault.jpg');
	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '야외 하체 운동편 !', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/65i1q-GO4BM" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>쪽팔림은 잠시 ! 운동은 영원히 !</p><p><br></p><p>오늘은 맑은 공기를 마시고, 야외에서 하체 단련운동을 해볼까요 ?</p>
	   <p>가벼운 스트레칭과 조깅을 시작으로 단단한 하체를 만들어 봅시다.</p><p>친구분과 같이 나와서 하시면 더 좋을 것 같네요 !</p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 122, '1', '3', '6:18', 0, '단대호수공원', '36.8342031755629, 127.17259657904086', '충남 천안시 동남구 안서동', null, 'https://i.ytimg.com/vi/65i1q-GO4BM/mqdefault.jpg');
	   	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '코어 밸런스 트레이닝 !!', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/tRSEme6Hdvw" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p><span style="background-color: rgb(255, 255, 0);">진짜 근육은 내부에 있는 코어근육 !</span></p><p>준비사항 - 짐볼</p>
	   <p>트레이너분과 함께 다같이 코어 근육을 만들어 보아요!</p><p><br></p><p>코어근육은 허리 틀어짐을 막아줍니다.</p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 117, '0', '1', '4:50', 0, null, null, null, null, 'https://i.ytimg.com/vi/tRSEme6Hdvw/mqdefault.jpg');
	   	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '집에서 할 수 있는 실내 허리 스트레칭', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/wjtqC8C_CGc" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p><b>오늘도 WhatTheHealth와 함께하는 운동꿀팁!</b></p><p><b><br></b></p><p>공부하시는 학생, 오랫동안 책상에 앉아 계신 직장인분들을 위한</p><p>허리스트레칭 방법을 알려드립니다.</p><p><b><u style="background-color: rgb(255, 255, 0);"><br></u></b></p>
	   <p><b><u style="background-color: rgb(255, 255, 0);">[운동방법]</u></b></p><p><b><u style="background-color: rgb(255, 255, 0);"><br></u></b>영상과 같이 1세트 5회 반복하세요</p><p>하루 총 5세트 25회 반복 운동이 허리 건강에 좋습니다.</p><p>매일 30분 투자로 허리건강을 챙기세요 !</p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 120, '0', '2', '1:07', 0, null, null, null, null, 'https://i.ytimg.com/vi/wjtqC8C_CGc/mqdefault.jpg');
	   	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '헬스장 런닝머신 뛰는 방법!', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/DtmR80rr66U" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>헬스장 유산소 운동으로 다들 런닝머신 하고 계시죠 ?</p><p>올바른 런닝방법을 소개드립니다.</p><p>영상과 같이 갑자기 빨리 뛰지 마시고, 천천히 속도를 올려주세요.</p><p><br></p>
	   <p>서서히 속도를 올리면 호흡이 안정되고, 운동효과도 배로 좋아집니다.(</p><p><span style="background-color: rgb(255, 255, 0);">(주의! 걷고 뛰기를 반복해주세요. )</span></p><p>그럼, 오늘도 WhatTheHealth와 함께 같이 뛰어보실까요 ?</p><p><br></p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 250, '0', '0', '3:12', 0, null, null, null, null, 'https://i.ytimg.com/vi/DtmR80rr66U/mqdefault.jpg');
	   	   
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube, photo)
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '평행봉 딥스스윙 알아보기!', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/Pve_4h6TBGA" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>안녕하세요 ! WhatTheHealth입니다.</p><p>오늘은 야외에서 평행봉 운동방법에 대해 소개드립니다.</p><p><br></p><p><span style="background-color: rgb(255, 255, 0);">[운동방법]</span></p><p>1. 무반동 딥스 (0:20) - 10회 이상</p><p> - 무반동 딥스를 10회 이상 워밍업을 합니다.</p>
	   <p>2. 팔꿈치 굽힌상태에서 스윙(0:36)</p><p>- 점진적으로 스윙 범위를 늘려줍니다.</p><p>3. 팔꿈치 편상태에서 스윙</p><p>- 스윙 가동범위를 좁게해서 워밍업해주세요!</p><p><br></p><p>* 상단의 스케줄담기를 통해 해당 운동방법을 기억해주세요!</p>', 
	   'admin', sysdate, 0, 1, seq_ex_info_ex_info_no.nextval, 160, '1', '2', '3:08', 0, '일산호수공원', '37.65613679034908, 126.76414200157089', '경기 고양시 일산동구 장항동 906', null, 'https://i.ytimg.com/vi/DtmR80rr66U/mqdefault.jpg');
		   
//DietCommunity
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user1', '따뜻한 버섯전골 !!!!!~~~~~~~~~~', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/-hGDl_r3ff0" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>버섯전골 먹었는데 칼로리 얼마나 될까요 ?ㅠㅠ</p><p>너무 많이 먹었어요 ㅠㅠ</p><p><br></p>', 
	'https://i.ytimg.com/vi/-hGDl_r3ff0/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);

INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user7', '간헐적 단식 도전합니다', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/VRPK56lu5f8" width="640" height="360" class="note-video-clip"></iframe><br></p><p>같이 해요~~</p>', 
	'https://i.ytimg.com/vi/VRPK56lu5f8/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);
	   	
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user3', '곱창먹고싶어요', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/btzgMxN9FoI" width="640" height="360" class="note-video-clip"></iframe><br></p><p>곱창 먹고싶어요...ㅜㅜ 방이동 별미곱창 진짜 맛있어요,, 꼭 먹으세요..</p>', 
	'https://i.ytimg.com/vi/btzgMxN9FoI/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);
	   		   
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user2', '야식 끊어야 되는데..', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/QvQlaD_S3-M" width="640" height="360" class="note-video-clip"></iframe><br></p><p>끊을 수가 없네요..ㅜㅜ</p>', 
	'https://i.ytimg.com/vi/QvQlaD_S3-M/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);
	
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user5', '치맥이 땡기는 밤이네요~', 
	 '<p><br></p><p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/bbJ_KtUvqPo" width="640" height="360" class="note-video-clip"></iframe><br></p><p>치맥치맥</p>', 
	'https://i.ytimg.com/vi/bbJ_KtUvqPo/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);	
	
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user4', '김종국의 닭가슴살 쉐킹', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/ZGs2r86CUrk" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>sbs 미운오리새끼에서 김종국이 즐겨먹어 화재가 된 김종국쉐이크!!</p><p>여기 만드는 방법이 있어요</p><p>모두 공유하고 멋있는몸 만들길 바라요!!!</p><p><br></p><p><br></p>', 
	'https://i.ytimg.com/vi/ZGs2r86CUrk/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);	
	
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user4', '가성비별 프로틴추천', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/jgZ3qVKuwNg" width="640" height="360" class="note-video-clip"></iframe><br></p><p>가성비 프로틴추천하는 영상을 추천</p><p>저는 몬밀먹는데 여러분은 뭐드시나요???</p>', 
	'https://i.ytimg.com/vi/jgZ3qVKuwNg/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);	
	
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user7', '어떤분이 수원왕갈비통닭 올렸길래', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/dBr-drzet-o" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>저는 영상 7개정도 올라온거 해먹어 봤는데 이게 제일 맛있더라구요</p><p>모두 왕갈비통닭 많이 드세유!!</p>', 
	'https://i.ytimg.com/vi/dBr-drzet-o/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);	
	
INSERT INTO 
	post(post_no, post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
		category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'DC'||seq_excom_excom_no.nextval, 'user10', '다이어트 포기했습니다. ... ', 
	 '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/aI5wejCDXtg" width="640" height="360" class="note-video-clip"></iframe><br></p><p>이 영화보고 치킨 사먹었네요 젠장 ....;</p', 
	'https://i.ytimg.com/vi/aI5wejCDXtg/mqdefault.jpg', 0, '0', '0', 0, '3', SYSDATE, null, null, null);	
	
//ExCommunity

INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user7', '한강 조깅 후기'}, 
	'<p>안녕하세요! 최근에 서울러가 된 쪼욘입니다.!</p><p>오늘 처음으로 한강가서 런닝했어요 ! 멋있는 남자들도 많고 공기도 좋고</p><p>정말 좋네요 !</p><p>내일 저랑 같이 달리실 분은 한강공원여의도지구 오후 5시에 만나요!</p>', 
	null, 0, '0', '0', 0, '2', SYSDATE,
	'한강공원여의도지구', '37.52634122823069, 126.93510162917642', '서울 영등포구 여의동로 290	');
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user1', '저랑 같이 이 운동 하실 분?'}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/YDX7PZgDMqE" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>같이 스케줄표짜고 하실 분 계신가요 ? 혼자 너무 의지박약이라 ㅠㅠ.....</p>', 
	'https://i.ytimg.com/vi/YDX7PZgDMqE/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);	
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user1', '이게 사람인가요 ? '}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/F8BkjNNMF0c" width="640" height="360" class="note-video-clip"></iframe><br></p><p>12,000칼로리... 먹는데 저 몸매유지할 수 있는 이유가 모죠 ... ?</p><p><br></p><p>대단합니다... 정말</p>', 
	'https://i.ytimg.com/vi/F8BkjNNMF0c/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user5', '데드리프트 140kg...'}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/lpkSiEslktA" width="640" height="360" class="note-video-clip"></iframe><br></p><p>오늘 헬스장에서 데드리프트 50kg 하다가 실패했는데 140이라니..</p><p><br></p><p>자괴감드네요 ㅠㅠ</p>', 
	'https://i.ytimg.com/vi/lpkSiEslktA/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);		   	
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user10', '천안 필라테스 같이 다니실 분 ? '}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/Ov8PwKwV3Hc" width="640" height="360" class="note-video-clip"></iframe><br></p><p>천안 거주하시는 분 중에 "에스필라테스" 괜찮나요 ?</p><p><br></p><p>괜찮으면 같이 다녀요 혼자다니기에는 너무나 뻘쭘하네요 ㅠㅠ</p><p><br></p><p><br></p>', 
	'https://i.ytimg.com/vi/Ov8PwKwV3Hc/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	'에스필라테스', '36.829753517411, 127.133572841335', '충남 천안시 서북구 서부대로 704');		   	
		
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user3', '오늘 등근육 찢었습니다.!!!'}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/rS3AnDXRk1k" width="640" height="360" class="note-video-clip"></iframe><br></p><p>오늘 정말 알차게 등근육 찢었네요</p><p>운동꿀팁 영상 보고 야외에서 철봉이랑 평행봉으로 찢어놨습니다.</p><p><br></p><p>감사해요 왓더헬스 !!</p>', 
	'https://i.ytimg.com/vi/rS3AnDXRk1k/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);	
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user3', '제 운동 V로그 보세요 ! ^^'}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/S2v2lVSdW24" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p>회원여러분들과 같이 공유하고 싶어서 제 영상 공유드려요.</p><p>시작하시는 분들 자극 되시길~ ^^</p>', 
	'https://i.ytimg.com/vi/S2v2lVSdW24/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user8', '같이 체육관에서 농구하실 분 ?'}, 
	'<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/JUfxy4AgkEg" width="640" height="360" class="note-video-clip"></iframe><br></p><p>하루하루 영상분석 후에 운동 같이 하실 분 계신가요 ?</p><p>초급자분들 위주로요 ~!</p><p>위치는 한강이구요!</p>', 
	'https://i.ytimg.com/vi/JUfxy4AgkEg/mqdefault.jpg', 0, '0', '0', 0, '2', SYSDATE,
	'망원한강공원 농구장2', '37.55100789332349, 126.90095802759619	0', '서울 마포구 마포나루길 407');
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user6', '대퇴부 강화 운동 어떻게 하나요 ??'}, 
	'<p>힘줄 파열되서 의사선생님이 대퇴부 강화 운동하라는데</p><p>감이 잘 안서네요 ㅠㅠ</p><p><br></p><p>운동고수이신분 추천좀 부탁드립니다.</p><p><br></p>', 
	null, 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);
	
INSERT INTO 
	post(post_no,  post_sub_no, user_id, title, contents, photo, click_count, blind_status, delete_status, like_count,
	category, post_date, locationtag_name, coordinate, address)
VALUES
	(seq_post_post_no.nextval, 'EC'||seq_excom_excom_no.nextval, 'user6', '오늘 다이어트 복싱 했는데 ..ㅠㅠ'}, 
	'<p>요새 다이어트 복싱 배우고 있는데 관장님이 스파링 한번 해보라고 하셔서</p><p>저보다 중량 20kg 나가는 남자랑 스파링했습니다.</p><p><br></p><p>근데 이겨부렀어요...</p><p><br></p><p>재능을 찾은 걸까요 ??</p>', 
	null, 0, '0', '0', 0, '2', SYSDATE,
	null, null, null);		

	