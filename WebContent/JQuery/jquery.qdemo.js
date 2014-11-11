/* MIT (c) Juho Vepsalainen */
(function($) {
    $.fn.qdemo = function(opts) {
        var title = opts.title || '';
        var pluginName = opts.pluginName || '';
        var parentElement = opts.parentElement || '<div></div>';
        var inputCb = opts.inputCb || function(parent) {};
        
        // http://javascript.crockford.com/remedial.html
        function typeOf(value) {
            var s = typeof value;

            if (s === 'object') {
                if (value) {
                    if (value instanceof Array) {
                        s = 'array';
                    }
                } else {
                    s = 'null';
                }
            }

            return s;
        }

        function trim(str) {
            // http://blog.stevenlevithan.com/archives/faster-trim-javascript
            var str = str.replace(/^\s\s*/, '');
            var ws = /\s/;
            var i = str.length;

            while (ws.test(str.charAt(--i)));

            return str.slice(0, i + 1);
        }

        function camelcase(str) {
            var s = trim(str);

            return ( /\S[A-Z]/.test( s ) ) ?
                s.replace( /(.)([A-Z])/g, function(t,a,b) { return a + ' ' + b.toLowerCase(); } ) :
                s.replace( /( )([a-z])/g, function(t,a,b) { return b.toUpperCase(); } );
        };

        function capitalize(str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        };

        function isInt(value) {
            return !isNaN(parseInt(value));
        }

        function constructUI(options) {
            function textArea(name, id, value) {
                return '<label for="' + id + '">' + name + ': </label>' +
                    '<textarea id="' + id + '" name="' + name + '">' +
                    value + '</textarea>';
            }

            function textInput(name, id, value) {
                return input(name, id, value, 'text');
            }

            function checkboxInput(name, id, value) {
                return input(name, id, value, 'checkbox');
            }

            function input(name, id, value, type) {
                if (id == undefined) {
                    return '<input type="' + type + '" name="' + name +
                        '" value="' + value + '"></input>';
                }

                return '<label for="' + id + '">' + name + ': </label>' +
                    '<input type="' + type + '" id="' + id +
                    '" name="' + name + '"' +
                    '" value="' + value + '"></input>';
            }

            function legend(title) {
                return '<legend>' + title + '</legend>';
            }

            function format(str) {
                return capitalize(camelcase(str));
            }

            function _recursion(options, title) {
                var $ret = $('<fieldset id="' + title + '">');

                $ret.append(legend(format(title)));

                for (var optionName in options) {
                    var optionValue = options[optionName];

                    var types = {
                        "string": function() {
                            $ret.append(textInput(format(optionName),
                                optionName, optionValue));
                        },
                        "number": function() {this.string()},
                        "boolean": function() {
                            $ret.append(checkboxInput(format(optionName),
                                optionName, optionValue));

                            $ret.find('#' + optionName).attr('checked',
                                optionValue);
                        },
                        "array": function() {
                            var $fieldset = $('<fieldset id="' +
                                optionName + '">');

                            $fieldset.append(legend(format(optionName) +
                                textInput('arrayAmount', null,
                                optionValue.length)));

                            for (var i = 0; i < optionValue.length; i++) {
                                var optionItem = optionValue[i];
                                var itemName = optionName + '[]';

                                $fieldset.append(textInput(
                                    format(itemName), null, optionItem));
                            }

                            $ret.append($fieldset);
                        },
                        "object": function() {
                            var uiStructure = _recursion(optionValue,
                                optionName);

                            $ret.append(uiStructure);
                        },
                        "null": function() {}
                    }[typeOf(optionValue)]();
                }

                return $ret;
            }

            var $ret = _recursion(options, 'pluginOptions');
            $ret.prepend(textArea(format('parentElement'), 'parentElement', parentElement));

            return $ret;
        }

        function getSize(ob) {
            var size = 0;

            for (var e in ob) { size++; }

            return size;
        }

        function getPluginOptions() {
            var ret = {};

            function _recursion(parent, target) {
                $('#' + parent).children().each(function() {
                    if ($(this).is(':visible')) {
                        if ($(this).is('fieldset')) {
                            var newTarget;

                            if (target == undefined) {
                                if (!(this.id in ret)) {
                                    var foundArray = $(this).
                                        find('input[name=arrayAmount]').length;

                                    ret[this.id] = foundArray? []: {};
                                }

                                newTarget = ret[this.id];
                            }
                            else {
                                if (!(this.id in target)) {
                                    var foundArray = $(this).
                                        find('input[name=arrayAmount]').length;

                                    target[this.id] = foundArray? []: {};
                                }

                                newTarget = target[this.id];
                            }

                            _recursion(this.id, newTarget);
                        }

                        if ($(this).is('input')) {
                            var type = $(this).attr('type');
                            var value;

                            if (type == 'text') {
                                value = $(this).val();

                                if (isInt(value)) {
                                    value = parseInt(value);
                                }
                            }
                            else if (type == 'checkbox') {
                                value = $(this).attr('checked')? true: false;
                            }

                            if (this.id) {
                                if (target == undefined) {
                                    ret[this.id] = value;
                                }
                                else {
                                    target[this.id] = value;
                                }
                            }
                            else {
                                ret[parent].push(value);
                            }
                        }
                    }
                });
            }

            _recursion('pluginOptions');

            // parentElement is a special case, no need to pass that
            delete ret['parentElement'];

            return ret;
        }

        function constructCode(options) {
            var ret = '$(parent).' + pluginName + '(';

            function stringify(a) {
                if(typeOf(a) == 'string') {
                    return "'" + a + "'";
                }

                return a;
            }

            function _recursion(values) {
                var i = 0;
                var size = getSize(values);

                ret += '{';

                for (var name in values) {
                    var value = values[name];

                    if(name == 'parentElement') {
                        continue;
                    }

                    ret += name + ': ';
                    if (typeOf(value) == 'object') {
                        _recursion(value);
                    }
                    else if (typeOf(value) == 'array') {
                        ret += '[';

                        for (var j = 0; j < value.length; j++) {
                            var item = value[j];

                            ret += stringify(item);

                            // skip last ,
                            if (j < value.length - 1) {
                                ret += ', ';
                            }
                        }

                        ret += ']';
                    }
                    else {
                        ret += stringify(value);
                    }

                    // skip last ,
                    i++;
                    if (i < size) {
                        ret += ', ';
                    }
                }

                ret += '}';
            }

            _recursion(options);

            ret += ')';

            return ret;
        }

        // TODO: might want to add a cb for this
        $(this[0]).append('<form>' +
            '<fieldset><legend>' + title + '</legend>' +
            '<div id="options"></div></fieldset>' +
            '</form>' +
            '<h3>Code</h3>' +
            '<pre id="code"></pre>' +
            '<h3>Plugin</h3>' +
            '<div id="pluginContainer"></div>'
        );

        var options = $.fn[pluginName].options;
        var $uiStructure = constructUI(options);
        $('#options').append($uiStructure);

        $("input[name=arrayAmount]").change(function() {
            var amount = $(this).val();

            if (isInt(amount)) {
                var $fieldset = $(this).parent().parent('fieldset');
                var $inputs = $fieldset.children('input');
                var inputAmount = $inputs.length;

                $inputs.show();

                if (amount <= inputAmount) {
                    $fieldset.children('input:gt(' +
                        (amount - 1) + ')').hide();
                }
                else {
                    var amountOfMissingInputs = amount - inputAmount;

                    for (var i = 0; i < amountOfMissingInputs; i++) {
                        var input = $inputs[0].cloneNode();
                        input.value = '';

                        $fieldset.append(input);
                    }
                }
            }
        });

        $("input, #parentElement").live('change', function() {
            var pluginOptions = getPluginOptions();
            var code = constructCode(pluginOptions);

            $("#code").text(code);

            var parent = $('#parentElement').val();
            var $parentElement = $(parent).attr('id', 'plugin');
            $('#pluginContainer').children().remove();
            $('#pluginContainer').append($parentElement);
            $('#plugin')[pluginName](pluginOptions);

            inputCb(parent);
        }).change();
    };
})(jQuery);
