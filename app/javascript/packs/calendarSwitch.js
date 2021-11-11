document.addEventListener('turbolinks:load', () => {
    itemDisplay()
    items[0].style.display = "block"

    document.getElementById("changeSelect").onclick = changeTeam
})

function itemDisplay(){
    items = document.querySelectorAll('.item');
    for(var item of items){
        item.style.display = "none";
    };
};

function changeTeam(){
    itemDisplay()
    value = document.getElementById('changeSelect').value;
    item = document.getElementById(value);
    item.style.display = "block";
};