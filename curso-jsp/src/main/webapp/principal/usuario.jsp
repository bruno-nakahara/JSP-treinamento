<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 

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
                                                        <h4 class="sub-title">Formulário de cadastro</h4>
                                                        <form id="formUser" enctype="multipart/form-data" class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post">
                                                            
                                                            <input type="hidden" name="acao" id="acao" value="">
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="id" id="id" class="form-control" readonly="readonly" value="${modelLogin.id}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID:</label>
                                                            </div>
                                                            <div class="form-group form-default input-group mb-3">                                                                
															  <div class="input-group-prepend">
																  <c:if test="${ modelLogin.fotouser != '' && modelLogin.fotouser != null }">
																  		<a href="<%= request.getContextPath() %>/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
																  			<img id="fotoembase64" src="${modelLogin.fotouser }" style="width: 100px">
																  		</a>																  		
																  </c:if>	
																  <c:if test="${ modelLogin.fotouser == '' }">
																  		<img id="fotoembase64" src="assets/images/avatar-1.jpg" style="width: 100px">
																  </c:if>														    
															  </div>
															  <input type="file" id="fileFoto" name="fileFoto" accept="image/*" onchange="visualizarImg('fotoembase64', 'fileFoto')" class="form-control-file">
															    															
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
                                                                <select class="form-select form-control" name="perfil">
                                                                	<option disabled="disabled">[Selecione o Perfil]</option>
                                                                	<option value="ADMIN" <%                                                                 	
                                                                	ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                                                                                              	
                                                                	if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
                                                                		out.println(" ");
                                                                		out.println("selected=\"selected\"");
                                                                		out.println(" ");
                                                                	} %>>Admin</option>                                        
                                                                	<option value="SECRETARIA" <% 
																	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                                                                                                	
                                                                	if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
                                                                		out.println(" ");
                                                                		out.println("selected=\"selected\"");
                                                                		out.println(" ");
                                                                	}%>>Secretária</option>
                                                                	<option value="AUXILIAR" <% 
                                                                	modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                                	                                                                	
                                                                	if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
                                                                		out.println(" ");
                                                                		out.println("selected=\"selected\"");
                                                                		out.println(" ");
                                                                	}%>>Auxiliar</option>
                                                                </select>
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Perfil:</label>
                                                            </div> 
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" onblur="pesquisaCep()" name="cep" id="cep" class="form-control" required="required" value="${modelLogin.cep}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Cep:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="logradouro" id="logradouro" class="form-control" required="required" value="${modelLogin.logradouro}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Logradouro:</label>
                                                            </div> 
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="numero" id="numero" class="form-control" required="required" value="${modelLogin.numero}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Numero:</label>
                                                            </div>    
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="bairro" id="bairro" class="form-control" required="required" value="${modelLogin.bairro}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Bairro:</label>
                                                            </div>    
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="localidade" id="localidade" class="form-control" required="required" value="${modelLogin.localidade}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">localidade:</label>
                                                            </div>  
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="uf" id="uf" class="form-control" required="required" value="${modelLogin.uf}" autocomplete="off">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">UF:</label>
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
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                            	<input id="genero" name="sexo" type="radio" value="MASCULINO" <%
                                                            			modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                            	
		                                                            	if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
		                                                            		out.println(" ");
		                                                            		out.println("checked=\"checked\"");
		                                                            		out.println(" ");
		                                                            	}
                                                            	%>>Masculino</>
                                                            	<input id="genero" name="sexo" type="radio" value="FEMININO" <%
                                                            			modelLogin = (ModelLogin) request.getAttribute("modelLogin");
                                                            	
		                                                            	if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
		                                                            		out.println(" ");
		                                                            		out.println("checked=\"checked\"");
		                                                            		out.println(" ");
		                                                            	}
                                                            	%>>Feminino</>
																																
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
                                    	
                                    	<!-- Tabela de resultado de busca -->
										<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaresultadosview">
											  <thead>
											    <tr>
											      <th scope="col">ID</th>
											      <th scope="col">Nome</th>
											      <th scope="col">Ver</th>
											    </tr>
											  </thead>
											  <tbody>
											    <c:forEach items="${ modelLogins }" var="ml">
											    	<tr>
											    		<td><c:out value="${ ml.id }"></c:out></td>
											    		<td><c:out value="${ ml.nome }"></c:out></td>
											    		<td><a class="btn btn-success" type="button" href="<%= request.getContextPath() %>/ServletUsuarioController?acao=buscarEditar&id=${ ml.id }" >Ver</a></td>
											    		
											    	</tr>
											    </c:forEach>
											  </tbody>
											</table>			
										</div>
                                        
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
	        <h5 class="modal-title" id="exampleModalLabel">Pesquisa de usuário</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<!-- Input de busca -->
	        <div class="input-group mb-3">
			  <input type="text" class="form-control" id="nomeBusca" placeholder="Nome do usuário" aria-label="Pesquisar usuário" aria-describedby="basic-addon2">
			  <div class="input-group-append">
			    <button class="btn btn-success" type="button" onclick="buscarUsuario()">Buscar</button>
			  </div>
			</div>
			
			<!-- Tabela de resultado de busca -->
			<div style="height: 300px; overflow: scroll;">
				<table class="table" id="tabelaresultado">
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
	      </div>
	      <span id="totalResultados"></span>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	    
    <!-- Required Jquery -->
    <jsp:include page="javascriptfile.jsp"></jsp:include>
    
    <script type="text/javascript">

	    function limpa_formulário_cep() {
	        
	        $("#logradoro").val("");
	        $("#bairro").val("");
	        $("#localidade").val("");
	        $("#uf").val("");	   
	    }

	    function pesquisaCep() {
		    var cep = $('#cep').val();

		    $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
		    	if (!("erro" in dados)) {
		    		$("#cep").val(dados.cep);                    
                    $("#logradouro").val(dados.logradouro);
                    $("#bairro").val(dados.bairro);
                    $("#localidade").val(dados.localidade);
                    $("#uf").val(dados.uf);                    
                } 
                else {
                    //CEP pesquisado não foi encontrado.
                    limpa_formulário_cep();
                }   
			});
	    }

     	function visualizarImg(fotoembase64, filefoto) {
			const preview = document.getElementById(fotoembase64);
			const fileUser = document.getElementById(filefoto).files[0];
			const reader = new FileReader();

			reader.onloadend = function () {
				preview.src = reader.result;
			}

			if (fileUser) {
				reader.readAsDataURL(fileUser);
			} else {
				preview.src = '';
			}
        }

    	function verEditar(id) {
    		const urlAction = document.getElementById("formUser").action;

    		window.location.href = urlAction + '?acao=buscarEditar&id=' + id;
        }

	    function buscarUsuario() {
	    	 var nomeBusca = document.getElementById("nomeBusca").value;

	    	 if (nomeBusca != null && nomeBusca != "" && nomeBusca.trim() != "") {/* Validando os dados de entradas */
	    		 const urlAction = document.getElementById("formUser").action;
				
	    		 
	    		 $.ajax({
						method: "get",
						url: urlAction,
						data: "nomeBusca=" + nomeBusca + "&acao=buscarUserAjax",
						success: function (response) {
							const json = JSON.parse(response);
							
							$("#tabelaresultado > tbody > tr").remove();

							for(let p = 0; p< json.length; p++) {
								$("#tabelaresultado > tbody").append('<tr> <td>' + json[p].id + '</td> <td>' + json[p].nome + '</td> <td> <button onclick="verEditar(' + json[p].id + ')" type="button" class="btn btn-info" data-target="#infoUsuario">Ver</button> </td> </tr>');

							}
							document.getElementById("totalResultados").textContent = 'Resultados: ' + json.length;
						}
					
					}).fail(function(xhr, status, errorThrown) {
						
						alert("Erro ao buscar usuário por nome: " + xhr.responseText);
					});
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
					
					alert("Erro ao tentar deletar o usuário por id: " + xhr.responseText);
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
