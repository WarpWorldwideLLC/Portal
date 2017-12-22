<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.warpww.web.filecounter.i18n.Contact" />

<!DOCTYPE html>
<html>
    <head>
    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jsx/header.js"></script>
        <title>About WARP</title>
    </head>
    
    <body>

        <script src="jsx/menu.js"></script>
          <br><br><br/>
        <script src="jsx/carousel.js"></script>

        <div class="row">
            <div class="col-md-3" style="width:90%">

                    <h2>Inside WARP Worldwide</h2>
                    <p>The technologists at WARP Worldwide have nearly 50 years of experience integrating new technologies, and new ways of thinking about technology, into successful businesses. And every new year we are more excited about the most recent developments and how they can change the world of business and the world itself.
                    <br/><br>
                    <div class="subnav">
                        <h3>OUR TEAM </h3>
                        <p>Learn more about our amazing team of professionals. </p>
                        <br>
                        
                        
                        <h3>Grace Wang Arp</h3>
                        <h4>President and Founder </h4>
                        <p>Grace has over 20 years of experience in International Higher Educational Institutes and leading large scale IT initiatives for Financial Services. She is a life-time learner and professional educator in both US and China, also a technology and business expert in the Payment industry on the Merchant Acquiring, e-Commerce Solutions, Card Payment, ACH solutions and Check Acceptance Solutions. She is a certified PMP (Project Management Professional), is a member of Project Management Institute. Her passion and energy are now focused on building a global business to bridge businesses between the US and China, helping expand business markets and build local Joint Venture opportunities.
                        </p>
                        <br>
                        
                        <h3>John Arp </h3>
                        <h4>Chief Executive Officer </h4>
                        <p>John has over 30 years of experience in Information Technology, Emerging Technologies, Payments, Financial Services, Product, Customer Relations and Operations management. He has managed, nurtured, and grown several businesses, business units and technology groups over the years, primarily focused on the of technology, back-office operations and optimization, customer relations in the financial services industry, spanning banking, credit cards, insurance, and payment processing in institutions ranging from large regional banks to global payment processors.
                        
                            John&#8217;s passion and energy are now focused on providing secure technology solutions, offering innovative technology transformation for global business.
                        </p>
                        <br>
                        
                    </div>
                   
            </div>
        </div>
        
        <div> 
            <hr />
            <footer>
                <p>&copy; WARP Worldwide, LLC</p>
            </footer>
        </div>
        <form>
            <select id="language" name="language" onchange="submit()">
                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
                <option value="zh" ${language == 'zh' ? 'selected' : ''}>Chinese</option>
            </select>
        </form>
        <script src="jsx/carousel_run.js"></script>
        
    </body>
</html>

