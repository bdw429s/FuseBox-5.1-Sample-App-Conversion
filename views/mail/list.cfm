<cfoutput><a href="#event.buildLink( prc.xeh.conform )#">Return to Connect Form</a></cfoutput>
<cfform name="delMessages" enctype="multipart/form-data">
	<table>
		<tr class="header">
			<td colspan="2">
				Date
			</td>
			<td colspan="2">
				Subject
			</td>
			<td colspan="2">
				From
			</td>
			<td>
				To
			</td>
		</tr>
	<cfoutput query="prc.emails">
		<tr>
			<td nowrap="true">
				<cftry>
					#dateFormat(date,"mm/dd/yyyy")# #timeFormat(date,"hh:mm tt")#
					<cfcatch>#date#</cfcatch>
				</cftry>
			</td>
			<td>&nbsp;</td>
			<td>
				<a href="#event.buildLink( linkTo =prc.xeh.msgdetail, queryString="uid=#uid#&start=#rc.start#" )#">#subject#</a>
			</td>
			<td>&nbsp;</td>
			<td nowrap="true">
				#from#
			</td>
			<td>&nbsp;</td>
			<td nowrap="true">
				#left(to,50)#<cfif len(to) GT 50>...</cfif>
			</td>
		</tr>
	</cfoutput>
		<tr>
			<td colspan="3" align="left">
				<cfif rc.start GT 1>
					<cfoutput><a href="#event.buildLink( linkTo=prc.xeh.msglist, queryString="start=#rc.start-prc.msgsPerPage#" )#">&lt;-- Previous</a></cfoutput>
				<cfelse>
					&lt;-- Previous
				</cfif>
			</td>
			<td colspan="4" align="right">
				<cfoutput><a href="#event.buildLink( linkTo=prc.xeh.msglist, queryString="start=#rc.start+prc.msgsPerPage#" )#">Next --&gt;</a></cfoutput>
			</td>
		</tr>
	</table>
</cfform>