document.addEventListener('turbolinks:load', () => {
    let items = itemDisplay();
    items[0].style.display = "block";

    document.getElementById("changeSelect").onclick = changeTeam;
});

function itemDisplay(){
    let items = document.querySelectorAll('.item');
    for(let item of items){
        item.style.display = "none";
    };
    return items;
};

function changeTeam(){
    itemDisplay()
    let value = document.getElementById('changeSelect').value;
    let item = document.getElementById(value);
    item.style.display = "block";
};