component {

	function configure(){
	
		coldbox = {
			appName 				= "getMyMail",
			reinitPassword			= "",
			defaultEvent			= "mail.home",
			handlersIndexAutoReload	= true,
			debugMode				= true
		};
		
		settings = {
			attachmentPath = expandPath('/attachments/')
		};
	}

}