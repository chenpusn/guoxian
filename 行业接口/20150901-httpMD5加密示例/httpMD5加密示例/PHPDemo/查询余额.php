<?php //查询余额
$time = time();
$post_data = array();
$post_data['userid'] = '';//企业ID
$post_data['timestamp']=date("YmdHis",$time);//当前时间戳
$post_data['sign']=strtolower(md5(用户名密码.(date("YmdHis",$time))));//MD5（账号密码当前时间戳）
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
//curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //如果需要将结果直接返回到变量里，那加上这句。
$result = curl_exec($ch);
?>