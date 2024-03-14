template GreaterThan(n){
    assert(n<=252);
    signal input ins[2];
    signal output out;

    component lt = LessThan(n);
    lt.ins[0]<==ins[1];
    lt.ins[1]<==ins[0];

    lt.out==>out;
}
