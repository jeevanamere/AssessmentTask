public class AccountRatingTriggerHandler {
    public static void updateRating(List<Account> accList) {
        for (Account acc : accList) {
            if (acc.AnnualRevenue > 5000000) {
                acc.Rating = 'Hot';
            }
            else {
                acc.Rating = 'Hot';
            }
        }
    }
}
