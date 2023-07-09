<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spring Proyect Demo 4</title>
<!-- En las vistas .jsp, se puede usar la siguiente directiva para construir las rutas a los recursos est�ticos:
		 ${pageContext.request.contextPath} 
     
     En este proyecto se ha optado por indicarlas de forma est�tica, pero si cambia en las controladoras la ubicaci�n l�gica y relativas mapeadas, podr�an producirse
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
                              <div class="notabody"><p class="objetivos">- <b>C</b>aptura del evento de arranque de la aplicaci�n. onStartup.</p>
                              						<p class="objetivos">- <b>C</b>aptura de los eventos de inicio y fin de la sesi�n de usuario. sessionCreated y sessionDestroyed.</p>   
                                                    <p class="objetivos">- <b>V</b>ariables en memoria de aplicaci�n.</p>
                              </div>        
                            
            </div>
            <div class="nota"><div class="notacab2"><p>Entorno de Desarrollo</p></div>
                              <div class="notabody"><p><span>Ide:</span> Eclipse, versi�n: 2022-03 (4.23.0)</p>
                                                    <p><span>Servidor:</span> Apache Tomcat, versi�n: 9</p>
                                                    <p><span>Jdk:</span> OpenJdk, versi�n: 17.1</p>
                            </div>
            </div>
            <div class="nota"><div class="notacab2"><p>Estandar de Desarrollo</p></div>
                              <div class="notabody"><p><span>Gestor de proyecto:</span> Maven, versi�n: 3.8.0</p>
                                                    <p><span>Id Artefacto maven:</span> maven-archetype-webapp, versi�n: 1.4</p>
                                                    <p><span>Faceta:</span> Dynamic Web Module, versi�n: 4.0</p>
                            </div>
            </div> 
            <div class="nota"><div class="notacab2"><p>Dependencias</p></div>
                              <div class="notabody"><p><span>Spring Framework:</span> Spring, versi�n 5.3.22. M�dulos: Spring Web MVC</p>
                                                    <p><span>Javax servlet:</span> versi�n: 4.0.1</p>
                            </div>
            </div>    
            <div class="nota"><div class="notacab2"><p>Documentaci�n y Sitios de Inter�s</p></div>
                              <div class="notabody"><p><a href="https://mvnrepository.com/" target="_blank">Ir a</a> Maven Repository</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/current/reference/html/" target="_blank">Leer</a> Documentaci�n de Spring</p>
                                                    <p><a href="https://docs.spring.io/spring-framework/docs/5.3.5/reference/html/web.html" target="_blank">Leer</a> Documentaci�n sobre DispatcherServlet</p>
                            </div>
            </div>         
        </div>
        <div class="panel2">
            <div class="item"><p><span>An�lisis 1 - WebApplicationInitializer:</span> En este an�lisis, le proponemos que proceda a abrir el fichero ApplicationEvents.java, el cual sobrecarga el evento onStartup que permite capturar el evento de arranque de la aplicaci�n. Este evento se ejecuta una sola vez, al iniciarse la aplicaci�n con la primera petici�n detectada de un cliente.</p>
            				  <p>Es un lugar idoneo, para entre otras cosas, cargar datos en cache de la aplicaci�n (ej: datos de tablas de mapeo que varian muy poco en base de datos con el fin de ganar eficiencia y velocidad) o tal como se le muestra en el proyecto SpringProyectDemo5 llevar a cabo la lectura de datos desde un fichero de configuraci�n, entre m�ltiples necesidades posibles.</p>
            				  <p>Establesca un break-point en el m�todo onStartup y proceda a ejecutar el proyecto en modo depuraci�n para que compruebe como se desata tal evento.</p>
            </div>
            <div class="item"><p><span>An�lisis 2 - HttpSessionListener:</span> En este an�lisis, le proponemos que proceda a abrir el fichero SessionEvents.java, el cual sobrecarga los eventos sessionCreated y sessionDestroyed. Estos m�todos permiten capturar la creaci�n de una nueva sesi�n (por cada cliente que accede a la aplicaci�n) y capturar el fin de la sesi�n (cuando se sobrepasa el tiempo m�ximo de sesi�n sin actividad del cliente; session-timeout, ver fichero web.xml).</p>
            				  <p>Establesca un break-point en los m�todos sessionCreated y sessionDestroyed y proceda a ejecutar el proyecto en modo depuraci�n para que compruebe como se desata tales eventos. Observar� que cada vez que se inicia una sesi�n nueva se desata sessionCreated. �Qu� ocurre, si desde el mismo navegador, se vuelve a realizar una segunda petici�n a la aplicaci�n? y �si se hace desde diferentes navegadores?</p>
            				  <p>El m�todo sessionDestroyed, se desatar� cuando haya transcurrido session-timeout (web.xml) sin actividad. Deber� esperar a que esto ocurra.</p>
            </div>
            <div class="item"><p><span>An�lisis 3 - Variables de aplicaci�n:</span> Si bi�n es verdad, que existen varias formas de hacer uso de la memoria de la aplicaci�n o comunmente denominado variables de aplicaci�n, debe tener en cuenta que cualquier dato que se asigne a un atributo est�tico que se implemente en cualquier clase, ser�n almacenados en la memoria de la aplicaci�n.</p>
            				  <p>Es decir, hasta ahora, toda variables o atributo que se crea y no es est�tico o incluso el contenido de las variables de sesi�n (vistas en el proyecto SpringProyectDemo 2) son datos relativos al hilo de cada cliente. Sin embargo, cuando se crean atributos est�ticos, los datos se almacenan en memoria de aplicaci�n y pueden ser accedidos desde todos los hilos activos de los usuarios.</p>
            				  <p>Esto �ltimo, implica que hacer uso de la memoria de aplicaci�n puede requerir llevar a cabo una correcta programaci�n concurrente (control de escritura/lectura con synchronized o semaforos).</p>
            				  <p>En el fichero SessionEvents.java, puede observar como se ha creado un atributo est�tico de tipo entero denominado totalActiveSessions. En este ejemplo, lo que se hace es incrementar dicho contador que registra el n�mero de sesiones activas en cada momento con el m�todo sessionCreated mientras que al desatarse un fin de sesi�n, este contador se decrementa con el m�todo sessionDestroyed. </p>
            				  <p>Actualmente el n�mero de sesiones activas es: <b>${NumSesiones}</b>.</p>
							  <p>El evento sessionCreated en ocasiones se desata algo m�s darde de lo que tarda la controladora en devolver la petici�n al cliente, por ello, es normal que al arrancar el proyecto y cargar la vista index.jsp le aparezca un 0 en vez de un 1, pero si vuelve a refrescar, comprobar� que el dato ya es correcto. Esto se debe a que el hilo del usuario se ejecuta independiente al hilo de la aplicaci�n.</p>
            				  <p>NOTA: En el ejemplo descrito anteriormente, no se hace uso de una correcta programaci�n concurrente (dos hilos podr�an estar escribiendo simultaneamente).</p>
            </div>
        </div>
    </div>
    <div class="pie"><p><span>�</span> 2022 - Daniel P�rez P�rez</p></div>

</body>
</html>