@isTest
public class AccountRatingTriggerTest {
    @isTest
    static void testAccountRatingTrigger() {
        // ✅ Step 1: Insert an Account with AnnualRevenue > 5,000,000
        Account acc1 = new Account(Name = 'Test Account 1', AnnualRevenue = 6000000);
        insert acc1;

        // Retrieve the inserted account and assert Rating is 'Hot'
        Account insertedAcc = [SELECT Name, Rating FROM Account WHERE Id = :acc1.Id];
        System.assertEquals('Hot', insertedAcc.Rating);

        // ✅ Step 2: Update an Account with Revenue < 5,000,000 (Rating should not change)
        acc1.AnnualRevenue = 4000000;
        update acc1;

        Account updatedAcc = [SELECT Name, Rating FROM Account WHERE Id = :acc1.Id];
        System.assertEquals('Hot', updatedAcc.Rating, 'Rating should remain "Hot" even if revenue is lowered.');

        // ✅ Step 3: Insert an Account with Revenue < 5,000,000 (Rating should NOT be Hot)
        Account acc2 = new Account(Name = 'Test Account 2', AnnualRevenue = 3000000);
        insert acc2;

        Account insertedAcc2 = [SELECT Name, Rating FROM Account WHERE Id = :acc2.Id];
        System.assertNotEquals('Hot', insertedAcc2.Rating, 'Rating should not be "Hot" for revenue < 5,000,000.');
    }
}
