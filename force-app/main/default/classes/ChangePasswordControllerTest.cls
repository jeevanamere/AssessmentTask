/**
 * An apex page controller that exposes the change password functionality
 */
/**@IsTest public with sharing class ChangePasswordControllerTest {
    @IsTest(SeeAllData=true) public static void testChangePasswordController() {
        // Instantiate a new controller with all parameters in the page
        ChangePasswordController controller = new ChangePasswordController();
        controller.oldPassword = '123456';
        controller.newPassword = 'qwerty1'; 
        controller.verifyNewPassword = 'qwerty1';                
        
        System.assertEquals(controller.changePassword(),null);                           
    }    
}**/

@isTest
public class ChangePasswordControllerTest {
    @isTest
    static void testChangePasswordControllerSuccess() {
        // Create a test user with proper permissions
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        User testUser = new User(
            Alias = 'tuser',
            Email = 'testuser@example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'Test',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/New_York',
            Username = 'testuser' + DateTime.now().getTime() + '@example.com'
        );
        insert testUser;

        // Run the test as the created user
        System.runAs(testUser) {
            ChangePasswordController controller = new ChangePasswordController();
            controller.currentPassword = 'oldPassword123!';
            controller.newPassword = 'newPassword123!';
            controller.confirmPassword = 'newPassword123!';

            Test.startTest();
            controller.changePassword();
            Test.stopTest();

            // Validate the outcome
            System.assert(controller.isPasswordChanged, 'Password should be changed successfully.');
        }
    }

    @isTest
    static void testChangePasswordEmptyFields() {
        ChangePasswordController controller = new ChangePasswordController();

        // Test with missing current password
        controller.newPassword = 'newPassword123!';
        controller.confirmPassword = 'newPassword123!';
        Test.startTest();
        try {
            controller.changePassword();
            System.assert(false, 'Expected exception for missing current password.');
        } catch (Exception e) {
            System.assert(e.getMessage().contains('All fields are required.'), 'Expected validation message for missing fields.');
        }
        Test.stopTest();

        // Test with missing new password
        controller.currentPassword = 'oldPassword123!';
        controller.newPassword = '';
        controller.confirmPassword = 'newPassword123!';
        Test.startTest();
        try {
            controller.changePassword();
            System.assert(false, 'Expected exception for missing new password.');
        } catch (Exception e) {
            System.assert(e.getMessage().contains('All fields are required.'), 'Expected validation message for missing fields.');
        }
        Test.stopTest();
    }

    @isTest
    static void testChangePasswordMismatch() {
        ChangePasswordController controller = new ChangePasswordController();

        // Test with mismatched passwords
        controller.currentPassword = 'oldPassword123!';
        controller.newPassword = 'newPassword123!';
        controller.confirmPassword = 'differentPassword123!';
        Test.startTest();
        try {
            controller.changePassword();
            System.assert(false, 'Expected exception for mismatched passwords.');
        } catch (Exception e) {
            System.assert(e.getMessage().contains('New Password and Confirm Password must match.'), 'Expected validation message for mismatched passwords.');
        }
        Test.stopTest();
    }

    @isTest
    static void testChangePasswordErrorHandling() {
        ChangePasswordController controller = new ChangePasswordController();

        // Test with invalid password (simulating an error in System.setPassword)
        controller.currentPassword = 'oldPassword123!';
        controller.newPassword = 'invalidPassword123!';
        controller.confirmPassword = 'invalidPassword123!';
        Test.startTest();
        try {
            controller.changePassword();
            System.assert(false, 'Expected exception due to simulated error.');
        } catch (Exception e) {
            System.assert(e.getMessage().contains('Error changing password'), 'Expected error message for password change failure.');
        }
        Test.stopTest();
    }
}