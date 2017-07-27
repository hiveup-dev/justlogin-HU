$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
        allWells = $('.setup-content'),
        allNextBtn = $('.next-step');
    allPrevBtn = $('.prev-step');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-primary').addClass('btn-default');
            $item.addClass('btn-primary');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function(){
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        /* $(".form-group").removeClass("has-error");
         for(var i=0; i<curInputs.length; i++){
         if (!curInputs[i].validity.valid){
         isValid = false;
         $(curInputs[i]).closest(".form-group").addClass("has-error");
         }
         } */

        if (isValid)
            nextStepWizard.removeAttr('disabled').trigger('click');
    });

    allPrevBtn.click(function(){

        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            prevStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().prev().children("a");
        prevStepWizard.removeAttr('disabled').trigger('click');

    });

    $('div.setup-panel div a.btn-primary').trigger('click');
});


$(document).ready(function() {
    // var selection = $("#selection-1, #selection-2, #selection-3, #selection-4, #selection-5, #selection-6, #selection-7, #selection-8");
    // var confirmation = $("#confirmation");

    // selection.click(function() {
    //
    // });

    // confirmation.click(function() {
    //     if ($(this).is(":checked")) {
    //         $("#confirm-btn").removeAttr("disabled");
    //     } else {
    //         $("#confirm-btn").attr("disabled", "disabled");
    //     }
    // });

});

/*$('input[type=checkbox]').click(function (e) {

 e.stopPropagation();

 //process my data here
 });*/


/*
 $("div.selection").on("click",function(event) {
 var target = $(event.target);
 if (target.is('input:checkbox')) return;

 var checkbox = $(this).find("input[type='checkbox']");

 if( !checkbox.prop("checked") ){
 checkbox.prop("checked",true);
 } else {
 checkbox.prop("checked",false);
 }
 });

 $('input[type=checkbox]').click(function (e) {

 e.stopPropagation();

 //process my data here
 });

 */


/*
 $(".selection").each(function(index) {
 $(this).delay(400*index).fadeIn(300);
 });                   */

$(window).load(function() {
    $('#loading').hide();
});