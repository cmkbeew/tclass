$(function() {
	/*************
	FORM 액션
	**************/
	$('.formBox select').change(function() {
		$(this).parent().addClass('selectBlack');
	});
	$('.formBox *').on('click', function() {
		$(this).parent().addClass('focusLine');
		$(this).parent().addClass('openTitle');
	});
	$('.formBox *').on('blur', function() {
		$(this).parent().removeClass('focusLine');
		$(this).parent().removeClass('openTitle');
	});
	$('.formBox input,label,select').change(function() {
		$(this).parent().addClass('fix');
	});
	$('.sexSelect').bind('mouseleave', function() {
		$('.sexSelect').removeClass('focusLine');
	});

    // 데이타 없을시 상위 클래스 높이값 줄임.
    $("p.noData").parents('.reportWrap .cntStatus .weekBox dl dd div').css("height","140px");

    /*************
	이용약관동의
	**************/
	// 약관 새창열림으로인해 삭제
	// $('.moreBtn').toggleClass('inactive-header');
	// $('.moreBtn').click(function () {
	// 	if($(this).is('.inactive-header')) {
	// 		$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle(100).toggleClass('open-content');
	// 		$(this).toggleClass('active-header').toggleClass('inactive-header');
	// 		$(this).next().slideToggle(100).toggleClass('open-content');
	// 	}
	// 	else {
	// 		$(this).toggleClass('active-header').toggleClass('inactive-header');
	// 		$(this).next().slideToggle(100).toggleClass('open-content');
	// 	}
	// });
	// return false;
    /*************
	학습현황 토글 활성
	**************/
	 $('.weekBox .moreBtn').toggleClass('inactive-header');
	 $('.weekBox .moreBtn').click(function () {
	 	if($(this).is('.inactive-header')) {
	 		$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle(100).toggleClass('open-content');
	 		$(this).toggleClass('active-header').toggleClass('inactive-header');
	 		$(this).next().slideToggle(100).toggleClass('open-content');
	 	}
	 	else {
	 		$(this).toggleClass('active-header').toggleClass('inactive-header');
	 		$(this).next().slideToggle(100).toggleClass('open-content');
	 	}
	 });
	 return false;
});


$(function() {
    AOS.init({
        duration: 500,
    })

});
//툴팁버튼
$(document).ready(function() {

	$('.btnTool').click(function() {
		$('.editLay').addClass('dBlock');
	});

	$(document).click(function(e) {
		if (!$(e.target).is('.btnTool')) {
			$('.editLay').removeClass('dBlock');
		}

	});

	//개인정보수정 생년월일 클릭불가
	$('.noEdit select').attr('disabled', 'true');

	// T리포트 점수 자세히보기
	$(".infoArea .btnDetail a").click(function() {
		$(".socreTblWrap").slideToggle();
		$(".btnDetail").toggleClass("open");
	});

});

//사이드바
function openNav() {
	document.getElementById("mySidenav").style.left = "0";
}

function closeNav() {
	document.getElementById("mySidenav").style.left = "-2000px";
}


//결제정보 탭사이즈 유동화
$(document).ready(function() {
	var tabLength = $('.payTab>li').length;
	$('.paymentWrap .payTab li').css('width',100/tabLength+'%');
});


//바 형태 차트
$(document).ready(function() {
	$.fn.skillBars = function(options) {

		var settings = $.extend({
			from: 0, // number start
			to: false, // number end
			speed: 1000, // how long it should take to count between the target numbers
			interval: 100, // how often the element should be updated
			decimals: 0, // the number of decimal places to show
			onUpdate: null, // callback method for every time the element is updated,
			onComplete: null, // callback method for when the element finishes updating
			/*onComplete: function(from) {
                console.debug(this);
            }*/
			classes: {
				skillBarBar: '.skillbar-bar',
				skillBarPercent: '.skill-bar-percent',
			}
		}, options);

		return this.each(function() {

			var obj = $(this),
				to = (settings.to != false) ? settings.to : parseInt(obj.attr('data-percent'));
			if (to > 100) {
				to = 100;
			};
			var from = settings.from,
				loops = Math.ceil(settings.speed / settings.interval),
				increment = (to - from) / loops,
				loopCount = 0,
				interval = setInterval(updateValue, settings.interval);

			obj.find(settings.classes.skillBarBar).animate({
				width: parseInt(obj.attr('data-percent')) + '%'
			}, settings.speed);

			function updateValue() {
				from += increment;
				loopCount++;
				$(obj).find(settings.classes.skillBarPercent).text(from.toFixed(settings.decimals) + '점');

				if ($(obj).hasClass('v2')) {
					$(obj).find(settings.classes.skillBarPercent).text(from.toFixed(settings.decimals));
				}
				if (typeof(settings.onUpdate) == 'function') {
					settings.onUpdate.call(obj, from);
				}

				if (loopCount >= loops) {
					clearInterval(interval);
					from = to;

					if (typeof(settings.onComplete) == 'function') {
						settings.onComplete.call(obj, from);
					}
				}
			}

		});
	};
});
