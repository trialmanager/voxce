/* MIT (c) Juho Vepsalainen */
(function ($) {
    function ellipsis($elem, options) {
        var a = check('li', $elem, options);
        var b = check('dt', $elem, options);

        if(!(a || b)) {
            checkText($elem, options);
        }
    }

    function check(name, $elem, options) {
        var $elems = $(name, $elem);

        if($elems.length > options.visible) {
            var $slice = $elem.children().slice($($elems[options.visible]).index()).hide();

            $more(name, options.more, function() {
                if(options.showCb) {
                    options.showCb($slice);
                }
                else {
                    $slice.show();
                }
            }).appendTo($elem);
        }

        if($elems.length) {
            return true;
        }
    }

    function checkText($elem, options) {
        var sep = options.separator;
        var origText = $elem.text();
        var temp=$.trim(origText);
        var head=$elem.attr("head");
        var split = temp.split(sep);

        if(split.length > options.visible) {
            var text;
            if(options.atFront) text = split.slice(-options.visible);
            else text = split.slice(0, options.visible);

            $elem.text(text.join(sep));

            var $m = $more('span', options.more, function() {
            	
                if(options.showCb) {
                    options.showCb($elem, origText);
                }
                else {
                	$showMoreOnPopup(origText,$elem,head);
                }
            });
            
            if(options.atFront) $m.prependTo($elem);
            else $m.appendTo($elem);

            return true;
        }
    }
    
    
    function $showMoreOnPopup(text,$ele,h){
    	$("#popup").text(text);
    	$("#popup").dialog();
    }
    function $more(name, text, showCb) {
        var $m = $('<' + name + ' class="more" style="font-size:9px; font-weight:normal;">' + text +'</' + name + '>');

        $m.bind('click', function() {
            showCb();
        });

        return $m;
    }

    var defaults = {
        visible: 3,
        more: '&hellip;',
        separator: ' ',
        showCb: null,
        atFront: false
    };
    $.fn.ellipsis = function(options) {
        return this.each(function () {
            var $elem = $(this);
            var opts = $.extend({}, defaults, options);

            ellipsis($elem, opts);
        });
    };
    $.fn.ellipsis.options = defaults;
})(jQuery);
