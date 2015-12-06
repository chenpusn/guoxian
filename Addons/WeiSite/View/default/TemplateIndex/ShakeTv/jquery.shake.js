/*
//手机摇一摇
//deviceOrientation：封装了方向传感器数据的事件，可以获取手机静止状态下的方向数据，例如手机所处角度、方位、朝向等
//deviceMotion：封装了运动传感器数据的事件，可以获取手机运动状态下的运动加速度等数据
//DeviceMotionEvent(设备运动事件)返回设备有关于加速度和旋转的相关信息；加速度的数据将包含三个轴：x，y和z；该事件会返回两个属性，accelerationIncludingGravity(含重力的加速度)和acceleration(加速度)，后者排除了重力的影响
//使用方法

$(document).shake({
			shake_speed:5,  
			time_difference:50,
			shakeAfter : function(){}
});

*/

(function($){
	$.extend($.fn,{
				
		  shake : function(o){
		  
			  var defaults = {
				  shake_speed : 20, //定义摇动的速度   
				  time_difference : 50, //定义摇动时间间隔
				  shakeAfter : function() {}
			  };
			  o = $.extend(defaults, o);
			  return this.each(function(){
				   						  
				  var $self = $(this),  
					  last_update = 0, //定义上次更新时间  
					  x=y=z=last_x=last_y=last_z=0,
					  count = 0;// 为了增加这个例子的一点无聊趣味性，增加一个计数器

				  function deviceMotionHandler(eventData) {  
					  
					  	
					  var acceleration =eventData.accelerationIncludingGravity;//获取含重力的加速度
					  
					  // 获取当前时间
					  var curTime = new Date().getTime();
					  // 获取时间间隔
					  var diffTime = curTime -last_update;  
				  
					  // 固定摇动时间间隔，以防走路颠簸都可以摇动，呵~
					  if (diffTime > o.time_difference) {
						   
						  last_update = curTime;
						  x = acceleration.x; //x速度  
						  y = acceleration.y; //Y速度      
						  z = acceleration.z; //Z速度  
						 
						  // var speed = Math.abs(x +y + z - last_x - last_y - last_z) / diffTime * 10000;     
						  var speed = Math.abs(x-last_x);
							
						  if (speed > o.shake_speed) {
						  // TODO:在此处可以实现摇一摇之后所要进行的数据逻辑操作	
							  count++;
							  
							  //摇一摇过后执行回调函数
							  o.shakeAfter(count);
						  }      
						  last_x = x;      
						  last_y = y;      
						  last_z = z;      
					  }
				  }
				  
				  function init(){  
					  //监听运动传感事件
					  if (window.DeviceMotionEvent) {   
					  	 window.addEventListener('devicemotion',deviceMotionHandler, false);    
					  } else{  
						  //alert('很抱歉！您的手机不支持摇动');  
					  }  
				  } 
				  
				  init();//初始化
			  
			 });
	     }
	})
})(Zepto);








