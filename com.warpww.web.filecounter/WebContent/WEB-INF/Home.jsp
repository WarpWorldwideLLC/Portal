<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.filecounter.i18n.Home" />

<!DOCTYPE html>>
<html>
    <head>
        	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jsx/header.js"></script>
        <title>WARP - Mission</title>
    </head>

    <body>
        <script src="jsx/menu.js"></script>
        <br><br><br/>
        <script src="jsx/carousel.js"></script>
                <div class="row">
                    <div class="col-md-3" style="width:90%">
                                <br>
                                <h4><font size="5" color="red"> <i> "My heart is to create opportunities for children in the US and China to achieve at the highest level throughout their lives while embracing a global worldview." - Grace Wang Arp, President and Founder, WARP Worldwide </i> </font> </h4>
                                 <br/>
                                 <h3>WARP Worldwide works toward this goal by delivering world-class education solutions via cutting edge technology to the US and China. Our focus is on making the next generation the greatest generation.</h3>
                                 <br/>
                                 WARP serves world-class education and technology solutions by building long-term strategic  partnerships with schools, governments, test centers and companies. We offer Online American K12 curriculum and courses, test preps, international camps, student study abroad, English and Chinese cultural training for both US and Chinese companies and schools that want to expand mission abroad.
                                 <br/><br>
                                 We are a trustworthy qualified liaison and consulting company to help US and China business owners grow their business abroad; we help you to navigate complicated business process, increase efficiency, offer innovative technology solutions to the problems you and your customers face.
                                 <br/><br>
                                 Today, every business is a global business.  Let WARP help your business realize their global potential.
                                <br><br>
                                
                                <h3><font size="5" color="green">The 8 Principles</font></h3>
                                <br/>
                        <ul>
                                <li> Inspire people on Lifewide and Lifelong Learning commitment </li>
                                <li> Teach how to learn language and grow, not just memorize facts </li>
                                <li> Learn the culture and context of the language </li>
                                <li> Develop critical thinking and essential skills through the life </li>
                                <li> Develop a new way to approach life and education strategy </li>
                                <li> Build a global vision </li>
                                <li> Distinguish yourself in the marketplace </li>
                                <li> Train a new generation of business and community leaders </li>
                        </ul>
                    </div>
                    

                </div>
             
             <div>
                 <hr />
            <footer>
                <p><fmt:message key="copyright" /></p>
            </footer>
             </div>
                
        <script src="jsx/carousel_run.js"></script>
                

                
                
            </body>
</html>