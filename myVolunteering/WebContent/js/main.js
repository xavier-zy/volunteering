jQuery(function($) {
	'use strict',

	// #main-slider
	$(function() {
		$('.carousel').carousel({
			interval : 4000,
			pause : "false"
		});
	});

	// accordian
	$('.accordion-toggle').on('click', function() {
		$(this).closest('.panel-group').children().each(function() {
			$(this).find('>.panel-heading').removeClass('active');
		});

		$(this).closest('.panel-heading').toggleClass('active');
	});

	// portfolio filter
	$(window).load(function() {
		'use strict';
		var $portfolio_selectors = $('.portfolio-filter >li>a');
		var $portfolio = $('.portfolio-items');
		$portfolio.isotope({
			itemSelector : '.portfolio-item',
			layoutMode : 'fitRows'
		});

		$portfolio_selectors.on('click', function() {
			$portfolio_selectors.removeClass('active');
			$(this).addClass('active');
			var selector = $(this).attr('data-filter');
			$portfolio.isotope({
				filter : selector
			});
			return false;
		});
	});

	// Pretty Photo
	$("a[rel^='prettyPhoto']").prettyPhoto({
		social_tools : false
	});
});

function getNowFormatDate(select) {
	var date = new Date();
	var seperator1 = "-";
	var seperator2 = ":";
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	if (hours >= 0 && hours <= 9) {
		hours = "0" + hours;
	}
	if (minutes >= 0 && minutes <= 9) {
		minutes = "0" + minutes;
	}
	if (seconds >= 0 && seconds <= 9) {
		seconds = "0" + seconds;
	}

	var currentdate = date.getFullYear() + seperator1 + month + seperator1
			+ strDate + " " + hours + seperator2 + minutes + seperator2
			+ seconds;
	if (select == 1) {
		currentdate = date.getFullYear() + seperator1 + month + seperator1
				+ strDate;
	}
	return currentdate;
}

function check() {
	if ($("#password").val() != $("#con_password").val()) {
		$("#repeatTip").html('');
		$("<font color='red'>两次密码不一致</font>").appendTo($("#repeatTip"));
	} else {
		$("#signupForm").submit();
	}
}

function change() {
	$("#display").toggle();
	$("#change").toggle();
	$("#displayForm").toggle();
	$("#uploadImg").toggle();
}

function insertUserInfo() {
	var d = new Date();
	var data = {
		'address' : $('#address').val(),
		'age' : $('#age').val(),
		'email' : $('#email').val(),
		'gender' : $('#gender').val(),
		'phone' : $('#phone').val(),
		'signature' : $('#signature').val(),
		'userId' : $('#userId').val(),
		'username' : $('#username').val(),
		'time' : getNowFormatDate(),
		'department' : $('#department').val(),
		'realname' : $('#realname').val()
	};
	$.ajax({
		url : 'api/TUserInfoInsertServlet',
		data : data,
		success : function(tip) {
			alert('修改成功！');
			location.reload();
		},
		error : function(tip) {
			alert('修改失败，请重新输入！');
		}
	})
	console.log(data);
}

function updateUserInfo() {
	var d = new Date();
	var data = {
		'address' : $('#address').val(),
		'age' : $('#age').val(),
		'email' : $('#email').val(),
		'gender' : $('#gender').val(),
		'phone' : $('#phone').val(),
		'signature' : $('#signature').val(),
		'userId' : $('#userId').val(),
		'username' : $('#username').val(),
		'time' : getNowFormatDate(),
		'department' : $('#department').val(),
		'realname' : $('#realname').val()
	};
	$.ajax({
		url : 'api/TUserInfoUpdateServlet',
		data : data,
		success : function(tip) {
			alert('修改成功！');
			location.reload();
		},
		error : function(tip) {
			alert('修改失败，请重新输入！');
		}
	})
	console.log(data);
}

function enroll(userId, activityId, activityStatus) {
	if (userId == '') {
		alert('请登陆！');
	} else {
		$.ajax({
			url : 'api/MyActivityInsertServlet',
			data : {
				userId : userId,
				activityId : activityId,
				activityStatus : activityStatus
			},
			success : function(tip) {
				alert('报名成功！');
				location.reload();
			},
			error : function(tip) {
				alert('报名失败！');
			}
		})
	}
}

function cancel(id) {
	console.log(id);
	$.ajax({
		url : 'api/MyActivityDeleteServlet',
		data : {
			id : id
		},
		success : function(tip) {
			alert('取消报名成功！');
			location.reload();
		},
		error : function(tip) {
			alert('取消报名失败！');
		}
	})
}

function insertMessage(userName) {
	console.log(userName);
	$.ajax({
		url : 'api/messageInsert',
		data : {
			userName : userName,
			writeDate : getNowFormatDate(),
			content : $('#message').val()
		},
		success : function(tip) {
			alert('留言成功！');
			location.reload();
		},
		error : function(tip) {
			alert('留言失败！');
		}
	})
}

function publishActivity(adminid) {
	if (adminid == "") {
		alert('请登录！');
		location.reload();
	} else {
		console.log(adminid);
		$.ajax({
			url : 'api/activityInsert',
			data : {
				activityDate : $('#activityDate').val(),
				deadline : $('#deadline').val(),
				title : $('#title').val(),
				address : $('#address').val(),
				number : $('#number').val(),
				orgnizator : $('#orgnizator').val(),
				introduction : $('#introduction').val(),
				state : '招募中',
				index2 : 0,
				adminid : adminid
			},
			success : function(tip) {
				alert('发布成功！');
				// location.reload();
			},
			error : function(tip) {
				alert('发布失败！');
			}
		})
	}
}

function test() {
	$.ajax({
		url : '/myVolunteering/com.Servlet/test',
		type : 'post',
		success : function(tip) {
			alert('发布成功！');
			location.reload();
		},
		error : function(tip) {
			alert('发布失败！');
		}
	})
	
}

function addLike(id) {
	$.ajax({
		url : 'AddLikeServlet',
		type : 'post',
		data : {
			id : id
		},
	})
	window.location.reload();
}

function addStory() {
	console.log(UM.getEditor('myEditor').getContent());
	$.ajax({
		url : 'StoryWritingServlet',
		type : 'post',
		data : {
			title : $('#title').val(),
			writtenTime : getNowFormatDate(),
			content : UM.getEditor('myEditor').getContent()
		},
		success : function(tip) {
			alert('发布成功！');
			// location.reload();
		},
		error : function(tip) {
			alert('发布失败！');
		}
	})
}

function publishNews() {
	console.log(UM.getEditor('myEditor').getContent());
	$.ajax({
		url : 'api/newsInsert',
		data : {
			title : $('#title').val(),
			publishtime : getNowFormatDate(),
			content : UM.getEditor('myEditor').getContent()
		},
		success : function(tip) {
			alert('发布成功！');
			// location.reload();
		},
		error : function(tip) {
			alert('发布失败！');
		}
	})
}

