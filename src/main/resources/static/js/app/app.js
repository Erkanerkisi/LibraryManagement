var app = angular.module('Library',['ui.router','ngStorage']);

app.constant('urls', {
    BASE: 'http://localhost:8090/',
    USER_SERVICE_API : 'http://localhost:8090/api/member/'
});

app.config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'partials/list',
                controller:'MemberController',
                controllerAs:'ctrl',
                resolve: {
                    users: function ($q, MemberService) {
                        console.log('Load all users');
                        var deferred = $q.defer();
                        MemberService.loadAllMembers().then(deferred.resolve, deferred.resolve);
                        return deferred.promise;
                    }
                }
            });
        
  
    
        
     
        $urlRouterProvider.otherwise('/');
    }]);

