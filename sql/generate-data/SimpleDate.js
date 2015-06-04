function SimpleDate(yy, mm, dd) {
    this.yy = yy;
    this.mm = mm;
    this.dd = dd;
}

SimpleDate.prototype.addMonth = function() {
    this.mm++;
    if (this.mm > 12) {
        this.mm = 1;
        this.yy++;
    }
};

SimpleDate.prototype.clone = function() {
    return new SimpleDate(this.yy, this.mm, this.dd);
};

SimpleDate.prototype.toString = function() {
    return this.yy + '-' + padZero(this.mm) + '-' + padZero(this.dd);
};

// Is this date less than or equal to the other date
SimpleDate.prototype.lte = function(other) {
    return this.toString() <= other.toString();
};

function padZero(num) {
    return (num < 10) ? ('0' + num) : num.toString();
}

module.exports = SimpleDate;
