trigger trig1 on Account (after insert) {
for (Account a : trigger.new){
        if (a.type == 'Prospect'){
        opportunity op = new opportunity();
            op.name='test';
            op.closedate=system.today();
            op.StageName='prospecting';
            op.AccountId=a.id;
            insert op;
    }
  }
}