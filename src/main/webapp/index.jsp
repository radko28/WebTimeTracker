<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<header>
	<title>WebTimeTracker</title>
	<script src="<c:url value="/resources/lib/angular.min.js"/>" ></script>
	<script src="<c:url value="/resources/js/script.js"/>" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</header>
<body ng-app="webTimeTrackerApp" ng-controller="timeTrackerController">
    <h1>WebTimeTracker</h1>
    <table border>
    	<tr>
        	<th>Start</th>
            <th>End</th>
            <th>Email</th>
        </tr>
        <tr ng-repeat="track in tracks">
            <div ng-if="track.start"><td>{{track.start | date:'dd MM yyyy HH:mm'}}</td></div>  
            <div ng-if="track.end"><td>{{track.end | date:'dd MM yyyy HH:mm'}}</td></div>
        	<div ng-if="track.email"><td>{{ track.email }}</td></div>
        </tr>
	</table>
	
	<h2>Input TimeTracker</h2>
    <table >
    	<tr>
        	<td>Start time</td>
			<td>
				<input type="text" ng-model="startDate" datepicker />
            	time
            </td>
            <td>
            	<select ng-model="startTime" ng-change="changedValue(hour)" >
					<option  ng-selected="$first" ng-repeat="x in range" value="{{x}}">{{x}}</option>
				</select>
			</td>
        </tr>
		<tr>
        	<td >End date</td>
            <td>
            	<input type="text" ng-model="endDate" datepicker />
            	time
            </td>
            <td>
            	<select ng-model="endTime" ng-change="changedValue(hour)" >
					<option  ng-selected="$first" ng-repeat="x in range" value="{{x}}">{{x}}</option>
				</select>
			</td>
		</tr>
        <tr>
			<td>Email</td>
            <td colspan = "2"><input type="text" ng-model="email" size="30" /></td>
        </tr>
        <tr>
			<td>Lines</td>
	        <td>
				<select ng-model="line" ng-change="changedValue(line)" >
					<option  ng-selected="$first" ng-repeat="x in lines" value="{{x}}">{{x}}</option>
				</select>
			</td>
        </tr>        
        <tr>
        	<td></td>
            <td><button ng-click="getTracks()">View tracks</button></td>
			<td><button ng-click="postTrack()">Add track</button></td>
		</tr>
    </table>
</body>
</html>
