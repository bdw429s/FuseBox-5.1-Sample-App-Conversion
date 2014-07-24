component extends='coldbox.system.ioc.config.Binder' {
	function configure() {
		
		// Use this to detect the CFML engine
		var CFMLEngine = new coldbox.system.core.util.CFMLEngine(); 
		
		// Railo uses a different script syntax
		if( CFMLEngine.getEngine() == CFMLEngine.RAILO ) {
			map( 'MailService' ).to( 'model.RailoMailService' );			
		} else {
			map( 'MailService' ).to( 'model.MailService' );			
		}
		
	}
}