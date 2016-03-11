component singleton {
	property name="attachmentPath" inject="coldbox:setting:attachmentPath";
	property name='sessionStorage' inject='sessionStorage@cbstorages';
	
	function getAllMessages( required numeric start	) {
		// Get connection Info
		var connectionInfo = sessionStorage.getVar( 'connectionInfo' );
		
		return new pop().getHeaderOnly(
			server = connectionInfo.serverName,
			username = connectionInfo.userName,
			password = connectionInfo.password,
			port = connectionInfo.serverPort,
			maxrows = connectionInfo.msgsPerPage,
			startrow = arguments.start
		);
	}
	
	function getMessage( required string uid ) {
		// Get connection Info
		var connectionInfo = sessionStorage.getVar( 'connectionInfo' );
				
		return new pop().getAll(
			server = connectionInfo.serverName,
			username = connectionInfo.userName,
			password = connectionInfo.password,
			port = connectionInfo.serverPort,
			uid = arguments.uid,
			attachmentpath = attachmentPath,
			generateuniquefilenames = true
		);
	}
	
}
