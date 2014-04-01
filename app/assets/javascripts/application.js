// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function addLineItem(){
	line 				= document.getElementById('line_item');
	num 				= new Date().getTime();
	parent 				= line.parentNode;
	line_copy 			= line.cloneNode(true);
	line_copy.id 		= "line_item_" + num;
	console.debug(line_copy.id);
	line_copy_inputs	= line_copy.getElementsByTagName('input');

	for (var i = 0; i < line_copy_inputs.length; i++) {
		line_copy_inputs[i].value = "";
		new_name = $(line_copy_inputs[i]).attr('name').replace('0', num); 
		$(line_copy_inputs[i]).attr('name', new_name);
	}
	
	parent.appendChild(line_copy);
}

function removeRow(ev){
	ev.target.previousSibling.previousSibling.value = "1";
	ev.target.parentNode.style.display = 'none';
}