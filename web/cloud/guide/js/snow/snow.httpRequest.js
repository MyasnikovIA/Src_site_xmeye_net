


function newHttpRequest()
{
	if (window.XMLHttpRequest) 
		return new XMLHttpRequest();
    else if (window.ActiveXObject){
    	try {
    		return new ActiveXObject("Microsoft.XMLHTTP");
    	} catch(e) {
    		try {
    			return new ActiveXObject("Msxml2.XMLHTTP");	
    		} catch(e) {
    			;
    		}
    	}
    }
}

var HttpRequest = function(url, callback, error)
{
		var request = newHttpRequest();
		
		request.onreadystatechange = function(){
			if (this.readyState == 4)
			{
				if (this.status == 200)
				{
					alert("success");
					callback.call(this, this.responseText);
				}
				else
				{
					alert("error");
					//this.onerror.call(this, this.readyState, this.status);
				}
			}
			
		};

		request.open("GET", url, true);
		request.send(null);
};


HttpRequest.prototype.defaultError = function()
{
	alert("readyState: " + this.readyState + "; staus: " + this.status);
};

HttpRequest.prototype.defaultProgress = function()
{
	var pro = this;
	alert("progresss");
};
