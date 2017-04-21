<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<div class="container">
<h2 style="font-family:'Saysettha OT'; src:url(http://foton.com.la/font/Saysettha OT.ttf); color:#6306CE;">Review</h2>

<table width="100%" border="0">
    <tr>
        <td width="25%">
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)">금강렌트카</h4>
            <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="FOTON LAOS" data-caption="SAUVANA" data-image="http://foton.com.la/img/Facebook/" data-target="#image-gallery">
                <img src="http://foton.com.la/img/Facebook/icon/suv-Menu.png">
            </a>
            <hr>
        </td>
        <td width="25%">             
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)">대진렌트카</h4>
            <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="FOTON LAOS" data-caption="SAUVANA" data-image="http://foton.com.la/img/Facebook/" data-target="#image-gallery">
                <img src="http://foton.com.la/img/Facebook/icon/Tunland-Menu.png">
            </a>
            <hr>
        </td>
    </tr>
    <tr>    
        <td width="25%">             
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)">대한렌트카</h4>
            <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="FOTON LAOS" data-caption="SAUVANA" data-image="http://foton.com.la/img/Facebook/" data-target="#image-gallery">
                <img src="http://foton.com.la/img/Facebook/icon/view-cs2-menu.png">
            </a>
            <hr>
        </td>
        <td width="25%">             
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)">로얄렌트카</h4>
            <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="FOTON LAOS" data-caption="SAUVANA" data-image="http://foton.com.la/img/Facebook/" data-target="#image-gallery">
                <img src="http://foton.com.la/img/Facebook/icon/Auman-Tx-troctors.png">
            </a>
            <hr>
        </td>
    </tr>
    <tr>    
        <td width="25%">             
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)">베스트렌트카</h4>
            <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="FOTON LAOS" data-caption="SAUVANA" data-image="http://foton.com.la/img/Facebook/" data-target="#image-gallery">
                <img src="http://foton.com.la/img/Facebook/icon/Aumark-FL-menu.png">
            </a>
            <hr>
        </td>
        <td width="25%">             
            <h4 style="font-family:'IowanOldSt BT'; src:url(http://foton.com.la/font/iowaosbd.ttf)">스마트렌트카</h4>
            <a class="thumbnail" href="#" data-image-id="" data-toggle="modal" data-title="FOTON LAOS" data-caption="SAUVANA" data-image="http://foton.com.la/img/Facebook/" data-target="#image-gallery">
                <img src="http://foton.com.la/img/Facebook/icon/Auman-dump-menu.png">
            </a>
            <hr>
        </td>
    </tr>
</table>
</div>

<div class="modal fade" id="image-gallery" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="image-gallery-title"></h4>
            </div>
            <div class="modal-body" align="center">
                <img id="image-gallery-image"  class="img-polaroid" src="">
                <h4><div class="caption" id="image-gallery-caption" align="center">
                    FOTON LAOS By Synesis CO.,LTD
                </div></h4>
            </div>
            <div class="modal-footer">
                <span class="pull-left">
                    <button type="button" class="btn btn-primary" id="show-previous-image">Previous</button>
                </span>
                <span class="pull-right">
                    <button type="button" id="show-next-image" class="btn btn-default">Next</button>
                </span>
                
                <div align="center">
                    FOTON LAOS By Synesis CO.,LTD
                </div>
            </div>
        </div>
    </div>
</div>










	<!-- 지도 -->
	<!-- <div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0f24996b0e58b92f5c277a3bf3b4f066"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script> -->
<%@ include file="bottom.jsp" %>