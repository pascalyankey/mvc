function toggleClass(el) {
    var ulElement = el.parentElement;
    var ilElementen = ulElement.children;
    var i;
    for (i = 0; i < ilElementen.length; i++) {
        ilElementen[i].className = "";
    }
    el.className = "active";

    var mededeling = document.getElementById("kiesgenre");
    mededeling.style.display = "none";
}