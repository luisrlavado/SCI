// Controlador de la vista de registro de equipo

if(sessionStorage.dataUsuario==undefined)
{
    location.href="index.html";
}

$(document).ready(function()
{

        $("#header").load("header.html",function()
        {
            var datosUsuario = JSON.parse(sessionStorage.dataUsuario);
            $("#nombreUsuario").html(datosUsuario.data_personal.nombres + " " + datosUsuario.data_personal.apellidos);    

            $("#cerrarSesionButton").click(function(){
                sessionStorage.removeItem("dataUsuario");
                location.href="index.html";    
             });
        });        

        $("#btnBuscar").click(function(){
           numero = $("#buscar").val();
            getBienesBy("?num_bien="+numero).then(function(data){
                id_bien_editar = data[0].id;
                jsonToTable(
                  {
                   data : data,
                   headers : headers,
                   table : $("#tableTest")
                  });
            });
        }); 

        /* Cargando datas de la api a los selects  */     

        getBienesBy('').then(function(data){
            for(bienesgeneral in data){
                data[bienesgeneral].responsable_ad = data[bienesgeneral].responsable_ad;
            }
            jsonToSelect({        
                 data : data,
                 value : "responsable_ad",
                 alias : "responsable_ad",
                 element : $("#responsable_ad")
                 });
         })  

        getBienesBy('').then(function(data){
            for(bienesgeneral in data){
                data[bienesgeneral].responsable_uso = data[bienesgeneral].responsable_uso;
            }
            jsonToSelect({        
                 data : data,
                 value : "responsable_uso",
                 alias : "responsable_uso",
                 element : $("#responsable_uso")
                 });
         })          

        getBienesBy('').then(function(data){
            for(bienesgeneral in data){
                data[bienesgeneral].descripcion = data[bienesgeneral].descripcion;
            }
            jsonToSelect({        
                 data : data,
                 value : "descripcion",
                 alias : "descripcion",
                 element : $("#descripcion")
                 });
         })          

        getConfiguracionBy("?tipo=Unidad de Trabajo").then(function(data){
            jsonToSelect({        
                data : data,
                value : "codigo",
                alias : "descripcion",
                element : $("#unidad_trabajo")
                });
        })          

/*        getBienesBy('').then(function(data){
            for(bienesgeneral in data){
                data[bienesgeneral].unidad_trabajo = data[bienesgeneral].unidad_trabajo;
            }
            jsonToSelect({        
                 data : data,
                 value : "unidad_trabajo",
                 alias : "unidad_trabajo",
                 element : $("#unidad_trabajo")
                 });
         })*/          

                 
});
