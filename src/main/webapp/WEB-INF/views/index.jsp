<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Proyect Demo 4</title>
<!-- En las vistas .jsp, se puede usar la siguiente directiva para construir las rutas a los recursos estáticos:
		 ${pageContext.request.contextPath} 
     
     En este proyecto se ha optado por indicarlas de forma estática, pero si cambia en las controladoras la ubicación lógica y relativas mapeadas, podrían producirse
     errores de acceso a los recursos (.js, .css) si no se actualizan manualmente.
-->
<link rel="stylesheet" href="./styles/index.css">

</head>
<body>
    <div class="cabecera">
        <div class="cab1"></div>
        <div class="cap2"></div>
    </div>
    <div class="cuerpo">
        <div class="panel1">
            <div class="nota"><div class="notacab1"><p>Proyecto</p></div>
                              <div class="notabody"><p style="text-align: center;"><span>#Spring Proyect Demo 4</span></p>
                            </div>
            </div>
            <div class="nota"><div class="notacab1"><p>Objetivos</p></div>
                              <div class="notabody"><p class="objetivos">- <b>C</b>aptura del evento de arranque de la aplicación. onStartup.</p>
                              						<p class="objetivos">- <b>C</b>aptura de los eventos de inicio y fin de la sesión de usuario. sessionCreated y sessionDestroyed.</p>   
                                                    <p class="objetivos">- <b>V</b>ariables en memoria de aplicación.</p>
                              </div>        
                            
            </div>
            <div class="nota"><div class="notacab2"><p>Entorno de Desarrollo</p></div>
                              <div class="notabody"><p><span>Ide:</span> Eclipse, versión: 2022-03 (4.23.0)</p>
                                                    <p><span>Servidor:</span> Apache Tomcat, versión: 9</p>
                                                    <p><span>Jdk:</span> OpenJdk, versión: 17.1</p>
                            </div>
            </div>
            <div class="nota"><div class="notacab2"><p>Estandar de Desarrollo</p></div>
                              <div class="notabody"><p><span>Gestor de proyecto:</span> Maven, versión: 3.8.0</p>
                                                    <p><span>Id Artefacto maven:</span> maven-archetype-webapp, versión: 1.4</p>
                                                    <p><span>Faceta:</span> Dynamic Web Module, versión: 4.0</p>
                            </div>
            </div> 
            <div class="nota"><div class="notacab2"><p>Dependencias</p></div>
                              <div class="notabody"><p><span>Spring Framework:</span> Spring, versión 5.3.22. Módulos: Spring Web MVC</p>
                                                    <p><span>Javax servlet:</span> versión: 4.0.1</p>
                            </div>
            </div>    
            <div class="nota"><div class="notacab2"><p>Documentación y Sitios de Interés</p></div>
                              <div class="notabody"><p><a href="https://mvnrepository.com/" target="_blank">Ir a</a> Maven Repository</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/" target="_blank">Leer</a> Documentación de Spring</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/5.3.5/reference/html/web.html" target="_blank">Leer</a> Documentación sobre DispatcherServlet</p>
                            </div>
            </div>         
        </div>
        <div class="panel2">
            <div class="item"><p><span>Análisis 1 - WebApplicationInitializer:</span> En este análisis, le proponemos que proceda a abrir el fichero ApplicationEvents.java, el cual sobrecarga el evento onStartup que permite capturar el evento de arranque de la aplicación. Este evento se ejecuta una sola vez, al iniciarse la aplicación con la primera petición detectada de un cliente.</p>
            				  <p>Es un lugar idoneo, para entre otras cosas, cargar datos en cache de la aplicación (ej: datos de tablas de mapeo que varian muy poco en base de datos con el fin de ganar eficiencia y velocidad) o tal como se le muestra en el proyecto SpringProyectDemo5 llevar a cabo la lectura de datos desde un fichero de configuración, entre múltiples necesidades posibles.</p>
            				  <p>Establesca un break-point en el método onStartup y proceda a ejecutar el proyecto en modo depuración para que compruebe como se desata tal evento.</p>
            </div>
            <div class="item"><p><span>Análisis 2 - HttpSessionListener:</span> En este análisis, le proponemos que proceda a abrir el fichero SessionEvents.java, el cual sobrecarga los eventos sessionCreated y sessionDestroyed. Estos métodos permiten capturar la creación de una nueva sesión (por cada cliente que accede a la aplicación) y capturar el fin de la sesión (cuando se sobrepasa el tiempo máximo de sesión sin actividad del cliente; session-timeout, ver fichero web.xml).</p>
            				  <p>Establesca un break-point en los métodos sessionCreated y sessionDestroyed y proceda a ejecutar el proyecto en modo depuración para que compruebe como se desata tales eventos. Observará que cada vez que se inicia una sesión nueva se desata sessionCreated. ¿Qué ocurre, si desde el mismo navegador, se vuelve a realizar una segunda petición a la aplicación? y ¿si se hace desde diferentes navegadores?</p>
            				  <p>El método sessionDestroyed, se desatará cuando haya transcurrido session-timeout (web.xml) sin actividad. Deberá esperar a que esto ocurra.</p>
            </div>
            <div class="item"><p><span>Análisis 3 - Variables de aplicación:</span> Si bién es verdad, que existen varias formas de hacer uso de la memoria de la aplicación o comunmente denominado variables de aplicación, debe tener en cuenta que cualquier dato que se asigne a un atributo estático que se implemente en cualquier clase, serán almacenados en la memoria de la aplicación.</p>
            				  <p>Es decir, hasta ahora, toda variables o atributo que se crea y no es estático o incluso el contenido de las variables de sesión (vistas en el proyecto SpringProyectDemo 2) son datos relativos al hilo de cada cliente. Sin embargo, cuando se crean atributos estáticos, los datos se almacenan en memoria de aplicación y pueden ser accedidos desde todos los hilos activos de los usuarios.</p>
            				  <p>Esto último, implica que hacer uso de la memoria de aplicación puede requerir llevar a cabo una correcta programación concurrente (control de escritura/lectura con synchronized o semaforos).</p>
            				  <p>En el fichero SessionEvents.java, puede observar como se ha creado un atributo estático de tipo entero denominado totalActiveSessions. En este ejemplo, lo que se hace es incrementar dicho contador que registra el número de sesiones activas en cada momento con el método sessionCreated mientras que al desatarse un fin de sesión, este contador se decrementa con el método sessionDestroyed. </p>
            				  <p>Actualmente el número de sesiones activas es: <b>${NumSesiones}</b>.</p>
							  <p>El evento sessionCreated en ocasiones se desata algo más darde de lo que tarda la controladora en devolver la petición al cliente, por ello, es normal que al arrancar el proyecto y cargar la vista index.jsp le aparezca un 0 en vez de un 1, pero si vuelve a refrescar, comprobará que el dato ya es correcto. Esto se debe a que el hilo del usuario se ejecuta independiente al hilo de la aplicación.</p>
            				  <p>NOTA: En el ejemplo descrito anteriormente, no se hace uso de una correcta programación concurrente (dos hilos podrían estar escribiendo simultaneamente).</p>
            </div>
        </div>
    </div>
    <div class="pie"><p><span>©</span> 2022 - Daniel Pérez Pérez</p></div>

</body>
</html>