//운동꿀팁 게시글 등록
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '집에서 할 수 있는 실내 허리 스트레칭', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/wjtqC8C_CGc" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p><b>오늘도 WhatTheHealth와 함께하는 운동꿀팁!</b></p><p>공부하시는 학생, 오랫동안 책상에 앉아 계신 직장인분들을 위한</p><p>허리스트레칭 방법을 알려드립니다.</p><p>
	   <u style="background-color: rgb(255, 255, 0);">[운동방법]</u></p><p>영상과 같이 1세트 5회 반복하세요</p><ul><li>하루 총 5세트 25회 반복 운동이 허리 건강에 좋습니다.</li></ul><p>매일 30분 투자로 허리건강을 챙기세요 !</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', 
	   'admin', sysdate, null, 1, seq_ex_info_ex_info_no.nextval, 203, '0', '2', '1:07', 0, null, null, null, null)

INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '헬스장에서 런닝머신 뛰는방법!', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/DtmR80rr66U" width="640" height="360" class="note-video-clip"></iframe><br></p><p><span style="font-weight: bolder; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;"><br></span></p><p><span style="font-weight: bolder; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">WhatTheHealth와 함께하는 런닝머신 꿀꿀팁!</span></p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">헬스장 가시면, 회원 여러분 런닝머신 가볍게 하고 계시죠 ?</p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">런닝머신도 뛰는 방법이 있습니다. 영상 함께 보실까요 ?</p>
	   <p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;"><u style="background-color: rgb(255, 255, 0);">[운동방법]</u></p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">걷고 뛰기를 반복합니다. 처음부터 바로 빠른속도로 뛰지 마시고, 서서히 속도를 올려</p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">달리세요! 호흡이 안정되면, 운동효과도 훨씬 더 좋아집니다.</p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;"><br></p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">오늘도 같이 WhatTheHealth와 같이 달려봅시다!!</p>', 
	  'admin', sysdate, null, 1, seq_ex_info_ex_info_no.nextval, 156, '0','0', '2:11', 0, null, null, null, null)
       