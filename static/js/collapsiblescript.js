var collapsibles = document.getElementsByClassName("collapsible");
var collapsibleIterator;

for (collapsibleIterator = 0; collapsibleIterator < collapsibles.length; collapsibleIterator++) {
  collapsibles[collapsibleIterator].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}