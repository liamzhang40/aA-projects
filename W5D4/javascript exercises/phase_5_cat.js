function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function () {
  console.log(`${this.owner} loves ${this.name}`);
};

const josh = new Cat('Josh', 'Joshwa');
const meo = new Cat('Meo', 'Marry');
const lin = new Cat('Lin', 'Ben');

// josh.cuteStatement();

Cat.prototype.cuteStatement = function () {
  console.log(`Everyone loves ${this.name}!`);
};

// josh.cuteStatement();

Cat.prototype.meow = function () {
  console.log(`${this.name} says MEOW!`);
};

// reassign the method on instance on meo only
meo.meow = function () {
  console.log(`${this.name} says MEOW really really loud!`);
};
