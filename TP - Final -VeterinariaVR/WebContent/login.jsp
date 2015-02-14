<% 
	String tipousuario="";
	String usr="";
	String idusr="";
	boolean login = false;
	try{
		boolean login2 = (Boolean)request.getSession().getAttribute("login");
		login=login2;
		}
	catch (Exception e3) {login=false;}

	try{
			String msj = (String)request.getSession().getAttribute("mensaje");
			if(msj!="" && msj!=null)
			{
				%><script>alert("<%=msj%>");</script><%
				request.getSession().setAttribute("mensaje", null);		
			}
		}
	catch (Exception e3) {}
	finally{}

%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Veterinaria VR</title>
<link href="estiloPlantilla.css" rel="stylesheet" type="text/css">
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>
<script>
	function cambiarAccion(accion,action)
	{
		document.getElementById("accion").setAttribute("value",accion);
		document.form1.setAttribute("action",action);
		document.form1.submit();	
	}	
	
	function validar()
	{
		var usuario = document.getElementById("usuario").value;
		var clave = document.getElementById("clave").value;
		var msj = ""; 
		if(usuario=="" || usuario==" ")
		{
			msj = msj +"El usuario no puede estar vacio\n"
		}
		if(clave=="" || clave==" ")
		{
			msj = msj +"La clave no puede estar vacia\n"
		}
		if(msj!="")
		{alert(msj);return false;}
		else{return true;}
	}	
</script>
<%
	String usuario;
	if(request.getSession().getAttribute("usuario")==null)
	{	usuario = "";	}
	else
	{	usuario = (String)request.getSession().getAttribute("usuario");	}
	
	String clave;
	if(request.getSession().getAttribute("clave")==null)
	{	clave = "";	}
	else
	{	clave = (String)request.getSession().getAttribute("clave");	}	
	
	if(login==false)
	{
 %>
<body>
	<div class="container">
    
    	  <!-- INICIO ENCABEZADO !-->
		  <br></br> 
		  <div class="header">
          	<a href="index.jsp">
           	<img src="imagenes/logo.png" alt="Veterinaria VR" name="logo" height="100%" id="Insert_logo" />
            </a> 
		  </div>
          <!-- FINAL ENCABEZADO!-->
          
          <!-- INICIO CONTENT !-->
		  <div class="content">
				
   		  <!-- -----------------------------------------------------------------PARTE EDITABLE----------------------------------------------------------------------------------------- -->
   		  <!-- -----------------------------------------------------------------PARTE EDITABLE----------------------------------------------------------------------------------------- -->
   		  <!-- -----------------------------------------------------------------PARTE EDITABLE----------------------------------------------------------------------------------------- -->
		  <!-- TemplateBeginEditable name="cuerpo"--------------------------------------------------------------------------------------------------------------------- -->
			<form method="post" action="SesionServlet" style="text-align: center;">
				<br></br>				
				<br></br>				
				<H1>Inicio de sesi�n</H1>	 				
				<input type="hidden" name="accion" value="IniciarSesion"/>
				<label for='usuario'>Usuario: </label>
				<input type="text"	value="<%= usuario %>" name="usuario" id="usuario"/>
				<br></br>
				<label for="clave">Clave: </label>	
				<input type="password" value="<%=clave %>" name="clave" id="clave"/>
				<br></br>				
				<input type="submit" class="boton negro redondo" value="Iniciar sesi�n" style="font-size: 1.2em;" onclick="return validar();" />
				<br></br>				
				<br></br>				
				<br></br>				
				<br></br>						
			</form>

		  <!-- TemplateEndEditable -------------------------------------------------------------------------------------------------------------------------------------- --> 				
   		  <!-- ------------------------------------------------------------------FINAL EDITABLE---------------------------------------------------------------------------------------- -->
   		  <!-- ------------------------------------------------------------------FINAL EDITABLE---------------------------------------------------------------------------------------- -->
   		  <!-- ------------------------------------------------------------------FINAL EDITABLE---------------------------------------------------------------------------------------- -->
   		  </div>
          <!-- FINAL CONTENT !-->
          
          <!-- INICIO PIE !-->
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
			<%} 
		  else
		  {%>
		  	<script>location.href='index.jsp';</script>
		  <%}
		  
		   %>
</html>
			
			