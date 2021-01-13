

function isMac(val)
{
	var macRule1 = /^[0-9a-fA-F]{12}$/;
	var macRule2 = /^[0-9a-fA-F]{16}$/;
	return (macRule1.exec(val) || macRule2.exec(val));
}
function isEMail()
{
	var emailRule= /^(?:\w+\.?)*\w+@(?:\w+\.?)*\w+$/;
	return emailRule.exec(val);
}
function isNumber(val)
{
	var reNum = /^[\d]{0,}$/;
	if (reNum.test(val))
		return true;
	return false;
}