<html>
	<head>
		<title>DataMapper Example</title>
		<base href="<cfoutput>#iif( CGI.HTTPS eq "on", de("https"), de("http") ) & "://" & CGI.HTTP_HOST & getDirectoryFromPath( CGI.SCRIPT_NAME )#</cfoutput>" />
	</head>
	<body>
		<div class="wrap">
			<div class="page">
				<cfoutput>#body#</cfoutput>
			</div>
			<div class="footer">
				<a href="http://fw1.riaforge.org/">FW/1</a> is copyright (c) 2009-2015 Sean Corfield, Marcin Szczepanski, Ryan Cogswell - 
				<a href="http://www.apache.org/licenses/LICENSE-2.0">Licensed under the Apache License, Version 2.0</a><br />
				Logo by Kevan Stannard - You are running FW/1 version <cfoutput>#variables.framework.version#</cfoutput>.
			</div>
		</div>
	</body>
</html>