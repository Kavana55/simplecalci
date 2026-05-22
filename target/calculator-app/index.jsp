<html>
<head>
<title>Simple Calculator</title>
</head>

<body style="font-family:Arial;text-align:center;margin-top:50px;">

<h1>Simple Calculator</h1>

<form method="post">
<input type="number" name="num1" placeholder="First Number" required>
<br><br>

<input type="number" name="num2" placeholder="Second Number" required>
<br><br>

<select name="operation">
<option value="add">Addition</option>
<option value="sub">Subtraction</option>
<option value="mul">Multiplication</option>
<option value="div">Division</option>
</select>

<br><br>

<input type="submit" value="Calculate">

</form>

<%
String result = "";

if(request.getMethod().equals("POST")) {

double n1 = Double.parseDouble(request.getParameter("num1"));
double n2 = Double.parseDouble(request.getParameter("num2"));

String op = request.getParameter("operation");

if(op.equals("add"))
result = "Result = " + (n1 + n2);

else if(op.equals("sub"))
result = "Result = " + (n1 - n2);

else if(op.equals("mul"))
result = "Result = " + (n1 * n2);

else if(op.equals("div"))
result = "Result = " + (n1 / n2);
}
%>

<h2><%= result %></h2>

</body>
</html>
