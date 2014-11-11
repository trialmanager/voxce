/**
 *  jqUploader plugin for substituting all input type="file" into a RIA flash uploader
 *  @author: Alexandre Plennevaux (http://www.pixeline.be)
 *  @credits:  M. Alsup, author of jq-flash (i used his smart jq-flash jQuery plugin to adapt it to my needs.)
 *  @credits: Geoff Stearns, author of swfObject
 *  @version: 0.8
 *  come to the jquery side  !
 *
 *  This plugin substitutes all input type="file" into a richer flash upload field
 *  Demos can be found at: http://www.pixeline.be/test/jquery/jqUploader/
 *
 *  NOTE:  This plugin uses (and requires) swfobject.js for proper flash detection.  
 *         You must include swfobjects.js on any page that uses this plugin.
 *         @see http://blog.deconcept.com/swfobject/
 *
 *
 *
 *  Usage:
 *      $("input[@type='file']").jqUploader(); // replaces all inputs with attribute="file" with the flash uploader
 *
 *  Or using options:
 *      $("input[@type='file']").jqUploader({
 *          uploadScript: "script_handling_upload_via_flash.php",
	    afterScript:	"script_to_redirect_to_after_upload.php"
 *      });
 *
 *
**/
jQuery.fn.jqUploader = function(options) {
    if (typeof SWFObject == 'undefined')  return this; // fast fail (swfobjects.js required)

    return this.each(function(index) {
        var $this = jQuery(this);
	// disable form 
	var myUploadScript = $(this.form).attr("action");
	$(this.form).submit(function(){return false});
	$("input[@type='submit']",this.form).hide();
	// get form action attribute value as upload script, appending to it a variable telling the script that this is an upload only functionality
	var actionURL = $(this.form).attr("action");
	var prepender = (actionURL.lastIndexOf("?") != -1) ? "&": "?";
	actionURL = actionURL+prepender+'jqUploader=1';
	var cls = (this.className !='') ? this.className: 'jqUploader';

        var opts = jQuery.extend({
            width:            ((cls.match(/w:(\d+)/)||[])[1]) || 320, 
            height:           ((cls.match(/h:(\d+)/)||[])[1]) || 65, 
            version:          ((cls.match(/ver:(\d+)/)||[])[1]) || 8, // version 8 of flash player required to run jqUpload
            background:       ((cls.match(/bg:#?([0-9a-fA-F]+)/)||[])[1]) || 'FFF', // background color of flash file
            cls:              cls,
            src:              'jqUploader.swf',
	    uploadScript:     actionURL,
	    afterScript:      '', // if this is empty, jqUploader will replace the upload swf by a textfield
	    varName:	      $this.attr("name"),  //this holds the variable name of the file input field in your html form
	    allowedExt:	      'jpg|png|gif|pdf|zip', // allowed extensions
            params:           {},
            flashvars:        {},
            elementType:      'div',
	    barColor:		'0000CC'			  
        }, options || {});
		
		if(opts.afterScript==''){
			TerminateJQUploader = function(domContainer,filename,varname){
				$('#'+domContainer).empty().append('<input name="'+varname+'" type="text" id="'+varname+'" value="'+filename+'"/>');
				myForm = $('#'+domContainer).parents("form");
				$("input[@type='submit']",myForm).show();
				
			}
		}
		var containerId = $this.attr("id");
        // convert anchor to span/div/whatever...
        var $el = jQuery('<' + opts.elementType + ' id="'+containerId+'" class="' + opts.cls + '" style="width:'+opts.width+'px"></' + opts.elementType + '>');
        $this.after($el).remove();
        
        var so = new SWFObject(opts.src, 'movie_player-'+index, opts.width, opts.height, opts.version, '#'+opts.background);

        for (var p in opts.params){
            so.addParam(p, opts.params[p]);
		}
		so.addVariable('containerId', containerId);
		so.addVariable('uploadScript', opts.uploadScript);
		so.addVariable('afterScript', opts.afterScript);
		so.addVariable('allowedExt', opts.allowedExt);
		so.addVariable('varName', opts.varName);
		so.addVariable('barColor', opts.barColor);
        for (var fv in opts.flashvars){
            so.addVariable(fv, opts.flashvars[fv]);
		}
        so.write($el[0]);  
    });
}; 