<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Curso JSP</title>
</head>
<body>
		
	<form action="ServletLogin" method="post">
	
		<table>
			<tr>
				<td><label>Login:</label></td>
				<td><input name="login" type="text"></td>
			</tr>
			
			<tr>
				<td><label>Senha:</label></td>
				<td><input name="senha" type="password"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit" value="Enviar"></td>
			</tr>
		</table>
		
		
	</form>
	
	<h4>${msg}</h4>
</body>
</html>