public class AccountRatingTriggerHandler {
    public static void updateRating(List<Account> accList) {
        for (Account acc : accList) {
            if (acc.AnnualRevenue > 500000) {
                acc.Rating = 'Coo';
            }
        }
    }
}
