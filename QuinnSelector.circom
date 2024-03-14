template QuinnSelector(nChoices){
    signal input ins[nChoices];
    signal input index;
    signal output out;

    component lt = LessThan(4);

    lt.ins[0]<==index;
    lt.ins[1]<==nChoices;
    lt.out === 1;

    component nadder = nAdd(nChoices);
    component eqs[nChoices];

    for(var i=0;i<nChoices;i++){
        eqs[i]=IsEqual();
        eqs[i].ins[0]<==i;
        eqs[i].ins[1]<==index;
        nadder.ins[i]<==eqs[i].out*ins[i];
    }

    out<==nadder.out;

}

component main = QuinnSelector(5);

/* INPUT = {
    "ins":["1","2","3","4","5"],
    "index":"4"
} */
