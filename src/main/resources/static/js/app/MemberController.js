'use strict';

angular.module('Library').controller('MemberController',
    ['MemberService', '$scope',  function( MemberService, $scope) {

        var self = this;
        self.member = {};
        self.members=[];

        self.submit = submit;
        self.getAllMembers = getAllMembers;
        self.createMember = createMember;
        self.updateMember = updateMember;
        self.removeMember = removeMember;
        self.editMember = editMember;
        self.reset = reset;

        self.successMessage = '';
        self.errorMessage = '';
        self.done = false;

        self.onlyIntegers = /^\d+$/;
        self.onlyNumbers = /^\d+([,.]\d+)?$/;

        function submit() {
            console.log('Submitting');
            if (self.member.id === undefined || self.member.id === null) {
                console.log('Saving New member', self.member);
                createMember(self.member);
            } else {
                updateMember(self.member, self.member.id);
                console.log('Member updated with id ', self.member.id);
            }
        }

        function createMember(Member) {
            console.log('About to create member');
            MemberService.createMember(Member)
                .then(
                    function (response) {
                        console.log('Member created successfully');
                        self.successMessage = 'Member created successfully';
                        self.errorMessage='';
                        self.done = true;
                        self.member={};
                        $scope.myForm.$setPristine();
                    },
                    function (errResponse) {
                        console.error('Error while creating Member');
                        self.errorMessage = 'Error while creating Member: ' + errResponse.data.errorMessage;
                        self.successMessage='';
                    }
                );
        }


        function updateMember(member, id){
            console.log('About to update Member');
            MemberService.updateMember(member, id)
                .then(
                    function (response){
                        console.log('Member updated successfully');
                        self.successMessage='Member updated successfully';
                        self.errorMessage='';
                        self.done = true;
                        $scope.myForm.$setPristine();
                    },
                    function(errResponse){
                        console.error('Error while updating Member');
                        self.errorMessage='Error while updating Member '+errResponse.data;
                        self.successMessage='';
                    }
                );
        }


        function removeMember(id){
            console.log('About to remove Member with id '+id);
            MemberService.removeMember(id)
                .then(
                    function(){
                        console.log('Member '+id + ' removed successfully');
                    },
                    function(errResponse){
                        console.error('Error while removing Member '+id +', Error :'+errResponse.data);
                    }
                );
        }


        function getAllMembers(){
            return MemberService.getAllMembers();
        }

        function editMember(id) {
            self.successMessage='';
            self.errorMessage='';
            MemberService.getMember(id).then(
                function (member) {
                    self.member = member;
                },
                function (errResponse) {
                    console.error('Error while removing member ' + id + ', Error :' + errResponse.data);
                }
            );
        }
        function reset(){
            self.successMessage='';
            self.errorMessage='';
            self.member={};
            $scope.myForm.$setPristine(); //reset Form
        }
    }


    ]);