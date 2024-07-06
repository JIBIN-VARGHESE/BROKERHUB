
$(function()
      {
	openModal();
	var z = Math.random();
  $("#ddt002").load("mbbrokerstatus_5122021.cgi?server="+"vlddt002.test.intranet"+"&Z="+z, function(responseText, statusText, xhr)
  {
    if(statusText == "error")
      alert("An error occurred: " + xhr.status + " - " + xhr.statusText);
	closeModal();
  });
});


function openModal() {
        document.getElementById('modal').style.display = 'block';
        document.getElementById('fade').style.display = 'block';
}

function closeModal() {
    document.getElementById('modal').style.display = 'none';
    document.getElementById('fade').style.display = 'none';
}

$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
