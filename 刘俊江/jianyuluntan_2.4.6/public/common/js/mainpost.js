/*** Created by A.J on 2019/9/17.*/$(document).ready(function(){$(".confirm").on("click", function(){var obj = $(this);$.confirm({title: $("#quedingshanchu").text(),content: $("#bukehuifu").text(),buttons: {confirm: {text: $('#jixu').text(),btnClass: 'btn-info',keys: ['enter'],action: function () {obj.children("i:last").removeClass("d-none");$.post("delmainpost", { id: obj.next().val(), verification:$("#verification").text()},function(data){obj.children("i:last").addClass("d-none");if(data == 'ok'){obj.parent().parent().remove();}else{$.alert({title: $('#chucuo').text(),content: data,buttons: {confirm: {text: $('#queding').text(),btnClass: 'btn-info',keys: ['enter']}}});}});}},cancel: {text: $('#quxiao').text(),btnClass: 'btn-default',keys: ['esc']}}});});$("input.custom-control-input").on("click", function(){var tobj = $(this);var tid = $(this).attr("id");var farr = tid.split("_");var ischk = 0;if($(this).prop("checked") == true){ischk = 1;}$.post("manamainpost", { id: farr[1],opt: farr[0], chk: ischk, verification:$("#verification").text()}, function(){if(data != 'ok'){if(ischk == 1){tobj.prop("checked", false);}else{tobj.prop("checked", true);}$.alert({title: $('#chucuo').text(),content: data,buttons: {confirm: {text: $('#queding').text(),btnClass: 'btn-info',keys: ['enter']}}});}});});$(".viewpost").on("click", function(){var tobj = $(this);$("#postModalLabel").text(tobj.siblings(":first").text());$("#postModalBody").html($("#loading").html());$.post("getmainpost", { id: tobj.data("pid"), verification:$("#verification").text()}, function(data){$("#postModalBody").html(data);});});});