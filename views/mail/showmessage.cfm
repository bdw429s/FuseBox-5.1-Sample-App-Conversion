<cfoutput><a href="#event.buildLink( linkTo=prc.xeh.msglist, queryString="start=#rc.start#" )#"><-- Return to Message List</a></cfoutput>
<cfoutput query="prc.thisMail">
	<cfset txtBody = reReplace(prc.thisMail.textBody,"^\s*?","","all")>
	<cfset hBody = prc.thisMail.htmlBody>
	<p><strong>To:</strong> #htmlEditFormat(to)#</p>
	<p><strong>From:</strong> #htmlEditFormat(from)#</p>
	<p><strong>Subject:</strong> #htmlEditFormat(subject)#</p>
	<strong>Body:</strong>
		<cfif len(hBody)>
			<cfloop collection="#prc.thisMail.cids#" item="cid">
				<cfset str = prc.thisMail.cids[cid]>
				<cfset str = mid(str,2,len(str)-2)>
				<cfset hBody = replace(hBody,"cid:" & str,"attachments/" & cid,"all")>
			</cfloop>
			#trim(hBody)#
		<cfelse>
			<p class="messageBody">
				#txtBody#
			</p>
		</cfif>
</cfoutput>
