// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require justlogin/jquery.validate.min
//= require justlogin/additional-methods.min
//= require justlogin/jquery.checkbox
//= require justlogin/bootstrap.min
//= require justlogin/jquery.mousewheel.min
//= require justlogin/main
//= require_self

jQuery(function () {
    $('#employee-benefits').validate({
        rules: {
            fname: {
                minlength: 2,
                required: true
            },
            lname: {
                minlength: 2,
                required: true
            },
            email: {
                required: true,
                email: true
            },
            company: {
                minlength: 2,
                required: true
            }
        },
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.text('').addClass('.valid')
                .closest('.form-group').removeClass('has-error').addClass('has-success');
        }
    });


    if ($('input[type="checkbox"]:checked').length > 0) {
        $('#selection-btn').removeAttr('disabled');
    }

    $('.back-button').on('click', function () {
        window.history.back();
    });

    $('.compare-button').on('click', function () {
        var selectedProducts = [];
        $("input[type='checkbox'][id^='product-']:checked").each(function (i, e) {
            selectedProducts.push("product_ids[]=" + $(e).val());
        });
        window.location.href = ('/products/compare?' + selectedProducts.join('&'));
    })


});
