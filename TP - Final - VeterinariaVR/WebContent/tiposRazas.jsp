<%@page import="javax.xml.ws.Response"%>
<%@page import="java.util.List"%>
<%@page import="negocio.TipoAnimal"%>
<%@page import="negocio.Raza"%>

<!doctype html>
<% 
try{
	String tipousuario="";
	String usr="";
	String idusr="";
	boolean login = false;
	try{
		boolean login2 = (Boolean)request.getSession().getAttribute("login");
		login=login2;
		}
	catch (Exception e3) {login=false;}
	if(login==true)
	{
		tipousuario = (String)request.getSession().getAttribute("tipousuario");
		usr = (String)request.getSession().getAttribute("usr");
		idusr = (String)request.getSession().getAttribute("idusr");
	}	
	
	
		//VERIFICA SI HAY alguna busqueda realizada
	boolean busquedaT = false;
	try{
		busquedaT = Boolean.parseBoolean((String)request.getSession().getAttribute("busquedaTipo"));
		}
	catch (Exception e3) {}
	
	boolean busquedaR = false;
	try{
		busquedaR = Boolean.parseBoolean((String)request.getSession().getAttribute("busquedaRaza"));
		}
	catch (Exception e3) {}
	
	//VERIFICA SI HAY UN MENSAJE DE ERROR PARA MOSTRAR
	try{
		String msj3 = (String)request.getSession().getAttribute("error");
		if(msj3!="" && msj3!=null)
		{
			request.getSession().setAttribute("error", null);
			request.getSession().setAttribute("recarga", true);
			%><script>alert("<%=msj3%>");</script><%
		}
	}
	catch (Exception e3) {}


	//VERIFICA SI HAY UN MENSAJE DEL SERVLET DE RAZA
	try{	String msj2 = (String)request.getSession().getAttribute("mensajeRaza");
			if(msj2!="" && msj2!=null)
			{	%><script>alert("<%=msj2%>");</script><%
				request.getSession().setAttribute("mensajeRaza", null);	
			}
	  	}
   	catch (Exception e3) {}

	//VERIFICA SI HAY UN MENSAJE DEL SERVLET DE TIPO DE ANIMAL
   	try{
		String msj = (String)request.getSession().getAttribute("mensajeTipo");
		if(msj!="" && msj!=null)
		{
			%><script>alert("<%=msj%>");</script><%
			request.getSession().setAttribute("mensajeTipo", null);		
		}
  	}
  	catch (Exception e3) {}
	
	//VERIFICA SI ES NECESARIO RECARGAR LA PAGINA PARA CARGAR EL COMBO BOX DE TIPOS DE ANIMALES Y LISTADO DE TIPOS
	boolean s = true;
	try{
		boolean recarga = (Boolean)request.getSession().getAttribute("recarga");
		s=recarga;
  	}
	catch (Exception e3) {s=false;}
	finally{
		request.getSession().setAttribute("recarga", false);

	}
	List<TipoAnimal> lista = (List<TipoAnimal>) request.getSession().getAttribute("listaTipos");
	List<TipoAnimal> listaT;
	List<Raza> listaR;
	String valorBT;
	String valorBZ;  
	
	if(busquedaT==true)
	{	
		listaT = (List<TipoAnimal>) request.getSession().getAttribute("listaBusquedaT");
		valorBT = (String)request.getSession().getAttribute("valorBT");
	}
	else
	{	
		listaT = (List<TipoAnimal>) request.getSession().getAttribute("listaTipos");
		valorBT = "";
	}
	
	if(busquedaR==true)
	{	
		listaR = (List<Raza>) request.getSession().getAttribute("listaBusquedaR");
		valorBZ = (String)request.getSession().getAttribute("valorBZ");
	}
	else
	{ 
		listaR = (List<Raza>) request.getSession().getAttribute("listaRazas");
		valorBZ="";
	}
%>	
<html>
<head>
<meta charset="utf-8">
<title>Veterinaria VR</title>
<link href="estilo.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	if ((navigator.appName).indexOf("Microsoft")!=-1)
	{	document.write('<link href="estiloPlantilla2.css" rel="stylesheet" type="text/css">'); }
	else 
	{	document.write('<link href="estiloPlantilla.css" rel="stylesheet" type="text/css">'); }
</script>
</head>
		<script>
			function validarNuevoTipo()
			{
				var nombre = document.getElementById("nombreTipo").value;
				if(nombre!="" && nombre!= " ")
				{return true; }
				else { alert("Complete el nombre del Tipo de Animal a registrar");return false;}
			}
			function validarNuevaRaza()
			{
				var nombre = document.getElementById("nombreRaza").value;
				if(nombre!="" && nombre!= " ")
				{return true; }
				else { alert("Complete el nombre de la raza a registrar");return false;}
			}
			function confirmar(msj)
			{
				return confirm(msj);
			}
			function validarBuscarT()
			{
				var busqueda = document.getElementById("busquedaT").value;
				if(busqueda!="" && busqueda!=null){return true;}
				else{return false;}
			}
			function validarBuscarR()
			{
				var busqueda = document.getElementById("busquedaR").value;
				if(busqueda!="" && busqueda!=null){return true;}
				else{return false;}
			}
			function redireccionar() 
			{
			location.href="index.jsp";
			} 
		</script>
<body>
	<div class="container">
    
    	  <!-- INICIO ENCABEZADO !-->
    	  <% if(login==true)
    	  	{%>
    	  		<div style="width: 100; text-align: right; margin-top:0.5em; margin-right: 2em;">
    	  			<p>Usuario: <%=usr %>
    	  			<a href="SesionServlet?accion=CerrarSesion">(Cerrar Sesi�n)</a>
    	  			</p>
    	  		</div>				    	  	
    	  	<%}
    	  	else
			{%>
				<div style="width: 100; text-align: right; margin-top:0.5em; margin-right: 2em;"><a href="SesionServlet?accion=IrLogin">Iniciar Sesi�n</a></div>				
			<%
			}
			 %>    	  
		  <div class="header">
          	<a href="index.jsp">
           	<img src="imagenes/logo.png" alt="Veterinaria VR" name="logo" height="100%" id="Insert_logo" />
            </a> 
		  </div>
          <!-- FINAL ENCABEZADO!-->
          <!-- INICIO BARRA IZQUIERDA !-->          
           <div class="sidebar1">
           <!-- end .sidebar1 -->
  			</div>
          <!-- FINAL BARRA IZQUIERDA!-->
          <!-- INICIO CONTENT !-->
          
			  <div class="content">
	          <% if(login==true)
          		{
          	  %>			  
					<div style="text-align: center;">
							
	                        <a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="ConsultaServlet?accion=GenerarAlertas" >&nbsp;Alertas semana&nbsp;</a>
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="SesionServlet?accion=ModificarUsuario" >&nbsp;Mis datos&nbsp;</a>	                                 
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="AnimalServlet?accion=IrAnimales" >&nbsp;Animales&nbsp;</a>
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="PeluqueriaServlet?accion=IrPeluquerias" >&nbsp;Peluquerias&nbsp;</a>
							
							<%if(tipousuario.equals("V"))
							{ %>
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="TipoAnimalServlet?accion=IrRaza" >&nbsp;Razas y animales&nbsp;</a>							
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="VacunaServlet?accion=IrVacuna" >&nbsp;Vacunas&nbsp;</a>							
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="IntervencionServlet?accion=IrIntervenciones" >&nbsp;Intervenciones Quirurgicas&nbsp;</a>							
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="PropietarioServlet?accion=IrPropietario" >&nbsp;Propietarios&nbsp;</a>
							<a class="boton negro redondo"  style="font-size: 1em; text-decoration: none;" href="ConsultaServlet?accion=IrConsultas" >&nbsp;Consultas&nbsp;</a>
							
							                                                                                                         
							<%} %>           	                                    	                        	                                    
						<br></br>
						
					</div> 	
				<%} %>
   		  <!-- -----------------------------------------------------------------PARTE EDITABLE----------------------------------------------------------------------------------------- -->
   		  <!-- -----------------------------------------------------------------PARTE EDITABLE----------------------------------------------------------------------------------------- -->
   		  <!-- -----------------------------------------------------------------PARTE EDITABLE----------------------------------------------------------------------------------------- -->
		  <!-- TemplateBeginEditable name="cuerpo"--------------------------------------------------------------------------------------------------------------------- -->

<%
	if(s==true) 
	{
		if(tipousuario.equals("V"))
		{
		%>		
						<!-- COMIENZO DIV PARA LOS TIPOS DE ANIMALES ---------------------------------------------------------------- -->
						<div style="float:left; width: 49%;"> 
							<form id="frmTipoAnimal" name="frmTipoAnimal" method="post" action="TipoAnimalServlet">
  								<input type="hidden" value="nuevo" name="accion"/>  		  		
  								<h2>Animales</h2>
  								<table class="tablaMaqueta">
  		  							<tr>
  		    							<td><label for="nombre">Nombre del tipo de animal</label></td>
  		    							<td><input type="text" class="entrada" name="nombreTipo" id="nombreTipo" /></td>
	      							</tr>
  		    		  				<tr><td>&nbsp;</td><td>&nbsp;</td>
  		  							<tr>
  		    							<td>&nbsp;</td>
  		    							<td><input type="submit" class="boton negro redondo" value="Agregar Animal" onclick="return validarNuevoTipo();" /></td>
	      							</tr>
	  							</table>	
							</form>
						</div>
						<!-- FIN DIV PARA TIPOS DE ANIMALES ------------------------------------------------------------------------- -->
						
						
						<!-- COMIENZO DIV PARA LAS RAZAS ---------------------------------------------------------------------------------- -->
						<div style="float:left; width: 49%;"> 
							<form id="frmRaza" name="frmRaza" method="post" action="RazaServlet">
  								<input type="hidden" value="nuevo" name="accion"/>  		
  								<h2>Razas</h2>
  								<table class="tablaMaqueta">
  		  							<tr style="width: 100%">
  		    							<td style="width: 35%"><label for="nombre">Nombre raza</label></td>
  		    							<td style="width: 70%"><input type="text" class="entrada" name="nombreRaza" id="nombreRaza" /></td>
	      							</tr>	      
	      							<tr>
	      								<td>&nbsp;</td>
		      	 						<td>&nbsp;</td>
								    </tr>	      
	      							<tr style="width: 100%">
  		  								<td style="width: 35%"><label for="animal">Animal</label></td>
  		 								<td style="width: 35%">
  		     								<select name="animal"  class="entrada"  id="animal">
  		  										<%
  		  											for (int i = 0; i < lista.size(); i++) 
  		  											{
  		  	   		 									TipoAnimal t = lista.get(i);
  		  	   		 									out.print("<option value='"+t.getNombre()+"' >"+t.getNombre()+"</option>");  		  	
  		  											}
  		  											if(lista.size()==0)
  		  											{
  		  	   		 									out.print("<option value='0' >No hay tipos cargados</option>");  		  	
													}
  		  										%>		
  		  									</select>  		  		
  		  								</td>
	      							</tr>
  		  							<tr>
  		  								<td>&nbsp;</td>
  		  								<td>&nbsp;</td>
  		  							</tr>  		  
  		  							<tr style="width: 100%">
  		    							<td>&nbsp;</td>
  		    							<td><input type="submit" class="boton negro redondo"  value="Agregar Raza" onclick="return validarNuevaRaza();" /></td>
	      							</tr>
	  							</table>
							</form>
						</div>						
						<!-- FINAL DIV PARA LAS RAZAS ------------------------------------------------------------------------------- -->
						
						
						<!-- COMIENZO DIV PARA LISTADO DE TIPOS --------------------------------------------------------------------- -->
						<div style="float: left; clear:left; width: 49%;">					
							<br></br>
							<h3>Listado de animales</h3>
							<form method="post" action="TipoAnimalServlet">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;Buscar:</label>
								<input type="hidden" value="buscar" name="accion" id="accion">
								<input type="text" value="<%=valorBT%>" name="bt" id="bt">							
								<input type="submit" class="boton negro redondo"  value="Buscar" onclick="return validarBuscarT()"/>
								<a href="TipoAnimalServlet?accion=buscar">Cancelar busqueda</a>
								<br></br>
							</form>	
							<div class="listado">					
							<table >
								<thead>                                
	                               	<tr>
                                       	<th  colspan="1">Animal</th>
                                       	<th  width="120px"></th>
                                    </tr>
	                            </thead>				
		                        <tbody>
		                          	<%  		  								
  		  								for (int i = 0; i < listaT.size(); i++) 
  		  								{
  		  	   		 						TipoAnimal t = listaT.get(i);
  		  	   		 					%>
  		  	   		 						<tr <%if(i%2!=0){%>class='alt'<%} %>>
  		  	   		 							<td >
  		  	   		 							<%=t.getNombre()%></td>
  		  	   		 							<td >
  		  	   		 							<a href="TipoAnimalServlet?accion=editar&idTipo=<%=t.getId_tipo_animal()%>&nombre=<%=t.getNombre()%>">Editar</a>
  		  	   		 							<a href="TipoAnimalServlet?accion=borrar&idTipo=<%=t.getId_tipo_animal()%>" onclick="return confirmar('�Est� seguro que desea borrar el animal?')">Borrar</a>		  	   		 								  		  	   		 								  		  	   		 						
  		  	   		 						</tr>  	
  		  	   		 						
  		  	   		 					<%	  	
  		  								}
  		  								if(listaT.size()==0)
  		  								{
  		  									if(busquedaT==true)
  		  									{
  		  									%>
  		  	   		 						<tr><td  colspan="2">No hay tipos para la busqueda realizada</td></tr>
  		  	   		 						<%
  		  									}
  		  									else
  		  									{%>
  		  	   		 						<tr><td  colspan="2">No hay tipos cargados</td></tr> 		  	
										<%	}
  		  								}
  		  							%>		
		                        	<tr>
		                        	</tr>
		                        </tbody>
							</table>
							</div>
						</div>
						<!-- FIN DIV PARA LISTADO DE TIPOS ------------------------------------------------------------------------------ -->
						
						<!-- COMIENZO DIV PARA LISTADO DE RAZAS --------------------------------------------------------------------- -->
						<div style="float: right; clear: right; width: 49%;">					
							<br></br>
							<h3>Listado de razas</h3>
							<form method="post" action="RazaServlet">
								<label>&nbsp;&nbsp;&nbsp;&nbsp;Buscar:</label>
								<input type="hidden" value="buscar" name="accion" id="accion">
								<input type="text" value="<%=valorBZ%>" name="br" id="br">							
								<input type="submit" class="boton negro redondo"  value="Buscar" onclick="return validarBuscarR()"/>
								<a href="RazaServlet?accion=buscar">Cancelar busqueda</a>
								<br></br>
							</form>	
							<div class="listado">
							<table >
								<thead>                                
	                               	<tr>
                                       	<th >Raza</th>
                                       	<th >Animal</th>
                                       	<th  width="120px"></th>
                                    </tr>
	                            </thead>				
		                        <tbody>
		                          	<%
  		  								for (int i = 0; i < listaR.size(); i++) 
  		  								{
  		  	   		 						Raza t = listaR.get(i);
  		  	   		 						%>
  		  	   		 							<tr <%if(i%2!=0){%>class='alt'<%} %>>
  		  	   		 								<td ><%=t.getNombre()%></td>
  		  	   		 								<td ><%=t.getTipo_animal().getNombre()%></td>
  		  	   		 								<td >
														<a href="RazaServlet?accion=editar&razaNom=<%=t.getNombre()%>&idRaza=<%=t.getId_raza()%>">Editar</a>
		  	   		 									<a href="RazaServlet?accion=borrar&idRaza=<%=t.getId_raza()%>" 
		  	   		 																					onclick="return confirmar('�Est� seguro que desea borrar la raza?')">Borrar</a>
		  	   		 								</td>		  	   		 								  		  	   		 								  		  	   		 						
		  	   		 							</tr> 						
  		  	   		 						
  		  	   		 						  	   		 					
		  	   		 						
		  	   		 					<%	
  		  								}
  		  								if(listaR.size()==0)
  		  								{

  		  									if(busquedaR==true)
			  								{
		  									%>
		  	   		 							<tr><td  colspan="3">No hay tipos para la busqueda realizada</td></tr>
		  	   		 						<%
		  									}
		  									else
		  									{%>
		  	   		 							<tr><td  colspan="3">No hay tipos cargados</td></tr> 		  	
										<%	}
  		  									
  		  								}
  		  							%>		
		                        	<tr>
		                        	</tr>
		                        </tbody>
							</table>
							</div>
						</div>
						<!-- FIN DIV PARA LISTADO DE RAZAS ------------------------------------------------------------------------------ -->
					
	<%
		}
		else
		{ %> <script>location.href = "index.jsp";</script><%}
	}
	else
	{
		%>
					<form action="TipoAnimalServlet" method="get" name="frmActualizar" id="frmActualizar">
						<input type="hidden" value="actualizarTipos" name="accion" id="accion" />
					</form>
					<script>
						document.frmActualizar.submit();
					</script>
		<%		
	}
%>

					<div style="text-align: left; clear: both; margin-left: 10px;">
						<br></br><input type="button" value="Volver" class="boton negro redondo"  name="volver" onclick="redireccionar()" />
					</div>						                
          



		  <!-- TemplateEndEditable -------------------------------------------------------------------------------------------------------------------------------------- --> 				
   		  <!-- ------------------------------------------------------------------FINAL EDITABLE---------------------------------------------------------------------------------------- -->
   		  <!-- ------------------------------------------------------------------FINAL EDITABLE---------------------------------------------------------------------------------------- -->
   		  <!-- ------------------------------------------------------------------FINAL EDITABLE---------------------------------------------------------------------------------------- -->
   		</div>
          <!-- FINAL CONTENT !-->
          <!-- INICIO BARRA DERECHA!-->
 		<div class="sidebar2">
    	</div>          
          <!-- FINAL BARRA DERECHA !-->          <!-- INICIO PIE !-->
		<div class="footer">
          	<div style="padding-left:3em; text-align:center; width:100%;">
                <p><b>Direccion:</b> Rivadavia 773</p>
			    <p><b>Tel. Fijo:</b> (336)4423408</p>	
	            <p><b>Celular:</b> (336)154185286 </p>	
   		  	</div>
            <div style="float:right; text-align=right;  width:100%; ">
		   		<p style="font-size:0.8em; text-align:right;margin-right:1em;">Desarrollo: Borgonovo Sofia </p>	
   		  	</div>
		</div>
	</div>
</body>
</html>
<%
}
catch (Exception e3) {
	e3.printStackTrace();%>
	<script>
		alert("Sucedio un imprevisto al cargar la p�gina. Por favor intente mas tarde");
		location.href="index.jsp";
	</script>
<% }%>
