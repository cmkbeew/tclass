$(function () {
    //레이어 열기
    window.gfnOpenLayer = function (popupContent,scrolling) {

        var settings = {
            position: 'fixed',
            width: '100%',
            minHeight: '100%',
            top: 0,
            opacity: 0,
            scale: 0.9,
            y: 0
        }
        var scrolling = scrolling;

        popupContent.find('.popContent').scrollTop(0);
        popupContent.attr('tabIndex', -1).focus();
        popupContent.find('.btnClose').on('click', function (e) {
            e.preventDefault();
            $(this).closest(popupContent).hide();
            $('body').removeAttr('style');

            if (window.focusBtn) {
                window.focusBtn.focus();
            }
        });
    }

    $(function(){
        gfnOpenLayer($('.popMainNotice'),'no');
    });

    //레이어 닫기
    window.gfnCloseLayer  = function (popupContent) {
        popupContent.hide();
        $('body').removeAttr('style');
        if (window.focusBtn) {
            window.focusBtn.focus();
        }
    }

    /*************
    FORM
    **************/
    $('.formBoxWrap select').change(function () {
        $(this).parent().addClass('selectBlack');
    });
   $('.formBoxWrap *' ).on('click',function(){
        $(this).parent().addClass('focusLine');
        $(this).parent().addClass('openTitle');
    });
    $('.formBoxWrap *' ).on('blur',function(){
        $(this).parent().removeClass('focusLine');
        $(this).parent().removeClass('openTitle');
    });
    $('.formBoxWrap input,label,select').change(function () {
        $(this).parent().addClass('fix');
    });
    $('.idSelect').bind('mouseleave', function() {
        $('.idSelect').removeClass('focusLine');
    });

    /*************
    이용약관동의
    **************/
    $('.moreBtn').toggleClass('inactive-header');
    // 아코디언효과
    $('.moreBtn').click(function () {
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