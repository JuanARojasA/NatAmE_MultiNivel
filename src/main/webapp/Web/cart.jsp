<%@page import="edu.finalbases.repositoryDAO.RepresentanteVentasDAO"%>
<%@page import="edu.finalbases.entities.Tarjeta"%>
<%@page import="edu.finalbases.repositoryDAO.TarjetaDAO"%>
<%@page import="edu.finalbases.entities.Cliente"%>
<%@page import="edu.finalbases.entities.Banco"%>
<%@page import="edu.finalbases.repositoryDAO.BancoDAO"%>
<%@page import="edu.finalbases.business.FuncionesRepVentas"%>
<%@page import="edu.finalbases.business.FuncionesCliente"%>
<%@page import="edu.finalbases.entities.Persona"%>
<jsp:include page="secciones/cabeza.jsp" />

<%@page import="edu.finalbases.entities.Articulo"%>
<%@page import="edu.finalbases.repositoryDAO.ArticuloDAO"%>
<%@page import="java.util.List"%>

<%
    BancoDAO bancoDAO = new BancoDAO();
    List<Banco> bancos = bancoDAO.getBancos();
    TarjetaDAO tarjetaDAO = new TarjetaDAO();
    List<Tarjeta> tarjetas = tarjetaDAO.getTarjetas();
    Cliente cliente = (Cliente) FuncionesCliente.getFuncionesCliente().getSessionCliente();
    
    Persona pRV=null;

    if (cliente != null) {       
        RepresentanteVentasDAO rDAO = new RepresentanteVentasDAO();
        pRV = (Persona) rDAO.getObjectById(cliente.getRepresentante().getIdPersona());        
    }
%>



<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody id="cart-items">
                </tbody>
                <tfoot>
                    <tr>
                        <td><a href="javascript:;" class="btn btn-danger" data-cesta-feira-clear-basket>Limpiar</a></td>
                        <td>  </td>
                        <td>Total</td>
                        <td class="text-right" id="total-value"><strong>$0</strong></td>
                        <td>  </td>
                    </tr>    
                    <tr>
                        <td> </td>
                        <td>  </td>
                        <td>Total IVA (+19%)</td>
                        <td class="text-right" id="total-valueIVA"><strong>$0</strong></td>
                        <td>  </td>
                    </tr>  
                </tfoot>
            </table>
        </div>
    </div>
    <br>
    <div class="navhe">
        <div class="row" style="display: flex; justify-content: flex-end; margin-right:175px">
            <div role="tabpanel">
                <ul class="nav nav-tabs" role="tablist">
                    <li id="tipo1" class="nav-item "><a class="nav-link active" data-toggle="tab" href="#s1" role="button" aria-haspopup="true" aria-expanded="false">Tarjeta Credito</a></li>
                    <li id="tipo2" class="nav-item "><a class="nav-link " data-toggle="tab" href="#s2" role="button" aria-haspopup="true" aria-expanded="false">PSE</a></li>
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="s1">
                        <br>
                        <div id="bancos">
                            
                            <div class="form-group">
                                <label for="tarjetas">Seleccione una tarjeta:</label>
                                <select name="tarjetas" class="form-control" id="tarjetaSelectT" required>
                                    <%                    for (Tarjeta tarjeta: tarjetas) {
                                            out.print("<option value='" + tarjeta.getIdTarjeta() + "'>" + tarjeta.getNombreTarjeta() + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="nameTitular" class="form-control" id="nameTitularT" placeholder="Nombre Titular" oninvalid="this.setCustomValidity('Ingrese un Nombre de titular V�lido')" oninput="setCustomValidity('')" required>
                            </div>
                            <div class="form-group">
                                <input type="number" name="numTarjeta" class="form-control" id="numTarjetaT" placeholder="N�mero Tarjeta" oninvalid="this.setCustomValidity('Ingrese un N�mero de tarjeta V�lido')" oninput="setCustomValidity('')" required>
                            </div>

                            <div class="form-group">
                                <input type="text" name="cvv" class="form-control" id="cvv" placeholder="CVV" oninvalid="this.setCustomValidity('Ingrese un CVV V�lido')" oninput="setCustomValidity('')" required>
                            </div>
                            <div class="row">

                                <label>Fecha Expiraci�n:</label><br>
                                <div class="col">
                                    <label for="mes">Mes:</label>
                                    <select name="mes" class="form-control" id="mesT" oninvalid="this.setCustomValidity('Seleccione un Mes')" oninput="setCustomValidity('')" required>

                                        <%
                                            for (int i = 1; i <= 12; i++) {
                                                out.print("<option value='" + i + "'>" + i + "</option>");
                                            }
                                        %>
                                    </select>

                                </div>

                                <div class="col">
                                    <label for="a�o">A�o:</label>
                                    <select name="a�o" class="form-control" id="a�oT" oninvalid="this.setCustomValidity('Seleccione un A�o')" oninput="setCustomValidity('')" required>

                                        <%
                                            for (int i = 18; i <= 37; i++) {
                                                out.print("<option value='" + i + "'>" + i + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>

                            </div>
                            <br>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="s2">
                        <br>
                        <div id="bancos">
                            <div class="form-group">
                                <label for="bancoS">Seleccione un Banco:</label>
                                <select name="bancoS" class="form-control" id="bancoSelectP" required>
                                    <%                    for (Banco banco : bancos) {
                                            out.print("<option value='" + banco.getIdBanco() + "'>" + banco.getNombreBanco() + "</option>");
                                        }
                                    %>
                                </select>
                            </div>
                                <div class="form-group">
                                <label for="tipoD">Seleccione un Tipo de Documento:</label>
                                <select name="tipoD" class="form-control" id="tipoD" required>
                                    <option value='CC'>Cedula de Ciudadania.</option>
                                    <option value='CE'>Cedula de Extranjeria.</option>
                                    <option value='RC'>Registro civil</option>
                                    <option value='TI'>Tarjeta de identidad</option>
                                    <option value='NIT'>NIT </option>                                    
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Nombres" required>
                            </div>


                            <div class="form-group">
                                <input type="text" name="apellido" class="form-control" id="apellido" placeholder="Apellidos" required>
                            </div>
                            
                            <div class="form-group">
                                <input type="number" name="numDocumentoP" class="form-control" id="numDocumentoP" placeholder="N�mero Documento" oninvalid="this.setCustomValidity('Ingrese un N�mero de documento v�lido')" oninput="setCustomValidity('')" required>
                            </div>
                            
                            <br>
                        </div>
                    </div>
                                    
                </div>
            </div>  
        </div>
        
    </div>
    <div style="float:right; margin-right:180px">
        <button type="button" href="javascript:;" class="btn btn-success" data-cesta-feira-clear-basket onclick="pagar();">Pagar</button>
        <br><br><br>
    </div>
    <br><br><br>        
</div>
<div class="input-group-text" style='display:none;'>
    <input type="radio" id="tip1" name="tipoPago" checked aria-label="Radio button for following text input" ><label for="tipo1">Tarjeta de Credito&nbsp;</label>
    <input type="radio" id="tip2" name="tipoPago" aria-label="Radio button for following text input"><label for="tipo2">Tarjeta de Debito</label>
</div>
<!-- /.container -->

<div class="modal fade" id="calificacionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="calificacionTitle">Calificaci�n Venta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div id="calificacionBody" class="modal-body">
                <label for="rateYo">Selecciona la calificaci�n</label>
                <div id="rateYo"></div>  

                <div class="form-group">
                    <label for="comentario">Comentario: </label>
                    <textarea class="form-control" style="resize:none" rows="5" id="comentario" maxlength="250"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="enviarCalificacion();" data-dismiss="modal">Enviar</button>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">
    <%      ArticuloDAO articuloDAO = new ArticuloDAO();
        List<Articulo> articulos = articuloDAO.getProductos(1);
        out.print("var obj = {");
        for (Articulo articulo : articulos) {
            out.print(articulo.getIdProducto() + ":\"" + articulo.getPath().split(";")[0] + "\",");
        }
        out.print("};");
    %>
    var totalValue = 0;
    var productos;
    function initListaOrcamento() {
    var products = $.CestaFeira({
    debug: true
    }).getItems(),
    totalValueTemp = 0,
    $cartItems = $('#cart-items');
    if (!products) {
    console.log("No items in cart!");
    return;
    }
    function updateTotalValue() {
    totalValue = 0;
    $.each($('[data-item-total-value]'), function (index, item) {
    totalValue += $(item).data('item-total-value');
    console.log(totalValue);
    });
    $('#total-value').html("$" + parseInt(totalValue));
    $('#total-valueIVA').html("$" + parseInt(totalValue)*1.19);
    }
    function mountLayout(index, data) {
    var totalValueTemp = parseInt(data.unity_price.replace(",","")) * parseInt(data.quantity);
    var $layout = "<tr id='product-"+ index +"'><td class='col-sm-8 col-md-6'><div class='media'>" +
    "<img class='d-flex align-self-center mr-3' width=60px height=60px src='"+obj[index]+"' alt=''>" +
    "<div class='media-body'>" +
    "<h5 class='mt-0'>"+ data.product_name +"</h5>" +
    "</div></div></td><td class='col-sm-1 col-md-1' style='text-align: center'>" + data.quantity +
    "<td class='col-sm-1 col-md-1 text-center'><strong>$"+ data.unity_price +"</strong></td>" +
    "<td class='col-sm-1 col-md-1 text-center' data-item-total-value='"+totalValueTemp+"'><strong>$"+ parseInt(totalValueTemp) +"</strong></td>" +
    "<td class='col-sm-1 col-md-1'>" +
    "<button type=\"button\" href=\"javascript:;\" class=\"btn btn-danger\" data-cesta-feira-delete-item=\""+index+"\" >Eliminar</button>" +
    "</td></tr>";
    $cartItems.append($layout);
    }
    productos = products;
    //console.log(productos);
    $.each(products, function (index, value) {
    mountLayout(index, value);
    });
    updateTotalValue();
    $(document).on('click', 'button[data-cesta-feira-delete-item]', function(e) {
    e.preventDefault();
    var productId = $(this).data('cesta-feira-delete-item');
    if($(document).on('cesta-feira-item-deleted')){
    $('#product-'+productId).fadeOut(500, function() {
    $(this).remove();
    updateTotalValue();
    });
    }
    });
    $(document).on('cesta-feira-clear-basket', function (e) {
    $('#cart-items tr').each(function (index, value) {
    $(value).fadeOut(500, function() {
    $(this).remove();
    updateTotalValue();
    });
    });
    });
    }
    $(document).ready(function () {
    initListaOrcamento();
    });
    actual(6);
</script>
<script>
    $(document).ready(function(){
        $("#tipo2").click(function(){
            $("#tip1").attr('checked', false);
        });
        
    });
    function pagar() {
        
        var habilitado=false;
        
        var todosP = {};
        var enviar = {};
        var contador = 0;
        for (pro in productos) {
            //console.log(parseInt(productos[pro].unity_price.replace(",","")));
            //console.log(typeof(productos[pro].unity_price));
            var produc = {id: pro, cantidad: productos[pro].quantity, preciototal: parseInt(productos[pro].unity_price) * productos[pro].quantity};
            todosP[contador] = produc;
            contador++;
        }
        
        //banco
        var strUser = "";
        //fecha
        var strFecha = "";
        $("#tipo2").click(function(){
            $("#tip1").attr('checked', false);         
        });
        $("#tipo1").click(function(){
            $("#tip1").attr('checked', true);                      
        });
        var x = $("#tip1").is(":checked");
        console.log(x);
        var titular = "";
        var tarjeta = "";
        var cvv = "";
        var idtarjeta = 0;
        var tipoDocumento="";
        var nombre="";
        var apellido="";
        var numDocumento="";
        if (x) {//Tarjeta de Credito
            //titular
            var a = document.getElementById("numTarjetaT");
            tarjeta = a.value;
            var b = document.getElementById("nameTitularT");
            titular = b.value;
            var c = document.getElementById("cvv");
            cvv = c.value;
            var d = document.getElementById("tarjetaSelectT");
            idtarjeta = d.value;            
            var f = document.getElementById("mesT");
            var g = document.getElementById("a�oT");
            strFecha = "01/"+f.options[f.selectedIndex].value+"/"+g.options[g.selectedIndex].value;
            tipo = 2;
            
            if(tarjeta != "" && titular != "" && cvv != "" && idtarjeta != ""){
                habilitado = true;
            }
        }else{
            var e = document.getElementById("bancoSelectP");
            strUser = e.options[e.selectedIndex].value;
            tipoDocumento = $("#tipoD").val();
            nombre = $("#nombre").val();
            apellido = $("#apellido").val();
            numDocumento = $("#numDocumentoP").val();
            
            if(tipoDocumento!="" && nombre != "" && apellido !="" && numDocumento!=""){
                habilitado = true;
            }
            
            tipo = 1;
        }
        console.log("Datos Tarjeta Credito: ");
        console.log(strUser);
        console.log(titular);
        console.log(tarjeta);
        console.log(cvv);
        console.log(strFecha);
        console.log("Datos PSE: ");
        console.log(strUser);
        console.log(tipoDocumento);
        console.log(nombre);
        console.log(apellido);
        console.log(numDocumento);
        enviar = {productos: todosP, 
            totalTodo: parseFloat(totalValue).toFixed(0), 
            idcliente:<% out.print(cliente.getIdPersona()); %>, 
            idrv:<% out.print(cliente.getRepresentante().getIdPersona());%>, 
            idtipopago: tipo, 
            idbanco: strUser, 
            titular: titular, 
            idTarjeta: idtarjeta, 
            numTarjeta: tarjeta, 
            cvv: cvv, 
            fecha: strFecha,
            nombre: nombre,
            apellido: apellido,
            tipoDocumento: tipoDocumento,
            numDocumento: numDocumento
        };
        console.log(enviar);
        if (Object.keys(todosP).length > 0){
            if(habilitado){
                
                console.log("Ir a pagar");
                hacerCompra(enviar);
                
            }else{
                alert("Debe ingresar todos los campos para el pago");
            }
        }else{
            alert("Ning�n producto seleccionado")
        }
    }
    function hacerCompra(compra) {
        console.log("Haciendo Compra");
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/compra/pagar',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(compra),
            success: function (response) {
                console.log(response);
                if (response.message == "exito") {
                    modalMensaje("Exito", "Compra Realizada con Exito");
                    lanzarCalificacionModal();
                } else {
                    modalMensaje("Error", response.message);
                }
            },
            error: function (textStatus) {
                console.log("error ");
                console.log(textStatus);
                if (textStatus.responseText == "exito") {
                    modalMensaje("Exito", "Compra Realizada con Exito");
                    lanzarCalificacionModal();
                } else {
                    modalMensaje("Error", textStatus);
                }
            }
        });
    }
    
    
    function lanzarCalificacionModal() {
        $("#calificacionModal").modal("show");
    }

    function enviarCalificacion() {
        $("#calificacionModal").modal("hide");
        var comentario = $("#comentario").val();
        var normalFill = $("#rateYo").rateYo("option", "rating"); //returns true
        console.log("Enviando Calificacion: " + comentario + " calificacion: " + normalFill);

        var data = {
            comentario: comentario,
            calificacion: normalFill
        };
        console.log(data);
        //Seccion ajax
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/api/compra/calificacion',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(data),
            success: function (response) {
                console.log(response);
            },
            error: function (textStatus) {
                console.log(textStatus);
            }
        });


        //Limpiar valores
        $("#comentario").val("");
    }
    $("#rateYo").rateYo({
        rating: 3,
        fullStar: true
    });

    // Getter


// Setter
    $("#rateYo").rateYo("option", "fullStar", true); //returns a jQuery Element
</script>


<jsp:include page="secciones/pies.jsp" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     