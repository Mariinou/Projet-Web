// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.stickyheader
//= require jquery.ba-throttle-debounce.min
//= require jquery.tinyscrollbar
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {

	particlesJS("particles-js", {
	  "particles": {
	    "number": {
	      "value": 208,
	      "density": {
	        "enable": true,
	        "value_area": 1362.9002517356944
	      }
	    },
	    "color": {
	      "value": "#ffffff"
	    },
	    "shape": {
	      "type": "circle",
	      "stroke": {
	        "width": 0,
	        "color": "#000000"
	      },
	      "polygon": {
	        "nb_sides": 5
	      },
	      "image": {
	        "src": "img/github.svg",
	        "width": 100,
	        "height": 100
	      }
	    },
	    "opacity": {
	      "value": 0.5451601006942778,
	      "random": false,
	      "anim": {
	        "enable": false,
	        "speed": 1.6241544246026902,
	        "opacity_min": 0.22738161944437663,
	        "sync": false
	      }
	    },
	    "size": {
	      "value": 5,
	      "random": true,
	      "anim": {
	        "enable": false,
	        "speed": 40,
	        "size_min": 0.1,
	        "sync": false
	      }
	    },
	    "line_linked": {
	      "enable": true,
	      "distance": 150,
	      "color": "#ffffff",
	      "opacity": 0.4,
	      "width": 1
	    },
	    "move": {
	      "enable": true,
	      "speed": 3,
	      "direction": "none",
	      "random": false,
	      "straight": false,
	      "out_mode": "out",
	      "bounce": false,
	      "attract": {
	        "enable": false,
	        "rotateX": 600,
	        "rotateY": 1200
	      }
	    }
	  },
	  "interactivity": {
	    "detect_on": "canvas",
	    "events": {
	      "onhover": {
	        "enable": true,
	        "mode": "repulse"
	      },
	      "onclick": {
	        "enable": false,
	        "mode": "push"
	      },
	      "resize": true
	    },
	    "modes": {
	      "grab": {
	        "distance": 400,
	        "line_linked": {
	          "opacity": 1
	        }
	      },
	      "bubble": {
	        "distance": 400,
	        "size": 40,
	        "duration": 2,
	        "opacity": 8,
	        "speed": 3
	      },
	      "repulse": {
	        "distance": 200,
	        "duration": 0.4
	      },
	      "push": {
	        "particles_nb": 4
	      },
	      "remove": {
	        "particles_nb": 2
	      }
	    }
	  },
	  "retina_detect": true
	});
	var count_particles, stats, update;
	stats = new Stats;
	stats.setMode(0);
	stats.domElement.style.position = 'absolute';
	stats.domElement.style.left = '0px';
	stats.domElement.style.top = '0px';
	document.body.appendChild(stats.domElement);
	count_particles = document.querySelector('.js-count-particles');
	update = function() {
	  stats.begin();
	  stats.end();
	  if (window.pJSDom[0].pJS.particles && window.pJSDom[0].pJS.particles.array) {
	    count_particles.innerText = window.pJSDom[0].pJS.particles.array.length;
	  }
	  requestAnimationFrame(update);
	};
	requestAnimationFrame(update);;
});

$(document).ready(function() {
	$(".scrollable").tinyscrollbar();
});

$(document).on('click', '.notification > button.delete', function() {
    $(this).parent().addClass('is-hidden');
    return false;
});

$("#particles-js").height($(document).height());
$(window).resize(function() {
	$("#particles-js").height($(document).height());
});

$(document).ready(function() {
	if ($('.overflow-y').height()<=72) {
		$('.overflow-y').css("overflow-x", "hidden");
		$('.overflow-y').css("overflow-y", "hidden");
	}
});