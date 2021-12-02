package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "admin";
	private static Connection connection = null;
	
	public static Connection getConnection() {
		return connection;
	}
	
	static {//Quando chamar a classe SingleConnectionBanco de qualquer lugar vai conectar
		conectar();
	}
	
	public SingleConnectionBanco() {//Quando instanciar vai conectar
		conectar();
	}
	
	private static void conectar() {
		try {
			
			if (connection == null) {
				Class.forName("org.postgresql.Driver");//Carregar driver de conexão do banco
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false);//Mostrar qualquer erro no momento de conectar
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
