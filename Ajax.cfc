<cfcomponent displayname="Ajax" hint="Global Ajax Handling" output="no">
    <cffunction name="JSError" access="remote" returntype="void" output="no">
        <cfargument name="msg" required="yes">
        <cfargument name="url" required="yes">
        <cfargument name="line" required="yes">
        <cfset var attachDebug = "">
        
        <cfsavecontent variable="attachDebug">
            <!--- <cfdump var="#getPageContext().getBuiltInScopes()#" label="All The Things"> --->
            <cfdump var="#session#" label="session">
        </cfsavecontent>
        <cfmail from="jserrors@foomail.com" to="jserrors@foomail.com" subject="#cgi.SERVER_NAME# - IP: #cgi.REMOTE_ADDR# - #msg#" type="HTML">
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
                    <td>RemoteAddress</td>
                    <td>#cgi.REMOTE_ADDR#</td>
                </tr>
                <tr>
                    <td>Browser</td>
                    <td>#cgi.HTTP_USER_AGENT#</td>
                </tr>
            </table>
            </cfoutput>
            
            <cfmailparam file="debug.htm" content="#attachDebug#" type="html">			
        </cfmail>	
        
    </cffunction>
</cfcomponent>
