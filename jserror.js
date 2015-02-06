window.onerror = function(message, url, line, column, error){
	var blacklist = ["Script error.","'PAPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGXXPADDINGPADDINGX' is undefined","Expected ';'"];
	if(blacklist.indexOf(message) >= 0){return;} //Prevent external JS error reports.
	
	if (typeof jQuery === 'undefined') {
		var script = document.createElement('script');
		var i = 0;
		var errArgs = arguments;
		script.type = "text/javascript";
		script.src = "//code.jquery.com/jquery-1.11.2.min.js";
		document.getElementsByTagName('head')[0].appendChild(script);
		setTimeout(function wait(){ if(i++ > 50) return false; typeof jQuery !== 'undefined' ? onerror.apply(this, errArgs) : setTimeout(wait, 100); }, 100);
		return;
	}
	
	jQuery.ajax({
		url:'//webtron.net/Ajax.cfc'
		,type: 'POST'
		,data: {
			method:'JSError'
			,msg: message || 'undefined'
			,url: url || location.href
			,line: line || ''
			,column: column || ''
			,strace: (error && error.stack) || ""
			,hostname: location.hostname
		}
	});
}
