<cfcomponent name="Ajax" hint="Global Webservices" output="no">
	<cfsetting showdebugoutput="false">
	<cfheader name="Access-Control-Allow-Origin" value="*">
	<cffunction name="JSError" access="remote" returntype="void" output="no">
		<cfargument name="msg" required="yes">
		<cfargument name="url" required="yes">
		<cfargument name="line" required="yes">
		<cfargument name="column" required="yes">
		<cfargument name="strace" required="yes">
		<cfargument name="hostname" required="yes">

		<cfmail from="jserrors@foomail.com" to="jserrors@foomail.com" subject="#arguments.hostname# - IP: #cgi.REMOTE_ADDR# - #arguments.msg#" type="HTML">
			<cfoutput>
			<table>
				<tr>
					<td>Referrer</td>
					<td>#cgi.HTTP_REFERER#</td>
				</tr>
				<tr>
					<td>Date</td>
					<td>
						#DateFormat(Now(), "yyyy-mm-dd")# #TimeFormat(Now(), "HH:mm:ss")#
					</td>
				</tr>								
				<tr>
					<td>Message</td>
					<td>#arguments.msg#</td>
				</tr>
				<tr>
					<td>JS</td>
					<td>#arguments.url#</td>
				</tr>
				<tr>
					<td>Line</td>
					<td>#arguments.line#</td>
				</tr>
				<tr>
					<td>Column</td>
					<td>#arguments.column#</td>
				</tr>
				<tr>
					<td>RemoteAddress</td>
					<td>#cgi.REMOTE_ADDR#</td>
				</tr>
				<tr>
					<td>Browser</td>
					<td>#cgi.HTTP_USER_AGENT#</td>
				</tr>
				<tr>
					<td>Trace</td>
					<td><pre style="font-size:12px;">#arguments.strace#</pre></td>
				</tr>
			</table>
			</cfoutput>		
		</cfmail>	
		
	</cffunction>
</cfcomponent>
