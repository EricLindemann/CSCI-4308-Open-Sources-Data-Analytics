// Create the headerCtrl module and controller. Note that it depends on $location service
var tryCtrl = angular.module('headerCtrl', []);
tryCtrl.controller('headerCtrl', function($scope, $http, $location) {
    $scope.todos = {};
    $scope.sayHello = function() {
      $http.get('data.json')
            .then(function(res){
               $scope.todos = res.data;
               console.log(res.data);
             });
   };


   $scope.username = 'World';

    $scope.sayHi = function() {
      $scope.greeting = 'Hello ' + $scope.username + '!';
    };


    // Sets the isActive value based on the current URL location
    $scope.isActive = function (viewLocation) {
        return viewLocation === $location.path();
    };
});
