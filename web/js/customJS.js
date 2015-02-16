$(document).ready(
function () {
    $('#left-nav').load('web/departments.html', setLeftNavEventHandlers);
    /*  $('a#trigger').live("mouseenter", onCourseHover);*/
    //$('a#trigger').live("mouseleave", onCourseUnHover);
    $('a#trigger').live("click", onCourseUnHover);
});

function setLeftNavEventHandlers() {
    $('.leftnav-heading').click(function () {
        
        $(this).parent().parent().parent().find('p.leftnav-heading').removeClass('selected');
        $(this).addClass('selected');
    });
}

function hideContent(mode) {
    
    if ($('div.accord-container').find('p.group-heading').length > 1) {
        
        /*  mode = 1 : Grouping applied, so expand the course group header to show the groups
        mode = 0 : No grouping, collapse everything to just show the course group heading */
        
        if (mode == '1') {
            $(".accord-content").hide();
            
            $('.accord-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
            
            $('.group-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
            
            $('.group-heading').click();
        } else {
            $(".accord-content").hide();
            
            $('.accord-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
            
            $('.group-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
        }
    } else if ($('div.accord-container').find('p.group-heading').length == 1 && $('div.accord-container').find('p.accord-heading').length > 1) {
        if (mode == '1') {
        
            $(".accord-content").hide();
            
            $('.accord-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
            
            $('.group-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
            
            $('.group-heading').click();
        
        } else {
        
            $(".accord-content").hide();
            
            $('.accord-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
            
            $('.group-heading').click(function () {
                $(this).next().slideToggle("fast");
            });
        }
    }
}

function loadCourses(deptCode, ignoreGroupingFlag) {
    
    if (ignoreGroupingFlag != 'true') {
        if ($('#hdnGroupBy').val() == '') {
            
            $('#right-nav').load('web/departments/' + escape(deptCode) + '.html?deptcode=' + escape(deptCode), function () {
                hideContent('0');
            });
            $('#hdnDeptCode').val(deptCode);
        } else {
            groupCoursesBy($('#hdnGroupBy').val());
        }
    } else {
        $('#right-nav').load('web/departments/' + escape(deptCode) + '.html?deptcode=' + escape(deptCode), function () {
            hideContent('0');
        });
        $('#hdnDeptCode').val(deptCode);
        $('#hdnGroupBy').val('');
    }
};

function groupCoursesBy(groupBy) {
    
    $('#right-nav').load('web/departments/' + escape($('#hdnDeptCode').val()) + '.html?deptcode=' + escape($('#hdnDeptCode').val()) + '&' + 'groupby=' + groupBy, function () {
        hideContent('1');
    });
    $('#hdnGroupBy').val(groupBy);
};

function loadCourseDetails(deptCode, groupCode) {
    $('#right-nav').load('web/courses/' + groupCode + '.html?deptcode=' + escape(deptCode) + '&' + 'groupcode=' + groupCode);
};

function exportToPDF(deptCode, groupOn, type, courseName, catNum, deptShortName, deptLongName, groupCode) {
    if (type == 'group') {
        window.open('xslfo/group/' + escape(deptCode) + '.pdf?pdepCode=' + escape(deptCode) + '&pdepName=' + deptShortName + '&pdepLName=' + deptLongName + '&pGroupOnMore=' + groupOn);
    } else if (type == 'single') {
        window.open('xslfo/singlecourse/' + escape(courseName) + '.pdf?pdepCode=' + escape(deptCode) + '&pdepName=' + deptShortName + '&pdepLName=' + deptLongName + '&pcrsCatNum=' + escape(catNum) + '&pcrsGrpCode=' + escape(groupCode));
    }
}

function onCourseUnHover() {
    CourseElementHasFocus = 'false';
    
    setTimeout(function () {
        //alert(CourseElementHasFocus + ' '  + PopUpDivHasFocus);
        if (CourseElementHasFocus != 'true' && PopUpDivHasFocus != 'true') {
            setTimeout(function () {
                $('div#pop-up').hide();
            },
            100);
            //$('div#pop-up').hide();
        }
    },
    100);
}

var PopUpDivHasFocus;
var CourseElementHasFocus;
function onCourseHover(deptCode, groupCode) {
    CourseElementHasFocus = 'true';
    var moveLeft = 5;
    var moveDown = 0;
    
    $('div#pop-up').load('web/courses/' + escape(deptCode) + '.html?deptcode=' + escape(deptCode) + '&' + 'groupcode=' + groupCode + '&' + 'mode=popup');
    /*    $('div#pop-up').show();*/
    
    $('div#pop-up').show();
    $('div#pop-up').css('top', event.pageY + moveDown).css('left', event.pageX + moveLeft).appendTo('body');
    
    mapInitialize();
    
    //$('a#trigger').mousemove(function(e) {
    //$("div#pop-up").css('top', event.pageY + moveDown).css('left', event.pageX + moveLeft);
    //});
}

function onPopUpDivHover() {
    
    $('div#pop-up').show();
    
    PopUpDivHasFocus = 'true';
    //$('div#pop-up').css('top', event.pageY + moveDown).css('left', event.pageX + moveLeft).appendTo('body');
}

function onPopUpDivUnHover() {
    PopUpDivHasFocus = 'false';
    onCourseUnHover();
}

function doBasicSearch(keyword) {
    alert(keyword);
}