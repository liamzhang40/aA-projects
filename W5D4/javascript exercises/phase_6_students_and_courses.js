function Student (fname, lname) {
  this.fname = fname;
  this.lname = lname;
  this.courses = [];
}

Student.prototype.name = function () {
  return `${this.fname} ${this.lname}`;
};

Student.prototype.enroll = function (course) {
  if (!this.courses.includes(course)) {
    this.courses.push(course);
    course.students.push(this);
  }
};

Student.prototype.courseLoad = function () {
  const hash = {}; // const hash = new Object() upsets lint???
  this.courses.forEach(course => {
    if (hash[course.department] === undefined) {
      hash[course.department] = course.credits;
    } else {
      hash[course.department] += course.credits;
    }
  });
  return hash;
};


function Course (name, department, credits, days, time_block) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
  this.days = days;
  this.time_block = time_block;
}

Course.prototype.addStudent = function (Student) {
  Student.enroll(this);
};

Course.prototype.conflictsWith = function(course) {
  if (this.time_block !== course.time_block) return false;
  return this.days.some(day => course.days.includes(day));
};


let student1 = new Student("Nigel", "Leffler");
let course1 = new Course("101", "CS", 3, ["mon", "wed", "fri"], 1);
let course2 = new Course("201", "CS", 3, ["wed"], 1);
let course3 = new Course("301", "ENG", 3, ["tue"], 1);
let course4 = new Course("401", "BIO", 3, ["mon", "wed", "fri"], 2);
student1.enroll(course1);
student1.enroll(course3);
student1.enroll(course2);
// console.log(course1);
// console.log(student1);
// console.log(student1.courseLoad());
console.log('should be true = ' + course1.conflictsWith(course2));
console.log('should be false = ' + course1.conflictsWith(course3));
console.log('should be false = ' + course1.conflictsWith(course4));
