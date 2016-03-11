component {

	function configure(){
	
		coldbox = {
			appName 				= "getMyMail",
			reinitPassword			= "",
			defaultEvent			= "mail.home",
			handlersIndexAutoReload	= true,
			debugMode				= true,
			customErrorTemplate		= '/coldbox/system/includes/BugReport.cfm'
		};
		
		settings = {
			attachmentPath = expandPath('/attachments/')
		};
	}

}