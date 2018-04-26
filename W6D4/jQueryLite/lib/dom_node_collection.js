class DOMNodeCollection {
  constructor(HTMLArray) {
    this.HTMLArray = HTMLArray;
  }

  html(str) {
    if (str) {
      this.HTMLArray.forEach(el => {
        let newEl = document.createElement(str);
        el.appendChild(newEl);
      });
    }
    else {
      return this.HTMLArray[0].children[0];
    }
  }

  empty() {
    this.HTMLArray.forEach(parent => {
      const kids = [].slice.call(parent.children, 0);
      kids.forEach(child => {
        parent.removeChild(child);
      });
    });
  }

  append(arg){
    this.HTMLArray.forEach(parent => {
      if(arg.constructor.name === 'String'){
        parent.innerHTML += arg;
      } else if(arg instanceof HTMLElement) {
        parent.appendChild(arg);
      } else {
        arg.HTMLArray.forEach(htmlEl => {
          parent.appendChild(htmlEl);
        });
      }
    });
  }

  addClass(arg){
    this.HTMLArray.forEach(el => {
      el.className = arg;
    });
  }

  removeClass(){
    this.HTMLArray.forEach(el => {
      el.className = "";
    });
  }

  attr(name, value){
    const res = [];
    if (typeof value === 'undefined'){
      this.HTMLArray.forEach(el => {
        res.push(el.getAttribute(name));
      });
      return res;
    }
    else {
      this.HTMLArray.forEach(el => {
        el.setAttribute(name, value);
      });
    }
  }

  children(){
    let kids = [];
    this.HTMLArray.forEach(parent => {
      kids = kids.concat([].slice.call(parent.children, 0));
    });
    return new DOMNodeCollection(kids);
  }

  parent() {
    let parents = [];
    this.HTMLArray.forEach(child => {
      // debugger;
      if (!(parents.includes(child.parentNode))) {
        parents.push(child.parentNode);
      }
    });
    return new DOMNodeCollection(parents);
  }

  find(arg) {
    let arr = [];
    this.HTMLArray.forEach(parent => {
      const kidz = parent.querySelectorAll(arg);
      const kidzz = [].slice.call(kidz, 0);
      arr = arr.concat(kidzz);
    });
    return arr;
  }

  remove() {
    this.HTMLArray.forEach(el => {
      el.remove();
    });

    this.HTMLArray = [];
  }

  on(type, callback) {
    this.HTMLArray.forEach(el => {
      el.addEventListener(type, callback);
      el.callback = callback;
    });
  }

  off(type) {
    this.HTMLArray.forEach(el => {
      // const callback = el.getAttribute('callback');
      // debugger
      el.removeEventListener(type, el.callback);
    });
  }
}


module.exports = DOMNodeCollection;
