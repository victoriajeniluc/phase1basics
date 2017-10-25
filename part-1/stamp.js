/****************************************************************/
/*   It is required to use a for loop                           */
/*   when iterating over a stamp's array of appraisal values.   */
/****************************************************************/
var Stamp = function(args={}) {
  this.name = args.name;
  this.issueDate = args.issueDate;
  this.appraisalValues = args.appraisalValues;
}


Stamp.prototype.total = function() {
  var total = 0;
  for (var i = 0; i < this.appraisalValues.length; i++) {
    total += this.appraisalValues[i];
  }
  return total;
}


Stamp.prototype.averageAppraisal = function() {
  var stamp = this;
  return stamp.total() / this.appraisalValues.length;
}

Stamp.prototype.sorted = function() {
  for (var i = 0; i < this.appraisalValues.length - 1; i++) {
    var min = i;
    for (var j = i + 1; j < this.appraisalValues.length; j++) {
        if (this.appraisalValues[j] < this.appraisalValues[min]) {
            min = j;
        }
      }
     if(min != i) {
        var target = this.appraisalValues[i];
        this.appraisalValues[i] = this.appraisalValues[min];
        this.appraisalValues[min] = target;
    }
  }
  return this.appraisalValues;
}

Stamp.prototype.maximumAppraisal = function() {
  var stamp = this;
  var array = stamp.sorted();
  return array[array.length - 1]
;}


