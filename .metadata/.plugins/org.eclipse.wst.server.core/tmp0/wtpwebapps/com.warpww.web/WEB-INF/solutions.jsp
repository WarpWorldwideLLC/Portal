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
        <!-- no carousel because of the product blueprint
        <script src="jsx/carousel.js"></script>
         -->
        <div class="row">
            <div class="col-md-3" style="width:90%">
                
                   <br><br><br/>
                <!--   <font color="green"> <h2>Reach for the Stars with WARP</h2>  -->
                    <br>
                    <img src="imgx/Warp_Reach_for_the_stars_Product_Blueprint.png" align="middle" alt="Reach for the Stars with WARP" width="1100" height="680" />
                    <br><br><br/>
                    WARP Lifewide and Lifelong Learning and Development product strategy covers all ages audience by providing one place for everything&#8217;s experience. It offers  a diverse portfolio of products and lifelong map, from pre-kindergarten through elementary school, middle school, high school, college and into adulthood for continuous education.
                    <br><br/>
                    The strategy expresses WARP&#8217;s core principles through committed lifetime learning, inspiring students achieve at their highest level throughout their lives. Our goal is to serve as the trusted lifelong partners of Chinese customers, nurture and engage generation and their next generation.

                    <br><br/>
                    Our Life Time Learning Model from elementary school to high school, college and graduate students, employees build a development path for students growing and reaching for the stars. The focus is not only improving the students&#8217; test scores. The most important thing is to help individuals build competitive skills to be the real winner in their life. Our solutions cover from analytical and creative thinking, digital transformation, adaptability and global perspective skills development.
                    <br><br/>
                    We are a trustworthy qualified liaison and consulting company to help US and China business owners grow their business abroad; we help you to navigate complicated business process, increase efficiency, offer innovative technology solutions to the problems you and your customers face.
                    <br><br/>
                   
                   The technologists at WARP Worldwide offer new, innovative solutions for your schools, business, implement Cloud migration by using Alibaba Cloud, Tencent Cloud or Amazon Cloud, platform and design thinking, technology transformation, and more. Let us help your business become a global technology leader!
                   <br/><br>
              
                   <!--
                    <h2>WARP Secure Messaging Solution</h2>
                    <br>
                    WARP Secure Messaging Solution prioritizes emails, gets rid of junk, aggregates robust communication via email, Facebook, Twitter, WeChat and any other social media accounts. It helps to increases business efficiency.
                    <br/><br><br>
                    </h2>
                   
                   <font color="blue"> <h2>WARP Business and Technology Consulting Solutions</h2>
                    <br>
                    The technologists at WARP Worldwide offer new, innovative solutions for your schools, business, implement Cloud migration by using Alibaba Cloud, Tencent Cloud or Amazon Cloud, platform and design thinking, technology transformation, and more. Let us help your business become a global technology leader!
                    <br/><br><br></font>
                  
                  -->
                    
               
            </div>
        </div>
        
        <div>
            <hr />
            <footer>
                <p>&copy; 2016-17 - WARP Worldwide, LLC</p>
            </footer>
        </div>
        
        <script src="jsx/carousel_run.js"></script>

</body>
</html>