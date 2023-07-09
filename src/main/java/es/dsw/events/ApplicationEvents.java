package es.dsw.events;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.springframework.web.WebApplicationInitializer;


/* EVENTO INICIO APLICACIÓN
 * 
 * Se captura el evento de arranque de aplicación. Para ello se implementa la interfaz WebApplicationInitializer y se sobrecarga el método
 * onStartup.
 * */
public class ApplicationEvents implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
	
		//Esta instrucción es a modo de ejemplo. Simplemente se está leyendo datos del servidor. En este punto puede aprovecharse para
		//cargar parámetros en memoria de aplicación que pudiera ser interesante (ej: cacheo de datos desde bd, contadores, colas de acceso, etc).
		@SuppressWarnings("unused")
		String ServerInfo = servletContext.getServerInfo();
	}
	
}
