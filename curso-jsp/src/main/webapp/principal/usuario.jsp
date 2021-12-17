<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

  <body>
  <!-- Pre-loader start -->
  <jsp:include page="theme-loader.jsp"></jsp:include>
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
          
          <jsp:include page="navbar.jsp"></jsp:include>

          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  
                  <jsp:include page="navbarmainmenu.jsp"></jsp:include>
                  
                  <div class="pcoded-content">
                      <!-- Page-header start -->
                      <jsp:include page="page-header.jsp"></jsp:include>
                      
                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">                                    	
                                    	<div class="row">
                                            <div class="col-sm-12">
                                                <!-- Basic Form Inputs card start -->
                                                <div class="card">
                                                    
                                                    <div class="card-block">
                                                        <h4 class="sub-title">Formul�rio de cadastro</h4>
                                                        <form id="formUser" class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post">
                                                            
                                                            <input type="hidden" name="acao" id="acao" value="">
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="id" id="id" class="form-control" readonly="readonly" value="${modelLogin.id}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" value="${modelLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="email" name="email" id="email" class="form-control" required="required" value="${modelLogin.email}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Email:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="login" id="login" class="form-control" required="required" value="${modelLogin.login}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" value="${modelLogin.senha}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Senha:</label>
                                                            </div>
                                                            
															<button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm();" >Novo</button>
															<button type="submit" class="btn btn-success waves-effect waves-light">Salvar</button>
            												<button type="button" class="btn btn-danger waves-effect waves-light" onclick="criarDeleteAjax()">Deletar</button>
            												<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalUsuario">Pesquisar</button>
	                                                        </form>
                                    				</div>
                                    				
                                    			</div>
                                    		</div>
                                    	</div>
                                    	
                                    	<span id="msg">${msg}</span>
                                        
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal -->
	<div class="modal fade" id="modalUsuario" tabindex="-1" role="dialog" aria-labelledby="modalUsuario" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Pesquisa de usu�rio</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<!-- Input de busca -->
	        <div class="input-group mb-3">
			  <input type="text" class="form-control" id="nomeBusca" placeholder="Nome do usu�rio" aria-label="Pesquisar usu�rio" aria-describedby="basic-addon2">
			  <div class="input-group-append">
			    <button class="btn btn-success" type="button" onclick="buscarUsuario()">Buscar</button>
			  </div>
			</div>
			
			<!-- Tabela de resultado de busca -->
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Nome</th>
			      <th scope="col">Ver</th>
			    </tr>
			  </thead>
			  <tbody>
			    
			  </tbody>
			</table>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	    
    <!-- Required Jquery -->
    <jsp:include page="javascriptfile.jsp"></jsp:include>
    
    <script type="text/javascript">

	    function buscarUsuario() {
	    	 var nomeBusca = document.getElementById("nomeBusca").value;

	    	 if (nomeBusca != null && nomeBusca != "" && nomeBusca.trim() != "") {/* Validando os dados de entradas */
				alert(nomeBusca);
		     }
		}

    	function criarDeleteAjax() {
			if (confirm("Deseja realmente exclir os dados?")) {
				const urlAction = document.getElementById("formUser").action;
				const idUser = document.getElementById("id").value;

				$.ajax({
					method: "get",
					url: urlAction,
					data: "id=" + idUser + "&acao=deletarAjax",
					success: function (response) {
						limparForm();
						document.getElementById("msg").textContent = response;
					}
				
				}).fail(function(xhr, status, errorThrown) {
					
					alert("Erro ao tentar deletar o usu�rio por id: " + xhr.responseText);
				});
					
			}
		}

		function limparForm() {
			const elementos = document.getElementById("formUser").elements;/* Retorna elementos html dentro do form */

			for (let p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}

		function criarDelete() {
			if (confirm("Deseja realmente exclir os dados?")) {
				
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("formUser").submit();
			}
	
		}
    </script>
</body>

</html>
