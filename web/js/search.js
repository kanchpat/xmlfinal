
  $(document).ready(function() {
    $('#department').change(function(){
      getCourseList();
    });
    $('#course_group').change(function(){
      getCourseList();
    });
    $('#offered').change(function(){
      getCourseList();
    });
    $('#term').change(function(){
      getCourseList();
    });
    $('#level').change(function(){
      getCourseList();
    });
    $('#instructor').change(function(){
      getCourseList();
    });
    $('#day').change(function(){
      getCourseList();
    });
    $('#time').change(function(){
      getCourseList();
    });
  })

function getCourseList() {
    var department = $('#department').fieldValue()[0];
    var course_group = $('#course_group').fieldValue()[0];
    var offered = '';
    var offered_checkbox = $('#offered').fieldValue()[0];
    if (offered_checkbox != undefined) {
      offered = offered_checkbox;
    }

    var level = $('#level').fieldValue()[0];
    var term = $('#term').fieldValue()[0];
    var instructor = $('#instructor').fieldValue()[0];
    var day = $('#day').fieldValue()[0];
    var time = $('#time').fieldValue()[0]; 
    $('#courselist').load(
      'ajax/search_advanced.xhtml',
      {
        'department'    : department,
        'course_group'  : course_group,
        'offered'       : offered,
        'term'          : term,
        'level'         : level,
        'instructor'    : instructor,
        'day'           : day,
        'time'          : time
       }
    );
  }