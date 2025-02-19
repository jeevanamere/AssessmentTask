trigger trigger1 on Account (before insert) {
for (Account a : trigger.new){
  if (a.industry == 'Banking' || a.industry == 'Agriculture'){
  a.ownership='private';
  a.rating='very cold';    
  
  }    
 }   
}