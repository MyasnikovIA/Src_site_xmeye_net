function _parent(a){return $("body",parent.document).find(a)}function alert_box(a,b,c){show_bg();show_box(a,b,c);_parent(".alert_content").show(200);_parent("#alert_close").click(function(){hidden_bg()})}function show_bg(){var a=_parent("body").eq(0);if(_parent("#bg").length==0){a.append('<div id="bgg"></div>');_parent("#bg").css("height",a.height())}else{_parent("#bg").show(200)}}function show_box(a,b,c){_parent(".alert_content").css({width:a,height:b,top:"50%",left:"50%","margin-top":"-280px","margin-left":"-400px"});_parent("#bg_iframe").attr("src",c)}function hidden_bg(){_parent("#bg").fadeOut();_parent(".alert_content").fadeOut()};