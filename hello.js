
class chart {

    jj() {
        return 'chart'
    }
}

class mosab extends chart {
    get jj() {
        return 'extend'
    }
}


let x = new chart();
let y = new mosab();

console.log(x.jj());
console.log(y.jj);