<?php //��ѯ���
$time = time();
$post_data = array();
$post_data['userid'] = '';//��ҵID
$post_data['timestamp']=date("YmdHis",$time);//��ǰʱ���
$post_data['sign']=strtolower(md5(�û�������.(date("YmdHis",$time))));//MD5���˺����뵱ǰʱ�����
$url='http://xtx.telhk.cn:8080/v2sms.aspx?action=overage';
$o='';
foreach ($post_data as $k=>$v)
{
    $o.=urlencode("$k=".$v).'&';
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