<?php //�ύ����
$time = time();
$post_data = array();
$post_data['userid'] = '';//��ҵID
$post_data['timestamp']=date("YmdHis",$time);//��ǰʱ���
$post_data['sign']=strtolower(md5(�û�������.(date("YmdHis",$time))));//MD5���˺����뵱ǰʱ�����
$post_data['content'] = ''; //��ʽΪ�����ݡ�ǩ����
$post_data['mobile'] = '';//�ֻ���
$post_data['sendtime'] = ''; //����ʱ���ͣ�ֵΪ��������ʱ���ͣ������ʽYYYYMMDDHHmmss������ֵ
$url='http://xtx.telhk.cn:8080/v2sms.aspx?action=send';
$o='';
foreach ($post_data as $k=>$v)
{
   $o.="$k=".urlencode($v).'&';
}
$post_data=substr($o,0,-1);
$ch = curl_init();
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_URL,$url);
curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
//curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //�����Ҫ�����ֱ�ӷ��ص�������Ǽ�����䡣
$result = curl_exec($ch);
?>