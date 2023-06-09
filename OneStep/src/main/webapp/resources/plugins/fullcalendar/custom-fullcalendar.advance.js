$(document).ready(function() {
    var modal = document.getElementById("addEventsModal");
    var btn = document.getElementById("myBtn");
    var addEvent = document.getElementById("add-e");
    var editEvent = document.getElementById("edit-event");
    var discard = document.getElementById("discard");
    var discardModal = document.querySelectorAll("[data-dismiss='modal']")[0];
    var addEventTitle = document.getElementsByClassName("add-event-title")[0];
    var editEventTitle = document.getElementsByClassName("edit-event-title")[0];
    var span = document.getElementsByClassName("close")[0];
    var input = document.querySelectorAll('input[type="text"]');
    var radioInput = document.querySelectorAll('input[type="radio"]');
    var textarea = document.getElementsByTagName('textarea');
    function createBackdropElement () {
        var btn = document.createElement("div");
        btn.setAttribute('class', 'modal-backdrop fade show')
        document.body.appendChild(btn);
    }
    // Reset radio buttons
    function clearRadioGroup(GroupName) {
      var ele = document.getElementsByName(GroupName);
        for(var i=0;i<ele.length;i++)
        ele[i].checked = false;
    }
    // Reset Modal Data on when modal gets closed
    function modalResetData() {
        modal.style.display = "none";
        for (i = 0; i < input.length; i++) {
            input[i].value = '';
        }
        for (j = 0; j < textarea.length; j++) {
            textarea[j].value = '';
          i
        }
        clearRadioGroup("marker");
        // Get Modal Backdrop
        var getModalBackdrop = document.getElementsByClassName('modal-backdrop')[0];
        document.body.removeChild(getModalBackdrop);
    }
    // When the user clicks on the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
        addEvent.style.display = 'block';
        editEvent.style.display = 'none';
        addEventTitle.style.display = 'block';
        editEventTitle.style.display = 'none';
        document.getElementsByTagName('body')[0].style.overflow = 'hidden';
        createBackdropElement();
        enableDatePicker();
    }
    // Clear Data and close the modal when the user clicks on Discard button
    discardModal.onclick = function() {
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
    }
    // Clear Data and close the modal when the user clicks on <span> (x).
    span.onclick = function() {
        modalResetData();
        document.getElementsByTagName('body')[0].removeAttribute('style');
    }
    // Clear Data and close the modal when the user clicks anywhere outside of the modal.
    window.onclick = function(event) {
        if (event.target == modal) {
            modalResetData();
            document.getElementsByTagName('body')[0].removeAttribute('style');
        }
    }
    newDate = new Date()
    monthArray = [ '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12' ]
    function getDynamicMonth( monthOrder ) {
        var getNumericMonth = parseInt(monthArray[newDate.getMonth()]);
        var getNumericMonthInc = parseInt(monthArray[newDate.getMonth()]) + 1;
        var getNumericMonthDec = parseInt(monthArray[newDate.getMonth()]) - 1;
        if (monthOrder === 'default') {
            if (getNumericMonth < 10 ) {
                return '0' + getNumericMonth;
            } else if (getNumericMonth >= 10) {
                return getNumericMonth;
            }
        } else if (monthOrder === 'inc') {
            if (getNumericMonthInc < 10 ) {
                return '0' + getNumericMonthInc;
            } else if (getNumericMonthInc >= 10) {
                return getNumericMonthInc;
            }
        } else if (monthOrder === 'dec') {
            if (getNumericMonthDec < 10 ) {
                return '0' + getNumericMonthDec;
            } else if (getNumericMonthDec >= 10) {
                return getNumericMonthDec;
            }
        }
    }
    // Initialize Calendar
 
         var request = $.ajax({
         url : "/mypage/fullcalendar/list",
         type : "post",
         dataType : "JSON"
         });
         
         request.fail(function(jqXHR, textStatus){
             alert("오류발생!! : " + textStatus);
         });
 
         request.done(function(data){
 
         console.log("뭐가 나오냐 : " + JSON.stringify(data));
 
         var calendar = $('#calendar').fullCalendar({
             header: {
                 left: 'prev,next today',
                 center: 'title',
                 right: 'month,agendaWeek,agendaDay'
             },
             monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
              dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
             events: data,
             editable: true,
             eventLimit: true,
             locale:'kr',
             eventMouseover: function(event, jsEvent, view) {
                 $(this).attr('id', event.id);
                 $('#'+event.id).popover({
                     template: '<div class="popover popover-primary" role="tooltip"><div class="arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>',
                     title: event.title,
                     content: event.content,
                     placement: 'top',
                 });
                 $('#'+event.id).popover('show');
                 console.log("'#'+event.id" + '#'+event.id);
             },
             eventMouseout: function(event, jsEvent, view) {
                 $('#'+event.id).popover('hide');
             },
             eventClick: function(info) {
                console.log("info>>>" + info.event);
                console.log("start date>>>" + info.start);
				console.log("end date : " + info.end);
				console.log("no : " + info.no);
                 addEvent.style.display = 'none';
                 editEvent.style.display = 'block';
                 discard.innerText='삭제';
                 addEventTitle.style.display = 'none';
                 editEventTitle.style.display = 'block';
                 modal.style.display = "block";
                 document.getElementsByTagName('body')[0].style.overflow = 'hidden';
                 createBackdropElement();
                 // Calendar Event Featch
                 var eventTitle = info.title;
                 var eventDescription = info.content;
                 // Task Modal Input
                 var taskTitle = $('#write-e');
                 var taskTitleValue = taskTitle.val(eventTitle);
                 var taskdescription = $('#taskdescription');
                 var taskDescriptionValue = taskdescription.val(eventDescription);
                 var taskInputStarttDate = $("#start-date");
                 var taskInputStarttDateValue = taskInputStarttDate.val(info.start.format("YYYY-MM-DD HH:mm:ss"));
                 var taskInputEndDate = $("#end-date");
                 var taskInputEndtDateValue = taskInputEndDate.val(info.end.format("YYYY-MM-DD HH:mm:ss"));
                 var startDate = flatpickr(document.getElementById('start-date'), {
                     enableTime: true,
                     dateFormat: "Y-m-d H:i",
                     defaultDate: info.start.format("YYYY-MM-DD HH:mm:ss"),
                 });
                 var abv = startDate.config.onChange.push(function(selectedDates, dateStr, instance) {
                     var endtDate = flatpickr(document.getElementById('end-date'), {
                         enableTime: true,
                         dateFormat: "Y-m-d H:i",
                         minDate: dateStr
                     });
                 })
                 var endtDate = flatpickr(document.getElementById('end-date'), {
                     enableTime: true,
                     dateFormat: "Y-m-d H:i",
                     defaultDate: info.end.format("YYYY-MM-DD HH:mm:ss"),
                     minDate: info.start.format("YYYY-MM-DD HH:mm:ss")
                 });
                 
                 
//delete
                $('#discard').off('click').on('click', function(event) {
                        if(confirm("정말 삭제하시겠습니까?")){
                            var Object = {
                                calId : info.no
                            };

                            $.ajax({
                                url: "/mypage/fullcalendar/del",
                                type: "post",
                                data : Object,
                                dataType : "json",
                                success: function(result){
                                    console.log("삭제가 안돼? " ,result);
                                }
                            });
                                    alert("일정이 삭제 되었습니다.");
                           location.reload();
                           $('#calendar').fullCalendar('deleteEvent', info);
                     		modal.style.display = "none";
                     		modalResetData();
                     		document.getElementsByTagName('body')[0].removeAttribute('style');
                        }
                    });
                 
                 
                 
                 
                 
                 
                 
//update
                 $('#edit-event').off('click').on('click', function(event) {
                     event.preventDefault();
                     /* Act on the event */
                     var radioValue = $("input[name='marker']:checked").val();
                     var randomAlphaNumeric = randomString(10, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
                     var taskStartTimeValue = document.getElementById("start-date").value;
                     var taskEndTimeValue = document.getElementById("end-date").value;
                     info.title = taskTitle.val();
                     info.description = taskdescription.val();
                     info.start = taskStartTimeValue;
                     info.end = taskEndTimeValue;
                     info.className = radioValue;
                     
 console.log("수정된 타이틀 :  " + info.title);
 console.log("calId : " + info.no);
 console.log("수정된 시작 날짜 : " + taskStartTimeValue);
                     
                     var update = {
                        timeZone: 'UTC',
                        allDay : false,
                        id : randomAlphaNumeric,
                        label : radioValue,
                        calId : info.no,
                        calTitle:info.title,
                        calStart: taskStartTimeValue,
                        calEnd: taskEndTimeValue,
                        calContent: info.description
                    };
                    
console.log("수정된 정보들을 받아줄 수 있는가? : " + JSON.stringify(update));

					$.ajax({
                         url : "/mypage/fullcalendar/update",
                         type : "post",
                         data : JSON.stringify(update),
                         dataType : "text",
                         contentType: "application/json; charset=UTF-8",
                         success : function(data){
                             alert("일정이 수정 되었습니다.")
                             console.log(data);
                         },
                         error : function(data){
                            alert("일정 수정이 되지 않았습니다.");
                             }
                     });
                     
                     
console.log("업데이트부분 : " + JSON.stringify(update));
                    
                     $('#calendar').fullCalendar('updateEvent', info);
                     modal.style.display = "none";
                     modalResetData();
                     document.getElementsByTagName('body')[0].removeAttribute('style');
                     });
                  }
             })
         });
    function enableDatePicker() {
        var startDate = flatpickr(document.getElementById('start-date'), {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            minDate: new Date()
        });
        var abv = startDate.config.onChange.push(function(selectedDates, dateStr, instance) {
            var endtDate = flatpickr(document.getElementById('end-date'), {
                enableTime: true,
                dateFormat: "Y-m-d H:i",
                minDate: dateStr
            });
        })
        var endtDate = flatpickr(document.getElementById('end-date'), {
            enableTime: true,
            dateFormat: "Y-m-d H:i",
            minDate: new Date()
        });
    }
    function randomString(length, chars) {
        var result = '';
        for (var i = length; i > 0; --i) result += chars[Math.round(Math.random() * (chars.length - 1))];
        return result;
    }
 
 //insert 
    
     $("#add-e").off('click').on('click', function(event) {
      //alert("야 뜨냐?");
         var radioValue = $("input[name='marker']:checked").val();
         var randomAlphaNumeric = randomString(10, '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
         var inputValue = $("#write-e").val();                               
         var inputStarttDate = document.getElementById("start-date").value; 
         var inputEndDate = document.getElementById("end-date").value;       
         var arrayStartDate = inputStarttDate.split(' ');                    
         var arrayEndDate = inputEndDate.split(' ');                        
         var startDate = arrayStartDate[0];                                
         var startTime = arrayStartDate[1];                                
         var endDate = arrayEndDate[0];                                    
         var endTime = arrayEndDate[1];
         var concatenateStartDateTime = startDate+'T'+startTime+':00';
         var concatenateEndDateTime = endDate+'T'+endTime+':00';
         var inputDescription = document.getElementById("taskdescription").value;
         var myCalendar = $('#calendar');
         myCalendar.fullCalendar();
         var myEvent = {
             timeZone: 'UTC',
             allDay : false,
             label : radioValue,
             id : randomAlphaNumeric,
             calTitle:inputValue,
             calStart: inputStarttDate,
             calEnd: inputEndDate,
             calContent: inputDescription
         };
        //alert("인서트부분 : " + JSON.stringify(myEvent));
         console.log("인서트부분" + myEvent);
         
        $.ajax({
              type : "post",
              url : "/mypage/fullcalendar/insert",
              data :JSON.stringify(myEvent),
              dataType : "text",
              contentType: "application/json; charset=UTF-8",
              success : function(data){
                  console.log(data);
                  alert("일정이 등록되었습니다.");
              },
              error : function(data){
                  alert("일정 등록이 되지 않습니다.");
                  }
          });
         // modal.hide();
         location.reload();
         console.log("인서트부분2222" +JSON.stringify(myEvent));
         myCalendar.fullCalendar( 'renderEvent', myEvent, true );
         modal.style.display = "none";
         modalResetData();
         document.getElementsByTagName('body')[0].removeAttribute('style');
     });
     
 });
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 