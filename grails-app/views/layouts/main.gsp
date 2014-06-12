
<html>
    <head>
        <title>ETicket &raquo; <g:layoutTitle default="Welcome" /></title>
        <!-- <link rel="stylesheet" href="<g:createLinkTo dir='css' file='main.css'/>"/> -->
        <link rel="stylesheet" href="<g:createLinkTo dir='css' file='macna.css'/>"/>
        <g:layoutHead />
        <g:javascript library="application" />
        <nav:resources/>
    </head>
    <body class="yui-skin-sam">
        <div>
            <div id="hd">
                <a href="<g:createLinkTo dir="/"/>"><img id="logo" src="${createLinkTo(dir: 'images', file: 'headerlogo.png')}" alt="macna logo"/></a>
            </div>
            <div id="menu">
                  <nav:render group="tabs"/>
            </div>
            <div id="bd"><!-- start body -->
                <g:layoutBody/>
            </div>  <!-- end body -->
            <div id="ft">
                <div id="footerText">
                    MACNA - Happy Journey
                </div>
            </div>
        </div>
    </body>
</html>
