/*** Created by A.J on 2019/9/18.*/var gentiezi = 'text-light';$(document).ready(function(){var item = ['bold','italic','strike','underline','fontSize','fontName','color','|','indent','outdent','|','link','unlink','textBlock','code','selectAll','removeFormat','|','image','expression','subscript','superscript','horizontal','orderedList','unorderedList','|','undo','redo','|','about'];if($("#pinglun").data("tupian") == 0 && $("#pinglun").data("lianjie") == 0){item = ['bold','italic','strike','underline','fontSize','fontName','color','|','indent','outdent','|','textBlock','code','selectAll','removeFormat','|','expression','subscript','superscript','horizontal','orderedList','unorderedList','|','undo','redo','|','about'];}else if($("#pinglun").data("tupian") == 0){item = ['bold','italic','strike','underline','fontSize','fontName','color','|','indent','outdent','|','link','unlink','textBlock','code','selectAll','removeFormat','|','expression','subscript','superscript','horizontal','orderedList','unorderedList','|','undo','redo','|','about'];}else if($("#pinglun").data("lianjie") == 0){item = ['bold','italic','strike','underline','fontSize','fontName','color','|','indent','outdent','|','textBlock','code','selectAll','removeFormat','|','image','expression','subscript','superscript','horizontal','orderedList','unorderedList','|','undo','redo','|','about'];}var he = HE.getEditor('pinglun',{height : '50px',autoHeight : true,autoFloat : true,topOffset : 62,item : item,skin : 'jianyu'});var gentiedivparent, huifudiv, huifuid, gentieneirong = '';$("#gentie").on("click", function(){var obj = $(this), captcha = "";obj.attr("disabled",true).children("i:last").removeClass("d-none");if($('#captcha').length > 0){captcha = $("#captchain").val();}$.post($("#gentieurl").text(), { captcha: captcha,pid: $("#postid").text(),gtnr: he.getHtml()},function(data){obj.attr("disabled",false).children("i:last").addClass("d-none");if($('#captcha').length > 0){$("#captcha").attr("src",$("#captcha").attr("src")+"?"+Math.random());$("#captchain").val("");}if(data.result == 'ok'){he.set('');if(data.message != ""){$.alert({title: '提示',content: data.message,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}else{$("#zuidalou").text(parseInt($("#zuidalou").text()) + 1);var lasthtml = gethtml(data);$(lasthtml).insertBefore("#gentiefenge");$("#gentiefenge").prev().find(".gentieneirong img").addClass("img-fluid");$.popoverimg();$('button[data-toggle="popover"]').popover();$("#huifutiaoshu").text(parseInt($("#huifutiaoshu").text()) + 1);}}else{$.alert({title: '提示',content: data.message,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#huifu").on("click", function(){var obj = $(this), captcha = "";obj.attr("disabled",true).children("i:last").removeClass("d-none");if($('#captcha').length > 0){captcha = $("#captchain").val();}$.post($("#huifuurl").text(), { cid: huifuid,captcha: captcha,pid: $("#postid").text(),gtnr: he.getHtml()},function(data){obj.attr("disabled",false).children("i:last").addClass("d-none");if($('#captcha').length > 0){$("#captcha").attr("src",$("#captcha").attr("src")+"?"+Math.random());$("#captchain").val("");}if(data.result == 'ok'){if(data.message != ""){$.alert({title: '提示',content: data.message,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}else{$("#zuidalou").text(parseInt($("#zuidalou").text()) + 1);var lasthtml = gethtml(data);$(lasthtml).insertBefore("#gentiefenge");$("#gentiefenge").prev().find(".gentieneirong img").addClass("img-fluid");$.popoverimg();$('button[data-toggle="popover"]').popover();$.moveToOriginal(he, huifudiv, gentiedivparent, gentieneirong);$("#huifutiaoshu").text(parseInt($("#huifutiaoshu").text()) + 1);}}else{$.alert({title: '提示',content: data.message,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#chakanquanwen").on("click", function(){$(this).addClass("d-none").next().removeClass("d-none");});gentiedivparent = $("#gentiediv").parent();$("#huifulist").on("click", ".jianyu_huifu", function(){huifuid = $(this).data("id");if(typeof gentieneirong == 'object'){gentieneirong.removeClass(gentiezi);}gentieneirong = '';he.set('');huifudiv = $(this).parent().parent().children("div.huifudiv");if($('#captchadiv').length > 0){$('#captchadiv').show();}$("#gentiebtn").addClass("d-none");$("#gentietishi").addClass("d-none");$("#huifubtn").removeClass("d-none").children("button#huifu").removeClass("d-none").siblings("button#xiugai").addClass("d-none");$("#gentiediv").insertAfter(huifudiv.children("div.huifudivtop"));});$("#quxiaohuifu").on("click", function(){$.moveToOriginal(he, huifudiv, gentiedivparent, gentieneirong);});$('button[data-toggle="popover"]').popover();if($("#isLogin").text() == 1){$("#postzan").on("click", function(){var tobj = $(this);$.post($("#postzanurl").text(), { pid: $("#postid").text()}, function(data){if(data == 'ok'){tobj.children("span:last").text(parseInt(tobj.children("span:last").text()) + 1);}else{$.alert({title: '提示',content: data,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#postcai").on("click", function(){var tobj = $(this);$.post($("#postcaiurl").text(), { pid: $("#postid").text()}, function(data){if(data == 'ok'){tobj.children("span:last").text(parseInt(tobj.children("span:last").text()) + 1);}else{$.alert({title: '提示',content: data,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#postshoucang").on("click", function(){var tobj = $(this);$.post($("#postshoucangurl").text(), { pid: $("#postid").text()}, function(data){if(data == 'ok'){tobj.children("span:last").text(parseInt(tobj.children("span:last").text()) + 1);}else{$.alert({title: '提示',content: data,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#huifulist").on("click", ".jianyu_gentiezan", function(){var tobj = $(this);$.post($("#gentiezanurl").text(), { pid: $("#postid").text(), subcname: $("#subcname").text(), cid: $(this).data("id")}, function(data){if(data == 'ok'){tobj.children("span:last").text(parseInt(tobj.children("span:last").text()) + 1);}else{$.alert({title: '提示',content: data,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#huifulist").on("click", ".jianyu_gentiecai", function(){var tobj = $(this);$.post($("#gentiecaiurl").text(), { pid: $("#postid").text(), subcname: $("#subcname").text(), cid: $(this).data("id")}, function(data){if(data == 'ok'){tobj.children("span:last").text(parseInt(tobj.children("span:last").text()) + 1);}else{$.alert({title: '提示',content: data,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#huifulist").on("click", ".jianyu_xiugaigentie", function(){huifuid = $(this).data("id");gentieneirong = $(this).parent().parent().children(".gentieneirong");gentieneirong.addClass(gentiezi);he.set(gentieneirong.html());huifudiv = $(this).parent().parent().children("div.huifudiv");if($('#captchadiv').length > 0){$('#captchadiv').hide();}$("#gentiebtn").addClass("d-none");$("#gentietishi").addClass("d-none");$("#huifubtn").removeClass("d-none").children("button#huifu").addClass("d-none").siblings("button#xiugai").removeClass("d-none");$("#gentiediv").insertAfter(huifudiv.children("div.huifudivtop"));});$("#xiugai").on("click", function(){var obj = $(this), gtnr = he.getHtml();obj.attr("disabled",true).children("i:last").removeClass("d-none");$.post($("#xiugaiurl").text(), { cid: huifuid,pid: $("#postid").text(), subcname: $("#subcname").text(),gtnr: gtnr},function(data){obj.attr("disabled",false).children("i:last").addClass("d-none");if(data.result == 'ok'){if(data.message != ""){$.alert({title: '提示',content: data.message,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}else{gentieneirong.html(gtnr);gentieneirong.find("img").addClass("img-fluid");$.moveToOriginal(he, huifudiv, gentiedivparent, gentieneirong);}}else{$.alert({title: '提示',content: data.message,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});});$("#huifulist").on("click", ".jianyu_shanchugentie", function(){var tobj = $(this);$.confirm({title: "确定要删除跟帖吗？",content: "跟帖删除后不可恢复，确定要删除请按继续，否则按取消",buttons: {confirm: {text: "继续",btnClass: 'btn-info',keys: ['enter'],action: function () {tobj.children("i:last").removeClass("d-none");$.post($("#shanchugentieurl").text(), { pid: $("#postid").text(), subcname: $("#subcname").text(), cid: tobj.data("id")}, function(data){tobj.children("i:last").addClass("d-none");if(data == 'ok'){tobj.parent().parent().remove();$("#huifutiaoshu").text(parseInt($("#huifutiaoshu").text()) - 1);}else{$.alert({title: '提示',content: data,buttons: {confirm: {text: '确定',btnClass: 'btn-info',keys: ['enter']}}});}});}},cancel: {text: "取消",btnClass: 'btn-default',keys: ['esc']}}});});}});$.extend({"moveToOriginal": function(he, huifudiv, gentiedivparent, gentieneirong){he.set('');if(typeof gentieneirong == 'object'){gentieneirong.removeClass(gentiezi);}if($('#captchadiv').length > 0){$('#captchadiv').show();}$("#gentiebtn").removeClass("d-none");$("#gentietishi").removeClass("d-none");$("#huifubtn").addClass("d-none");huifudiv.children("div#gentiediv").insertAfter(gentiedivparent.children("div#gentiedivprev"));}});