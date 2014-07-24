<cfform name="getMailParameters" action="#event.buildLink( prc.xeh.conformSave )#" method="post" enctype="multipart/form-data">
	<p><label for="serverName">Server Name: <cfinput name="serverName" id="serverName" type="text" required="true" size="50" maxlength="50" value="#rc.serverName#" /></label></p>
	<p><label for="serverPort">Server Port: <cfinput name="serverPort" id="serverPort" type="text" required="true" size="4" maxlength="4" value="#rc.serverPort#" /></label></p>
	<p><label for="userName">User Name: <cfinput name="userName" id="userName" type="text" required="true" size="50" maxlength="50" value="#rc.userName#" /></label></p>
	<p><label for="password">Password: <cfinput name="password" id="password" type="password" required="true" size="50" maxlength="50" value="#rc.passWord#" /></label></p>
	<p><label for="msgsPerPage">Messages Per Page: <cfinput name="msgsPerPage" id="msgsPerPage" type="text" required="true" size="4" maxlength="3" value="#rc.msgsPerPage#" /></label></p>
	<p><input name="setupMailserverInfo" type="submit" value="Check My Mail" id="setupMailserverInfo" /></p>
</cfform>