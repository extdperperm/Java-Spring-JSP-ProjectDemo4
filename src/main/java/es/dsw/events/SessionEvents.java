package es.dsw.events;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Component;

/* EVENTOS DE CREACIÓN Y DESTRUCCIÓN DE SESIONES
 * 
 * Para poder capturar el evento de sessionCreated o sessionDestroyed para cada cliente, es necesario implementar la interfaz HttpSessionListener. 
 * Debes tener en cuenta que para que esto funcione, en el web.xml debes agregar el Listener org.springframework.web.context.ContextLoaderListener.
 */
@Component
@WebListener
public class SessionEvents implements HttpSessionListener {
	
	private static int totalActiveSessions = 0;
    
    public static int getTotalActiveSession(){
        return totalActiveSessions;
    }
    
	
	 @Override
	 public void sessionCreated(HttpSessionEvent arg0) {
		     
	         totalActiveSessions++;
	 }
	 
	 @Override
	 public void sessionDestroyed(HttpSessionEvent arg0) {
	           totalActiveSessions--;
	 }	
}
