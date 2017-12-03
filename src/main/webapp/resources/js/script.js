var webTimeTrackerApp = angular.module('webTimeTrackerApp', []);

webTimeTrackerApp.controller('timeTrackerController' , function ($scope, $http) {
	var url = "http://192.168.99.100:8080/records";
    $scope.email="";
    $scope.start="";
    $scope.startTime="00:00";
    $scope.endDate="";
    $scope.endTime="00:00";
    $scope.line="10";
    $scope.lines = ["10", "20", "50","100"];
    
    $scope.getTracks = function () {
        console.log("GET"); 
        $http({
            url: url, 
            method: "GET",
            params: {email: $scope.email, length: $scope.line}
         })
            .then(function successCallback(response){
            	var data = response.data;
            	$scope.tracks = data.filter(function(x) { return x !== null }); 
            }, function errorCallback(response){
                console.log("Unable to perform GET request");
            });
    };
    
    $scope.postTrack = function () {
        console.log("POST"); 
        var startDate = $scope.startDate + " " + $scope.startTime; 
        var endDate = $scope.endDate + " " + $scope.endTime;
        $http({
            url: url, 
            method: "POST",
            params: {email: $scope.email, start:startDate, end:endDate}
         })
            .then(function successCallback(response){
            	$scope.tracks = response.data;
            }, function errorCallback(response){
                console.log("Unable to perform POST request");
            });
    };
    
    
    $scope.range = [];
    for (var i = 0; i < 24; i++) {
    	var value = i+":00";
    	if(i < 10) {
    		value = "0"+i+":00";
    	}
      $scope.range.push(value);
    }
    
});

webTimeTrackerApp.directive('datepicker', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
         link: function (scope, element, attrs, ngModelCtrl) {
            $(element).datepicker({
                dateFormat: 'dd.mm.yy',
                onSelect: function (date) {
                    console.log(attrs["ngModel"]);
                	if(attrs["ngModel"] == "startDate") {
                		scope.startDate = date;
                	} else {
                		scope.endDate = date;
                	}
                    scope.$apply();
                }
            });
        }
    };
});