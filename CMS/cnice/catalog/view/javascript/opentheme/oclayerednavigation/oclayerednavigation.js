$(document).ready(function () {
    oclayerednavigationajax.productViewChange();
    oclayerednavigationajax.changePositionAttributes();
});
var oclayerednavigationajax = {
    'filter': function (filter_url) {
        var old_route = 'route=product/category';
        var new_route = 'route=extension/module/oclayerednavigation/category';
        if (filter_url.search(old_route) != -1) {
            filter_url = filter_url.replace(old_route, new_route);
        }
        if (filter_url.search(new_route) != -1) {
            $.ajax({
                url: filter_url,
                type: 'get',
                beforeSend: function () {
                    $('.layered-navigation-block').show();
                    $('.ajax-loader').show();
                },
                success: function (json) {
                    $('.filter-url').val(json['filter_action']);
                    $('.price-url').val(json['price_action']);
                    $('.custom-category').html(json['result_html']);
                    $('.layered').html(json['layered_html']);
                    oclayerednavigationajax.paginationChangeAction();
                    oclayerednavigationajax.productViewChange();
                    oclayerednavigationajax.changePositionAttributes();
                    $('.layered-navigation-block').hide();
                    $('.ajax-loader').hide();
                }
            });
        }
    },
    'changePositionAttributes': function () {
        var category = $('.filter-categories');
        var remove = $('.filter-attribute-remove-container');
        category.prependTo('.layered .list-group');
        remove.prependTo('.layered .list-group');
    },
    'productViewChange': function () {
        $('#list-view').click(function () {
            $(this).addClass('selected');
            $('#grid-view').removeClass('selected');
            $('#content .product-grid > .clearfix').remove();
            $('#content .product-layout').attr('class', 'product-layout product-list clearfix');
            $('#content .product-list .col-image').addClass('col-sm-4 col-sms-4 col-smb-12');
            $('#content .product-list .col-des').addClass('col-sm-8 col-sms-8 col-smb-12');
            localStorage.setItem('display', 'list');
        });
        $('#grid-view').click(function () {
            $(this).addClass('selected');
            $('#list-view').removeClass('selected');
            cols = $('#column-right, #column-left').length;
            if (cols == 2) {
                $('#content .product-layout').attr('class', 'product-layout product-grid module-style1 col-md-6 col-sm-6 col-xs-6 two-items');
            } else if (cols == 1) {
                $('#content .product-layout').attr('class', 'product-layout product-grid module-style1 col-xlg-3 col-md-4 col-sm-6 col-xs-6 category');
            } else {
                $('#content .product-layout').attr('class', 'product-layout product-grid module-style1 col-md-3 col-sm-6 col-xs-6 four-items');
            }
            $('#content .product-grid .col-image').removeClass('col-sm-4 col-sms-4 col-smb-12');
            $('#content .product-grid .col-des').removeClass('col-sm-8 col-sms-8 col-smb-12');
            localStorage.setItem('display', 'grid');
        });
        if (localStorage.getItem('display') == 'list') {
            $('#list-view').trigger('click');
        } else {
            $('#grid-view').trigger('click');
        }
    }
};