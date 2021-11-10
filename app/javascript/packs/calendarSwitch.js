document.addEventListener('turbolinks:load', () => {

    var items = document.getElementsByClassName('item');
    var itemDisplay = function(){
        for(i=0;i<items.length;i++){
            items[i].style.display = "none";
        };
    };
    itemDisplay()
    items[0].style.display = "block";

    var changeTeam = function(){
        itemDisplay()
        value = document.getElementById('changeSelect').value;
        item = document.getElementById(value);
        item.style.display = "block";
    };
    document.getElementById("changeSelect").onclick = changeTeam

})