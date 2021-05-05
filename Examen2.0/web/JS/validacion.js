function registraru(){
    var cadena = document.getElementById("appat").value;
    var cadena1 = document.getElementById("apmat").value;
    var cadena2 = document.getElementById("edad").value;
    var cadena4 = document.getElementById("nombre").value;
    var cadena5 = document.getElementById("dia_nac").value;
    var cadena6 = document.getElementById("mes_nac").value;
    var cadena7 = document.getElementById("ano_nac").value;
    var cadena8 = document.getElementById("calle").value;
    var cadena9 = document.getElementById("alcaldia").value;
    var cadena11 = document.getElementById("interior").value;
    var cadena12 = document.getElementById("tel_particular").value;
    var cadena13 = document.getElementById("tel_celular").value;
    
    
    var pat = new RegExp(/^(([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü]*)|([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü]*,\s(de))|(((((de)|(del)|(De)|(Del)|(la)|(las)|(los))\s)?){1,2}([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü\.]*))|([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü]*\s)(((((de)|(del)|(De)|(Del)|(la)|(las)|(los))\s)?){1,2}([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü\.]*)))$/);
    var pat1 = new RegExp(/^(([A-ZÁÉÍÓÚÑ]{1}[a-záéíóúüñ]*)(\s)?)((((((((de)|(del)|(la)|(las)|(los))\s)?)?){1,2})(([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü\.]*)(\s([A-ZÁÉÍÑÓ]{1}[a-záéíñóúü\.]*))?){1})?)$/);
    //var pat2 = new RegExp(/4(\d{7})/g);
    var pat3 = new RegExp(/55(\d{8})/);
    var pat4 = new RegExp(/(\d{10})/);
    
    
    if(pat.test(cadena)=== false || pat.test(cadena1)===false){
        alert("Apellido(s) inválido(s)");
        return false;
    }
    
    if(pat1.test(cadena4)=== false){
        alert("Nombre inválido");
        return false;
    }
    
    if(cadena2>=111 || cadena2<=14){
        alert("Edad inválido");
        return false;
    }
    
    if(cadena5<1 || cadena5>31){
        alert(" Día inválido");
        return false;
    }
    
    if(cadena6<1 || cadena6>12){
        alert(" Mes inválido");
        return false;
    }
    
    if(cadena7>2007 || cadena7<1911){
        alert("Año inválido");
        return false;
    }
    
    if(pat.test(cadena8)=== false){
        alert("Calle inválida");
        return false;
    }
    
    if(pat.test(cadena9)=== false){
        alert("Alcaldía inválida");
        return false;
    }
    
    if(isNaN(cadena11)){
        alert("Interior inválido");
        return false;
    }
    
    if(pat4.test(cadena12)=== false){
        alert("Teléfono de casa inválido");
        return false;
    }
    
    if(pat3.test(cadena13)=== false){
        alert("Teléfono celular inválido");
        return false;
    }
}



function registrara(){
   var usuario = document.getElementById("usu_admin").value;
    var contraseña = document.getElementById("contraseña_admin").value;
    
    if(usuario === ""){
        alert("Campo usuario vacío");
        return false;
    }
    
    if(contraseña === ""){
        alert("Campo contraseña vacío");
        return false;
    }
}



function iniciar_sesiona(){
    var usuario = document.getElementById("usuario_admin").value;
    var contraseña = document.getElementById("contra_admin").value;
    
    if(usuario === ""){
        alert("Campo usuario vacío");
        return false;
    }
    

    if(contraseña === ""){
        alert("Campo contraseña vacío");
        return false;
    }
}


function iniciar_sesionu(){
    var telefono = document.getElementById("tel_cel").value;
    var pat4 = new RegExp(/(\d{10})/);

    if(pat4.test(telefono) === false){
        alert("Teléfono inválido");
        return false;
    }
    if(telefono === ""){
        alert("Campo teléfono vacío");
        return false;
    }
}