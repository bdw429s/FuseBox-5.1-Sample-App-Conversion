component extends='coldbox.system.ioc.config.Binder' {
	function configure() {
		
		// Use this to detect the CFML engine
		var CFMLEngine = new coldbox.system.core.util.CFMLEngine(); 
		
		// Railo uses a different script syntax
		if( CFMLEngine.getEngine() != CFMLEngine.ADOBE ) {
			// This will override the default MailService mappings
			map( 'MailService' ).to( 'models.RailoMailService' );		
		}
		
		// No "else" needed for Adobe CF. WireBox will simply "find" the 
		// "MailService" CFC in the "/model" folder automatically.
		
	}
}