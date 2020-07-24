(function () {
$.fn.easycard = function (options) {
	var defaults = {
		wrapper: $(this),
		nameInput: '#name',
		numberInput: '#number',
		cvcInput: '#cvc',
		dateMonthInput: '#date-m',
		dateYearInput: '#date-y',
		cardWidth: '100%',
		backgroundCode: '#333',
		numberMask: true,
		defaultName: 'nome cognome',
		defaultNumber: '**** **** **** ****',
		defaultDate: 'MM / YY',
		defaultCvc: '***'
	};

	var options = $.extend(defaults, options);

	var ccWrapper = options.wrapper;
	var ccWidth = options.cardWidth;
	var ccBg = options.backgroundCode;
	var numberMask = options.numberMask;

	var card =  '<div class="cc">' +
	              '<div class="chip"><div class="mc"></div></div>' +
	              '<div class="logo"></div>' +
	              '<div class="number">' + options.defaultNumber + '</div>' +
	              '<div class="name">' + options.defaultName.toUpperCase() + '</div>' +
	              '<div class="date">' +
	                '<div class="left">VALID DATE</div>' +
	                '<div class="right">' +
	                  'MM / YY' +
	                  '<br><span>' + options.defaultDate + '</span>' +
	                '</div>'
	              '</div>' +
	            '</div>';

	var cardBack = '<div class="cc-back">' +
	                  '<div class="magnet"></div>' +
	                  '<div class="sign"></div>' +
	                  '<div class="cvc">' + options.defaultCvc + '</div>' +
	                  '<div class="chip"><div class="mc"></div></div>' +
	                  '<div class="copyright">jQuery easycard is implementable for all html forms easy to use made by onur altinsoy http://onuraltinsoy.com</div>' +
	               '</div>'

	ccWrapper.html(card);

	var cc = $('.cc');

	ccWrapper.append(cardBack);

	var cb = $('.cc-back');

	var ccHeight = cc.width() / 1.5;


	$('.cc, .cc-back').css({
	    'width': ccWidth,
	    'height': ccHeight,
	    'background': ccBg
	});

	cb.css({'marginTop': '-' + cb.height() + 'px'});

	cc.find('.number').css({
	    'fontSize': cc.width() / 15 + 'px'
	});

	cc.find('.name').css({
	    'fontSize': cc.width() / 22 + 'px'
	});

	cc.find('.date').css({
	    'fontSize': cc.width() / 42 + 'px'
	});

	cc.find('.date .right span').css({
	    'fontSize': cc.width() / 20 + 'px'
	});

	cb.find('.cvc').css({
	    'fontSize': cc.width() / 15 + 'px'
	});

	cb.find('.copyright').css({
	    'fontSize': cc.width() / 40 + 'px'
	});

	$(document).on('keyup change', options.nameInput, function () {
	    cc.find('.name').text($(this).val().toUpperCase());
	});

	$(document).on('keyup change', options.cvcInput, function () {
	    cb.find('.cvc').text($(this).val());
	});

	$(document).on('keyup change', options.numberInput, function () {
	    var number = $(this).val().replace(/\s/g, '');
	    if (number.slice(0, 2) === '34' || number.slice(0, 2) === '37') {
	        $('.cc, .cc-back').css({
	            'background': 'linear-gradient(135deg, rgba(255,162,0,1) 0%, rgba(251,255,120,1) 22%, rgba(255,162,0,1) 39%, rgba(255,162,0,1) 100%)'
	        });
	      $('.logo').css({
	        'background': 'url(https://images1.egifter.com/Images/themes/eGifter/2016/AmericanExpress.svg) no-repeat',
	        'backgroundSize': '100% auto'
	      }).show();
	    } else if (number[0] === '4') {
	      $('.cc, .cc-back').css({
	        'background': 'linear-gradient(135deg, rgba(55,146,179,1) 0%, rgba(131,197,219,1) 27%, rgba(55,146,179,1) 67%, rgba(55,146,179,1) 100%)'
	      });
	      $('.logo').css({
	        'background': 'url(http://pngimg.com/uploads/visa/visa_PNG4.png) no-repeat',
	        'backgroundSize': '100% auto'
	      }).show();
	    } else if ((parseInt(number.slice(0, 6)) >= 510000 && parseInt(number.slice(0, 6)) <= 559999) || (parseInt(number.slice(0, 6)) >= 222100 && parseInt(number.slice(0, 6)) <= 272099)) {
	          $('.cc, .cc-back').css({
	             'background': 'linear-gradient(135deg, rgba(191,13,48,1) 0%, rgba(255,84,121,1) 38%, rgba(191,13,48,1) 100%)'
	          });
	      $('.logo').css({
	        'background': 'url(https://vignette1.wikia.nocookie.net/logopedia/images/2/2a/Mastercard-logo.svg/revision/latest?cb=20170131035048) no-repeat',
	        'backgroundSize': '100% auto'
	      }).show();
	    } else {
	      $('.cc, .cc-back').css({
	        'background': ccBg
	      });
	      $('.logo').hide();
	    }
	    var formattedNumber = '';
	    for (var i=0; i<number.length; i++) {
	        var chr;
	        if (i === 3 || i === 7 || i === 11) {
	            chr = number[i] + ' ';
	        } else {
	            chr = number[i];
	        }
	        formattedNumber += chr;
	    }
	    if (numberMask) {
	      $(this).prop('maxlength', 19);
	      $(this).val(formattedNumber);
	    }
	      
	    cc.find('.number').text(formattedNumber);
	});

	$(document).on('keyup change', options.dateMonthInput + ',' + options.dateYearInput, function() {
	    var m = $(options.dateMonthInput).val();
	    var y = $(options.dateYearInput).val();
	  
	    cc.find('.date .right span').text(m + ' / ' + y);
	});

	$(document).on('focus', options.cvcInput, function () {
	    cc.css({'zIndex': -1});
	    cc.css({
	      'transform': 'rotateY(180deg)',
	      'transition': 'all .5s ease',
	      'boxShadow': '-5px 5px 6px 3px #ccc'
	    });
	  cb.css({
	      'transform': 'rotateY(0deg)',
	      'transition': 'all .5s ease'
	    });
	});
	$(document).on('focusout', options.cvcInput, function () {
	    cc.css({'zIndex': 1});
	    cc.css({
	      'transform': 'rotateY(0deg)',
	      'transition': 'all .5s ease',
	      'boxShadow': '5px 5px 6px 3px #ccc'
	    });
	    cb.css({
	      'transform': 'rotateY(180deg)',
	      'transition': 'all .5s ease'
	    });
	});
};
})(jQuery);
