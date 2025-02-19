/**
 * An apex page controller that exposes the change password functionality
 */
/**public with sharing class ChangePasswordController {
    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    
    public PageReference changePassword() {
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);    
    }     
    
    public ChangePasswordController() {}
}**/


public class ChangePasswordController {
    public String currentPassword { get; set; }
    public String newPassword { get; set; }
    public String confirmPassword { get; set; }
    public Boolean isPasswordChanged { get; private set; }

    public ChangePasswordController() {
        isPasswordChanged = false;
    }

    public void changePassword() {
        try {
            // Validate password input
            if (String.isEmpty(currentPassword) || String.isEmpty(newPassword) || String.isEmpty(confirmPassword)) {
                throw new AuraHandledException('All fields are required.');
            }

            if (!newPassword.equals(confirmPassword)) {
                throw new AuraHandledException('New Password and Confirm Password must match.');
            }

            // Call to UserManagement API to change password
            System.setPassword(UserInfo.getUserId(), newPassword);
            isPasswordChanged = true;
        } catch (Exception e) {
            isPasswordChanged = false;
            throw new AuraHandledException('Error changing password: ' + e.getMessage());
        }
    }
}