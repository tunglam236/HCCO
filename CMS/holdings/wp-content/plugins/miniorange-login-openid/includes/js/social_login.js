jQuery(window).load(function(){if(jQuery.cookie("scroll")!==null){jQuery(document).scrollTop(jQuery.cookie("scroll"));jQuery.cookie("scroll",null);}
jQuery('.custom-login-button').on("click",function(){jQuery.cookie("scroll",jQuery(document).scrollTop());});jQuery('.login-button').on("click",function(){jQuery.cookie("scroll",jQuery(document).scrollTop());});});