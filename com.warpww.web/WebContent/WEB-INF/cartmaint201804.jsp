<%@ include file="/htx/pagehead.html"%>
<fmt:setBundle basename="com.warpww.web.i18n.warp" />

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/htx/html.head.201804.html"%>
	    <title><fmt:message key="checkout.page_title" /></title>
	</head>
	<body>
		<header>
			<%@ include file="/htx/menu_201804.html"%>
		</header>
		<form action="cartmaint201804" method="post" id="shopping-cart">
			Shopping Cart Maintenance
			<div class="form-row" id="productDescription]">
				<fieldset>
					${displayCart}
				</fieldset>
			</div>	
			<section>
	          <h2>Choose Payment Type</h2>
		          <nav id="payment-methods">
		            <ul>
		              <li>
		              	<div class="warpRow">
		              		<div class="warpItem">
			                		<input type="radio" name="payment" id="payment-card" value="payment-card" checked>
			                </div>
			                <div class="warpItem">
			                		<label for="payment-card">Credit Card</label>
			                </div>
			                		<div class="warpItem">
			                <img src="imgx/pymt_logo_credit.jpg" alt="MasterCard, Visa, Discover, American Express" height="55" width="70">
			                </div>
		                </div>
		              </li>
		              <li>
		              	<div class="warpRow">
		              		<div class="warpItem">
		                			<input type="radio" name="payment" id="payment-ach" value="payment-ach">
		                		</div>
			                <div class="warpItem">
		                			<label for="payment-ach_credit_transfer">U.S. Bank Account</label>
		                		</div>
			                <div class="warpItem">	
		                			<img src="imgx/pymt_logo_ach.png" alt="MasterCard, Visa, Discover, American Express" height="55" width="70">
		                		</div>
		                	</div>
		              </li>
		              <li>
		              	<div class="warpRow">
			                <div class="warpItem">
				                <input type="radio" name="payment" id="payment-alipay" value="payment-alipay">
				       		</div>
			                <div class="warpItem">
				                <label for="payment-alipay">Alipay</label>
				            	</div>
			                <div class="warpItem">
				                <img src="imgx/pymt_logo_alipay.png" alt="MasterCard, Visa, Discover, American Express" height="100" width="135">
				            </div>
				        </div>
		              </li>
		            </ul>
		          </nav>
			</section>
			<button name="completePurchase" class="btn btn-primary" value="completePurchase">Complete Purchase</button>
			<button name="continueShopping" class="btn btn-primary" value="continueShopping">Continue Shopping</button>
		</form>
	    <footer>
	    		<%@ include file="/htx/footer_201804.html"%>
	    </footer>
	</body>
</html>