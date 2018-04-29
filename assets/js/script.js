jQuery(function ($) {
	$('.articles_desc, .articles_container, .article_details.full, .header, .article-page-title, .footer, .article_details.text, .pages_selector, .products_table_container').addClass('container');
	$('.articles_container .article_details.short').each(function () {
                var descText = $(this).find('.desc_short_news').text().split('\n');
		if (descText.length > 0) {
			var descHtml = '';
			for (var i = 0; i < descText.length; i++) {
				if (i != descText.length-1) {
					descHtml += descText[i]+' <br/>';
				} else {
					descHtml += descText[i];
				}
			}
			$(this).find('.desc_short_news').html(descHtml);
		}

	});
	$('.article_details.full .full_desc_news').append($('.article-share'));
	$('.article_details.full .full_desc_news').append($('.buy-pic-form'));

	$('.buy-pic-form .input_line:not(:last-child)').wrapAll('<div class="input_line-wrp" />');
	$('.buy-pic-form input[type="button"]').after('<a class="no-send" />');
	$('.input_line.button .inp_box_right').addClass('no-send-wrp');
	$('.no-send').on('click', function (e) {
		e.preventDefault();
		$('.input_line-wrp').slideDown();
		$('.input_line.button .inp_box_right').removeClass('no-send-wrp');
		$(this).remove();
		return false;
	});

	$('.slicknav_btn').on('click', function (e) {
		e.preventDefault();
		$('.header_menu_top').slideToggle();
	});

        $('.language-active').on('click', function () {
            $('.block_language').slideToggle();
        });

	$('.copyright').before('<div id="footer-social"><div class="footer-social-icons"><i class="fa fa-facebook"></i><i class="fa fa-instagram"></i><i class="fa fa-vk"></i><i class="fa fa-pinterest"></i><i class="fa fa-twitter"></i><i class="fa fa-heart"></i><i class="fa fa-google-plus"></i><i class="fa fa-tumblr"></i></div></div>');
	if ($('.social-widget-link').length) {
		$('#footer-social').prepend($('.social-widget-link'));
		$('.social-widget-link a').each(function () {
			$(this).append($('.footer-social-icons .fa-'+$(this).attr('id')));
		});
	}

	if ($('.header-contacts').length) {
		$('.top_menu').after($('.header-contacts'));
		$('.header-contacts').wrapInner('<div class="header-contacts-table"></div>');
		if ($('.header-contacts a').length > 2) {
			$('.header-contacts').addClass('header-contacts-big');
		}
	}
});