public class AccountRatingTriggerHandler {
    public static void updateRating(List<Account> accList) {
        for (Account acc : accList) {
            if (acc.AnnualRevenue > 100) {
                acc.Rating = 'Hot';
            }
            else {
                acc.Rating = 'Cold';
            }
        }
    }
}
