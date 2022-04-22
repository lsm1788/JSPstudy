<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<?php
    include_once "./libs/phpqrcode/qrlib.jsp";
       
    ob_start("colback");

//{"mid":"01080000001","dispatch":"1","lat":"","lon":"","status":"0"}
    $memberData = array("mid" => "01000000001", "dispatch" => "1", "lat" => "", "lon" => "", "status" => "0"); 
	$output =  json_encode($memberData);
    $sOrignText = urldecode($output);
      
    $debugLog = ob_get_contents();
 
    ob_end_clean();
 
    QRcode::png($sOrignText);
?>