trigger AccountRatingTrigger on Account (before insert, before update) {
    AccountRatingTriggerHandler.updateRating(Trigger.new);
}
