/*!
 * warp_util v1.0.0 
 * WARP Utility Functions
 * 
 */


function toggleHide(targetElement)
{

	var att = document.getElementById(targetElement).getAttribute('type');

	if(att == 'password')
		{
			document.getElementById(targetElement).setAttribute('type', 'text');
		}
	else 
		{
		document.getElementById(targetElement).setAttribute('type', 'password');
		}
}


function toggleHide2(inputValue1, inputValue2)
{
	toggleHide(inputValue1);
	toggleHide(inputValue2);
}

