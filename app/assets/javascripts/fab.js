var fab = $('.fixed-action-btn');
	var fabState = "off";
	fab.off( "mouseenter mouseleave" ); // Disable FAB on hover

	// the function you will call from ng-click directive
	$scope.onFabClick = function(){
	    if(fabState == "off"){
	        var time = 0;
	        fab.children('ul').css('display','block');
	        fab.find('ul a.btn-floating').reverse().each(function () {
	            $(this).velocity(
	                { opacity: "1", scaleX: "1", scaleY: "1", translateY: "0"},
	                { duration: 100, delay: time });
	            time += 40;
	        });
	        fabState = "on";
	    }
	    else{
	        var time = 0;
	        fab.find('ul a.btn-floating').velocity("stop", true);
	        fab.find('ul a.btn-floating').velocity(
	            { opacity: "0", scaleX: ".4", scaleY: ".4", translateY: "40px"},
	            {
	                duration: 100,
	                complete: function(){
	                    setTimeout(function () {
	                        fab.children('ul').css('display','none');
	                    }, 50);
	                }
	            });
	        fabState = "off";
	    }
	}