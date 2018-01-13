<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.mission" />

<!DOCTYPE html>
<html>
    <head>
    		<%@ include file="/htx/head.html"%>
    </head>
	<body>
		<form>


                <div >
                    
                            <br>
                            <h4><font size="5" color="red"> <i><fmt:message key="mission.mission_statement" /> </i> </font> </h4>
                             <br/>
                             <h3><fmt:message key="mission.text1" /></h3>
                             <br/>
                             <fmt:message key="mission.text2" />
                             <br/><br>
                             <fmt:message key="mission.text3" />
                             <br/><br>
                             <fmt:message key="mission.text4" />
                            <br><br>
                            
                            <h3><font size="5" color="green"><fmt:message key="mission.8_principles" /></font></h3>
                            <br/>
                       <fmt:message key="mission.principle1" /> <br>
                       <fmt:message key="mission.principle2" /> <br>
                       <fmt:message key="mission.principle3" /> <br>
                       <fmt:message key="mission.principle4" /> <br>
                       <fmt:message key="mission.principle5" /> <br>
                       <fmt:message key="mission.principle6" /> <br>
                       <fmt:message key="mission.principle7" /> <br>
                       <fmt:message key="mission.principle8" /> <br>

<br><br>
              </div>
		</form>
		<footer>
        		<%@ include file="/htx/footer1.html"%>
        	</footer>
	</body>
</html>