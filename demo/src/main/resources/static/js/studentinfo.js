function clearText(input){
    if(input.value == input.defaultValue){
        input.value = "";
    }
}

function resetText(input, defaultText){
    if(input.value == ""){
        input.value = defaultText;
    }
}