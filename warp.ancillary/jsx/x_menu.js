/*
document.write('<div class="navbar navbar-inverse navbar-fixed-top">');
document.write('</div>');
*/
document.write('<div class="navbar navbar-inverse navbar-fixed-top">');
document.write('<% @include  file="/htx/LanguageSelector.html" %>');
document.write('        <div>');
document.write('                <form method="post">');
document.write('                    <select id="language" name="language" onchange="submit();">');
document.write('                        <option value="en" ${language == \'en\' ? \'selected\' : \'\'}>English</option>');
document.write('                        <option value="es" ${language == \'es\' ? \'selected\' : \'\'}>Español</option>');
document.write('                        <option value="zh" ${language == \'zh\' ? \'selected\' : \'\'}>Chinese</option>');
document.write('                    </select>');              
document.write('                </form>');
document.write('        </div>');
document.write('    <div class="container" role="navigation">');
document.write('        <div class="container" role="navigation">');
document.write('            <a href="Main.html" class="nav navbar-nav"><img src="imgx/logo3.png" title="WARP Worldwide, LLC" width="142" height="80" text-align="left" /></a>');
document.write('            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">');
document.write('                <span class="sr-only">Toggle navigation</span>');
document.write('                <span class="icon-bar"></span>');
document.write('                <span class="icon-bar"></span>');
document.write('                <span class="icon-bar"></span>');
document.write('            </button>');
document.write('        </div>');
document.write('        <div class="navbar-collapse collapse">');
document.write('            <ul class="nav navbar-nav">');
document.write('                <li><a href="mission">Mission</a></li>');
document.write('                <li><a href="solutions">Solutions</a></li>');
document.write('                <li><a href="about">About</a></li>');
document.write('                <li><a href="contact">Contact</a></li>');
document.write('            </ul>');
document.write('        </div>');


document.write('    </div>');
document.write('</div>');
