//����� �Խñ� ���
INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '������ �� �� �ִ� �ǳ� �㸮 ��Ʈ��Ī', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/wjtqC8C_CGc" width="640" height="360" class="note-video-clip"></iframe><br></p><p><br></p><p><b>���õ� WhatTheHealth�� �Բ��ϴ� �����!</b></p><p>�����Ͻô� �л�, �������� å�� �ɾ� ��� �����κе��� ����</p><p>�㸮��Ʈ��Ī ����� �˷��帳�ϴ�.</p><p>
	   <u style="background-color: rgb(255, 255, 0);">[����]</u></p><p>����� ���� 1��Ʈ 5ȸ �ݺ��ϼ���</p><ul><li>�Ϸ� �� 5��Ʈ 25ȸ �ݺ� ��� �㸮 �ǰ��� �����ϴ�.</li></ul><p>���� 30�� ���ڷ� �㸮�ǰ��� ì�⼼�� !</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', 
	   'admin', sysdate, null, 1, seq_ex_info_ex_info_no.nextval, 203, '0', '2', '1:07', 0, null, null, null, null)

INSERT INTO
     post(post_no, post_sub_no, title, contents, user_id, post_date, like_count, category, ex_info_no,
     	  ex_calorie, ex_place, ex_part, ex_videotime, delete_status, locationtag_name, coordinate, address, youtube )
VALUES
      (seq_post_post_no.nextval, 'EI'||seq_ex_info_ex_info_no.currval, '�ｺ�忡�� ���׸ӽ� �ٴ¹��!', 
      '<p><br></p><p><iframe frameborder="0" src="//www.youtube.com/embed/DtmR80rr66U" width="640" height="360" class="note-video-clip"></iframe><br></p><p><span style="font-weight: bolder; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;"><br></span></p><p><span style="font-weight: bolder; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">WhatTheHealth�� �Բ��ϴ� ���׸ӽ� �ܲ���!</span></p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">�ｺ�� ���ø�, ȸ�� ������ ���׸ӽ� ������ �ϰ� ����� ?</p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">���׸ӽŵ� �ٴ� ����� �ֽ��ϴ�. ���� �Բ� ���Ǳ�� ?</p>
	   <p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;"><u style="background-color: rgb(255, 255, 0);">[����]</u></p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">�Ȱ� �ٱ⸦ �ݺ��մϴ�. ó������ �ٷ� �����ӵ��� ���� ���ð�, ������ �ӵ��� �÷�</p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">�޸�����! ȣ���� �����Ǹ�, �ȿ���� �ξ� �� �������ϴ�.</p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;"><br></p><p style="margin-bottom: 1rem; color: rgb(77, 77, 77); font-family: horan; font-size: 18px;">���õ� ���� WhatTheHealth�� ���� �޷����ô�!!</p>', 
	  'admin', sysdate, null, 1, seq_ex_info_ex_info_no.nextval, 156, '0','0', '2:11', 0, null, null, null, null)
       