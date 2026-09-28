jQuery.noConflict();

(function($) {
	$(document).ready(function() {

		if ($(".clickMe").length > 0) {
			$(".clickMe").each(function() {
				// trigger click on load
				$(this).trigger("click");
			});
		}

		$(".hamburger").click(function() {
			$(".hamburger").toggleClass("is-active");
			$("nav").toggleClass("is-active");
		});

		$("#mobileMenu .arrow").on("click", function() {
			var myHolder = $(this).parent();
			myHolder.toggleClass("active");
		});

		$(window).scroll(function() {
			if ($(document).scrollTop() > 100) {
				$('header').addClass('scrolled');
			} else {
				$('header').removeClass('scrolled');
			}


			$(".countMe").each(function() {
				if ($(this).hasClass("counted")) {
				} else {
					if (!/^\d+(\.\d+)?$/.test($(this).text().trim())) return;

					var top_of_element = $(this).offset().top;
				    var bottom_of_element = $(this).offset().top + $(this).outerHeight();
				    var bottom_of_screen = $(window).scrollTop() + $(window).innerHeight();
				    var top_of_screen = $(window).scrollTop();

				    if ((bottom_of_screen > top_of_element) && (top_of_screen < bottom_of_element)){
						$(this).countTo();
						$(this).addClass("counted");
					}
				}
			});
		});

		$('input[type=submit], button[type=submit]').on('click', function() {
			var $submitButton = $(this);
			var form = $submitButton.closest('form')[0];

			if (!form || !form.checkValidity() || $submitButton.hasClass('is-loading')) {
				return;
			}

			$submitButton.addClass('is-loading');

			if ($submitButton.is('input')) {
				if (!$submitButton.next('.spinner').length) {
					$submitButton.after('<span class="spinner"></span>');
				}
			} else if (!$submitButton.children('.spinner').length) {
				$submitButton.append('<span class="spinner"></span>');
			}
		});

		//$('.countMe').countTo();

		$(".blocklang" ).mouseenter(function() {
		   	$("#altlang").slideDown();
		});

		$("#multibox").mouseleave(function() {
		    $("#altlang").slideUp();
		 });

		$(".shareboxHolder").mouseenter(function() {
			$('.shareboxHolder .sharebox').slideDown();
		}).mouseleave(function() {
			$('.shareboxHolder .sharebox').slideUp();
		});

		$(".rounded-pill").on("keyup", function() {
			if ($(this).val().length > 0) {
				$(this).addClass("active");
			} else {
				$(this).removeClass("active");
			}
		});

		$("a.fbShare, .fbShareMobile").on("click", function() {
			window.open($(this).data("src"), 'Facebook share');
			return false;
		});

		if ($("[id^=slickGallery-]").length > 0) {
			$("[id^=slickGallery-]").each(function() {
				$(this).slick({
					dots: true,
					infinite: false,
					speed: 300,
					slidesToShow: 1,
					centerMode: false,
					variableWidth: true
				});
			});
		}

		// video 
		if ($(".video").length > 0) { 
			const allVideos = document.querySelectorAll(".video");

			allVideos.forEach((v) => {
				const myV = v.querySelector("video");
				myV.currentTime = 1;
				myV.play();
				myV.pause();
			 v.addEventListener("mouseover", () => {
			  const video = v.querySelector("video");
			  video.play();
			 });
			 v.addEventListener("mouseleave", () => {
			  const video = v.querySelector("video");
			  video.pause();
			 });
			});

			$(function () {
			 $(".close").on("click", function (e) {
			    e.preventDefault();
			    $(".video-stream video")[0].pause();
			    $(".vid-container").removeClass("show");
			    $(".vid-container").scrollTop(0);
			   });
			 $(".video").on("click", function (e) {
			    
			 });

			 $(".video").click(function () {
			  var source = $(this).find("source").attr("src");
			  var title = $(this).find(".video-name").text();
			  var subtitle = $(this).find(".video-subtitle").text();
			  var descr = $(this).find(".video-descr").text();
			  var vid = $(".video-stream video").get(0);
			  vid.pause();
			  
			  $(".video-stream source").attr("src", source);

			  vid.src = source;
			  vid.load();
			  vid.play();
			  //$(".video-stream video")[0].autoplay('auto');
			  $(".video-p-title").text(title);
			  $(".video-p-subtitle").text(subtitle);
			  $(".video-p-descr").text(descr);

			  $(".vid-container, .video-stream").addClass("show");
			    var startpos = $("#the-video")[0]; // $("#video-infos")[0];
			    startpos.scrollIntoView({
			        behavior: "smooth", // "smooth" or "auto" or "instant"
			        block: "end" // "start" or "end"
			    });
			 });
			});
		}

		$("body .vModal").on("click", function() {
			var vid = $($(this).data("video")).get(0);
			vid.pause();
		});

		$("body .vFPopup").on("click", function() {
			var vid = $($(this).data("bs-target") + " video").get(0);
			vid.play();
		});




		// Postavljamo interval da provjerava svake pola sekunde
		var hideWidgetButton = setInterval(function() {
			var $widget = $('reservier-widget');
			
			// Provjeravamo da li widget postoji u DOM-u i da li ima otvoren shadowRoot
			if ($widget.length > 0 && $widget[0].shadowRoot) {
				
				// Tražimo element unutar shadowRoot-a i koristimo jQuery .hide()
				var $fabStack = $($widget[0].shadowRoot).find('.fab-stack');
				
				if ($fabStack.length > 0) {
					$fabStack.hide(); // Dodaje display: none
					clearInterval(hideWidgetButton); // Prekidamo petlju
				}
			}
		}, 500); // 500 milisekundi

		// Sigurnosni prekid nakon 10 sekundi
		setTimeout(function() {
			clearInterval(hideWidgetButton);
		}, 10000);

		$(document).on('click', 'a[href*="reservier.at"]', function(e) {
        
			// Sprječavamo standardno učitavanje linka (da ne odemo na drugu stranicu)
			e.preventDefault();
			
			// Pozivamo otvaranje widgeta
			if (window.Reservier) {
				window.Reservier.open({ locale: 'de' });
			} else {
				console.warn('Reservier widget još nije učitan.');
			}
		});
	});
}(jQuery));

