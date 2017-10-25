/******************************************************************/
/*   It is required to use Array.prototype methods                */
/*   when iterating over a stamp collections's array of stamps.   */
/******************************************************************/

var StampCollection = function(stamps) {
  this.stamps = stamps;
}

StampCollection.prototype.stampNamed = function(nameWanted) {
  return foundStamp = this.stamps.find(function(stamp){
    return stamp.name === nameWanted;
  });
}

StampCollection.prototype.stampsIssued = function(yearWanted) {
  return foundStamps = this.stamps.filter(function(stamp){
    return stamp.issueDate === yearWanted;
  });
}

StampCollection.prototype.value = function() {
  return totalValueOfStamps = this.stamps.reduce(function(sum, value){
    return sum + value.maximumAppraisal();
  },0);
}

