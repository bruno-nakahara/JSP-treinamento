<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<title>Curso JSP</title>
	
	<style type="text/css">
		form {
			position: absolute;
			top: 40%;
			left: 33%;
			right: 33%;
		}
		
		h3 { 
			position: absolute;
			left: 33%;
			top: 25%;
			width: 33%;
		}
		
		.msg {
			position: absolute;
			left: 33%;
			top: 70%;
			color: red;
			font-size: 14px;
		}
	</style>
</head>
<body>
	<h3>Bem vindo ao treinamento de JSP com Bootstrap</h3>
	
	<form action="ServletLogin" method="post" class="row g-3 needs-validation" novalidate>
	
		<input type="hidden" value="<%= request.getParameter("url") %>" name="url">
		
		
		<div class="mb-3">
			<label class="form-label" for="login">Login:</label>
			<input name="login" id="login" type="text" class="form-control" required>
			<div class="invalid-feedback">
		        Informe o login.
		    </div>
		    <div class="valid-feedback">
		        Show
		    </div>
		</div>
		
		<div class="mb-3">
			<label class="form-label" for="senha">Senha:</label>
			<input name="senha" id="senha" type="password" class="form-control" required>
			<div class="invalid-feedback">
		        Informe a senha.
		    </div>
		    <div class="valid-feedback">
		        Show
		    </div>
		</div>
			
	
		<input type="submit" value="Acessar" class="btn btn-primary">
	
	</form>

	<h4 class="msg">${msg}</h4>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function () {
		  'use strict'
	
		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  var forms = document.querySelectorAll('.needs-validation')
	
		  // Loop over them and prevent submission
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		        if (!form.checkValidity()) {
		          event.preventDefault()
		          event.stopPropagation()
		        }
	
		        form.classList.add('was-validated')
		      }, false)
		    })
		})()
	</script>
</body>
</html>