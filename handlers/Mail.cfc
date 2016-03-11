component {
	property name='sessionStorage' inject='sessionStorage@cbstorages';
	property name='mailService' inject='MailService';
	
	// Runs before every action
	function preHandler( event, action, eventArguments ) {
		var prc = event.getCollection( private=true );
		
		// Exit event handlers
		prc.xeh = {}; 
		prc.xeh.conform = 'mail.connectform';
		prc.xeh.conformSave = 'mail.connectformSave';
		prc.xeh.msglist = 'mail.list';
		prc.xeh.msgdetail = 'mail.showmessage';
		
		// If they're on any action OTHER than the connection form and there isn't cached connection info...
		if(  arguments.action != 'connectform' && arguments.action != 'connectformSave' 
			&& !sessionStorage.exists( 'connectionInfo' ) ) {
			// Send them back to the connection form
			setnextEvent( prc.xeh.conform );
		}
				
	}
	
	// Default event, just redirects to list.
	function home( event, rc, prc ){
		setNextEvent( prc.xeh.msglist );
	}
	
	function connectform( event, rc, prc ){
		
		// default values
		rc.serverName = '';
		rc.serverPort = '110';
		rc.userName = '';
		rc.password = '';
		rc.msgsPerPage = '30';

		// Overwrite with stored values if they exist
		if( sessionStorage.exists( 'connectionInfo' ) ) {
			structAppend( rc, sessionStorage.getVar( 'connectionInfo' ) );
		}
	}
	
	function connectformSave( event, rc, prc ){
		// Collection relevant connection data from the request collection
		var connectionInfo = {
			serverName = rc.serverName,
			serverPort = rc.serverPort,
			userName = rc.userName,
			password = rc.password,
			msgsPerPage = rc.msgsPerPage
		};
		
		// Persist data in session
		sessionStorage.setVar( 'connectionInfo', connectionInfo );
		
		// Send them back to the connection form
		setnextEvent( prc.xeh.msglist );
		
		
	}
	
	function list( event, rc, prc ){
		// Param start to 1
		event.paramValue( 'start', 1 );
		
		// The view needs this for previous/next links
		prc.msgsPerPage = sessionStorage.getVar( 'connectionInfo' ).msgsPerPage;
		
		// Get E-mails
		prc.emails = mailService.getAllMessages( rc.start );			
		
	}	
	
	function showmessage( event, rc, prc ){
		
		// Get this message
		prc.thisMail = mailService.getMessage( rc.uid );
	
	}
	
}