
/* Autocomplete */
$.widget("ui.customcomplete", $.ui.autocomplete, {
	options: {
		extraParams: {}
	},

	_search: function(value) {
		var data = $.extend({}, this.options.extraParams, this.element.data("params.customcomplete"), {term: value});
		this.pending++;
		this.element.addClass("ui-autocomplete-loading");

		this.source(data, this.response);
	},

	_change: function( event ) {
		if ( this.previous !== this.element.val() ) {
			this.element.data("item.customcomplete", this.selectedItem);
			this._trigger( "change", event, { item: this.selectedItem } );
		}
	}
});

$(function(){
	$(".mf-autocomplete").one("focus", function() {
		$(this).customcomplete({
			source: $(this).data("source")
		});
	});
});