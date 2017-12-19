$(document).ready(function () {
    var enable_status = $('#input-opc-status').val();
    if (enable_status == '1') {
        ocajaxlogin.changeEvent();
    }
});
$(document).ajaxComplete(function () {
    var enable_status = $('#input-opc-status').val();
    if (enable_status == '1') {
        ocajaxlogin.changeEvent();
    }
});
var ocajaxlogin = {
    'loginAction': function (email, password) {
        $.ajax({
            url: '',
            type: 'post',
            data: {
                email: email,
                password: password
            },
            dataType: 'json',
            beforeSend: function () {
                $('.ajax-load-img').show();
            },
            success: function (json) {
                if (json['success'] == true) {
                    if (json['enable_redirect']) {
                        location = json['redirect'];
                    } else {
                        $('.ul-account').load('');
                        $('#wishlist-total span').html(json['wishlist_total']);
                        $('#wishlist-total').attr('title', json['wishlist_total']);
                        $('#cart-total').html(json['cart_total']);
                        $('#cart > ul').load('');
                        $('body').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success_message'] + '<button type="button" class="close" data-dismiss="alert">×</button></div>');
                    }
                    ocajaxlogin.closeForm();
                    $('.ajax-load-img').hide();
                    $('.login-form-content .alert-danger').remove();
                } else {
                    $('.ajax-load-img').hide();
                    $('.login-form-content .alert-danger').remove();
                    $('#input-email').val('');
                    $('#input-password').val('');
                    $('.ajax-content .login-form-content').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error_warning'] + '<button type="button" class="close" data-dismiss="alert">×</button></div>');
                }
            }
        });
    },
    'registerAction': function () {
        $('.for-error').removeClass('text-danger').hide();
        $('.form-group').removeClass('has-error');
        $.ajax({
            url: '',
            type: 'post',
            data: $('#ajax-register-form').serialize(),
            dataType: 'json',
            beforeSend: function () {
                $('.ajax-load-img').show();
            },
            success: function (json) {
                $('.ajax-load-img').hide();
                if (json['success'] == true) {
                    ocajaxlogin.appendSuccess();
                } else {
                    if (json['error_warning'] != '') {
                        $('.error-warning span').html(" " + json['error_warning']);
                        $('.error-warning').show();
                    }
                    if (json['error_firstname'] != '') {
                        $('.error-firstname').addClass('text-danger').html(json['error_firstname']).show();
                    }
                    if (json['error_lastname'] != '') {
                        $('.error-lastname').addClass('text-danger').html(json['error_lastname']).show();
                    }
                    if (json['error_email'] != '') {
                        $('.error-email').addClass('text-danger').html(json['error_email']).show();
                    }
                    if (json['error_telephone'] != '') {
                        $('.error-telephone').addClass('text-danger').html(json['error_telephone']).show();
                    }
                    if (json['error_address'] != '') {
                        $('.error-address').addClass('text-danger').html(json['error_address']).show();
                    }
                    if (json['error_city'] != '') {
                        $('.error-city').addClass('text-danger').html(json['error_city']).show();
                    }
                    if (json['error_postcode'] != '') {
                        $('.error-postcode').addClass('text-danger').html(json['error_postcode']).show();
                    }
                    if (json['error_country'] != '') {
                        $('.error-country').addClass('text-danger').html(json['error_country']).show();
                    }
                    if (json['error_zone'] != '') {
                        $('.error-zone').addClass('text-danger').html(json['error_zone']).show();
                    }
                    if (json['error_custom_field'] != '') {
                        $('.error-custom').addClass('text-danger').html(json['error_custom_field']).show();
                    }
                    if (json['error_password'] != '') {
                        $('.error-password').addClass('text-danger').html(json['error_password']).show();
                    }
                    if (json['error_confirm'] != '') {
                        $('.error-confirm').addClass('text-danger').html(json['error_confirm']).show();
                    }
                    $('.text-danger').each(function () {
                        var element = $(this).parent().parent();
                        if (element.hasClass('form-group')) {
                            element.addClass('has-error');
                        }
                    });
                }
            }
        });
    },
    'logoutAction': function () {
        $.ajax({
            url: '',
            dataType: 'json',
            beforeSend: function () {
                $('#ajax-login-block').show();
                $('#ajax-loader').show();
            },
            success: function (json) {
                if (json['enable_redirect']) {
                    location = json['redirect'];
                } else {
                    $('.ul-account').load('');
                    $('#wishlist-total span').html(json['wishlist_total']);
                    $('#wishlist-total').attr('title', json['wishlist_total']);
                    $('#cart-total').html(json['cart_total']);
                    $('#cart > ul').load('');
                }
                $('#ajax-loader').hide();
                ocajaxlogin.appendLogoutSuccess();
            }
        });
    },
    'appendLoginForm': function () {
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
        $('.ajax-body-login').show();
        $('.ajax-body-login .account-register').hide('400');
        $('#ajax-login-block').show();
        $('.ajax-body-login .account-login').show('600');
        $('.ajax-body-login .account-changepass').hide('400');
        $('.ajax-body-login .account-forgotpass').hide('400');
    },
    'appendChangePassForm': function () {
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
        $('.ajax-body-login').show();
        $('.ajax-body-login .account-register').hide('400');
        $('#ajax-login-block').show();
        $('.ajax-body-login .account-login').hide('600');
        $('.ajax-body-login .account-changepass').show('800');
        $('.ajax-body-login .account-forgotpass').hide('600');
    },
    'appendForgotPassForm': function () {
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
        $('.ajax-body-login').show();
        $('.ajax-body-login .account-register').hide('400');
        $('#ajax-login-block').show();
        $('.ajax-body-login .account-login').hide('600');
        $('.ajax-body-login .account-changepass').hide('800');
        $('.ajax-body-login .account-forgotpass').show('800');
    },
    'appendRegisterForm': function () {
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
        $('.ajax-body-login').show();
        $('.ajax-body-login .account-login').hide('400');
        $('#ajax-login-block').show();
        $('.ajax-body-login .account-register').show('600');
        $('.ajax-body-login .account-changepass').hide('400');
        $('.ajax-body-login .account-forgotpass').hide('400');
    },
    'appendSuccess': function () {
        $('.ajax-body-login').show();
        $('.ajax-body-login .account-register').hide('400');
        $('.ajax-body-login .account-success').show('600');
    },
    'appendLogoutSuccess': function () {
        $('.ajax-body-login').show();
        $('.ajax-body-login .logout-success').show('600');
    },
    'resetLoginForm': function () {
        $('.login-form-content .alert-danger').remove();
        
    },
    'resetRegisterForm': function () {
        $('.for-error').removeClass('text-danger').hide();
        $('.form-group').removeClass('has-error');
        
    },
    'closeForm': function () {
        $('#ajax-login-block').hide();
        $('#ajax-loader').hide();
        $('.ajax-body-login .account-login').hide('400');
        $('.ajax-body-login .account-register').hide('400');
        $('.ajax-body-login .account-changepass').hide('400');
        $('.ajax-body-login .account-forgotpass').hide('400');
        $('.ajax-body-login .account-success').hide();
        $('.ajax-body-login .logout-success').hide();
        $('.ajax-body-login').hide();
        ocajaxlogin.resetLoginForm();
        ocajaxlogin.resetRegisterForm();
    },
    'changeEvent': function () {
        $('#ulregister').attr('href', 'javascript:void(0);').attr('onclick', 'ocajaxlogin.appendRegisterForm()');
        $('#ullogin').attr('href', 'javascript:void(0);').attr('onclick', 'ocajaxlogin.appendLoginForm()');
    }
};