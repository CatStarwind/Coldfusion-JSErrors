window.onerror = function(message, url, linenumber){
	if(message === "Script error."){return;} //Prevent external JS error reports.
	jQuery.ajax({
		url:'Ajax.cfc'
		,type: 'POST'
		,traditional: true
		,data: {method:'JSError', msg:message || 'undefined', url:url || location.href, line:linenumber || ''}
	});
};
