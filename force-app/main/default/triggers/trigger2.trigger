trigger trigger2 on Account (before insert) {
    trigger_example.tri1(trigger.new);
}