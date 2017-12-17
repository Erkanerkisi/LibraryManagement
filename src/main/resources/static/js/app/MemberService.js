'use strict';

angular.module('Library').factory('MemberService',
    ['$localStorage', '$http', '$q', 'urls',
        function ($localStorage, $http, $q, urls) {

            var factory = {
                loadAllMembers: loadAllMembers,
                getAllMembers: getAllMembers,
                getMember: getMember,
                createMember: createMember,
                updateMember: updateMember,
                removeMember: removeMember
            };

            return factory;

            function loadAllMembers() {
                console.log('Fetching all Members');
                var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API)
                    .then(
                        function (response) {
                            console.log('Fetched successfully all Member');
                            $localStorage.members = response.data;
                            deferred.resolve(response);
                        },
                        function (errResponse) {
                            console.error('Error while loading Members');
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function getAllMembers(){
                return $localStorage.members;
            }

            function getMember(id) {
                console.log('Fetching Member with id :'+id);
                var deferred = $q.defer();
                $http.get(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            console.log('Fetched successfully Member with id :'+id);
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while loading Member with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function createMember(member) {
                console.log('Creating Member');
                console.log('Member info =>' + member.name);
                var deferred = $q.defer();
                $http.post(urls.USER_SERVICE_API, member)
                    .then(
                        function (response) {
                            loadAllMembers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                           console.error('Error while creating Member : '+errResponse.data.errorMessage);
                           deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function updateMember(member, id) {
                console.log('Updating Member with id '+id);
                var deferred = $q.defer();
                $http.put(urls.USER_SERVICE_API + id, member)
                    .then(
                        function (response) {
                            loadAllMembers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while updating Member with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

            function removeMember(id) {
                console.log('Removing Member with id '+id);
                var deferred = $q.defer();
                $http.delete(urls.USER_SERVICE_API + id)
                    .then(
                        function (response) {
                            loadAllMembers();
                            deferred.resolve(response.data);
                        },
                        function (errResponse) {
                            console.error('Error while removing Member with id :'+id);
                            deferred.reject(errResponse);
                        }
                    );
                return deferred.promise;
            }

        }
    ]);