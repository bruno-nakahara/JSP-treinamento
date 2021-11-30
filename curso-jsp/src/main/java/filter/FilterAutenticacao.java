package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/principal/*"})/* Intercepta todas as requisi��es que vierem do projeto ou mapeamento */
public class FilterAutenticacao implements Filter {

    
    public FilterAutenticacao() {
       
    }

	/* Encerra quando os servidores � parado */
    // Mata os processos de conex�o com banco
	public void destroy() {
		
	}

	/* Intercepta as requisi��es e respostas no sistema*/
	/* Tudo que fizer no sistema passa por aqui
	 * Valida��o de autentica��o
	 * Dar commt e rolback de transa��es do banco
	 * Validar e redirecionamento de p�ginas
	*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String usuarioLogado = (String) session.getAttribute("usuario");
		
		String urlParaAutenticar = req.getServletPath();// URL que est� sendo acessada
		
		/* Validar se est� logado sen�o redireciona para a tea de login */
		if (usuarioLogado == null && 
				!urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {// N�o est� logado
			
			RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
			request.setAttribute("msg", "Por favor realize o login!");
			redireciona.forward(request, response);
			return; /* Para a execu��o e redireciona para o login */
			
		} else {
			chain.doFilter(request, response);
		}

	}

	/* Inicia os processos ou recursos quando o servidor sobe o projeto */
	// Iniciar conex�o com banco
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
