pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template LessThan (n) {
    assert(n<=252);
    signal input ins[2];
    signal output out;

    component n2b = Num2Bits(n+1);
    n2b.in<==ins[0]+(1<<n)-ins[1];


    out<==1-n2b.out[n];


}

template Num2Bits(n){
    signal input in;
    signal output out[n];

    var res=0;
    var step=1;

    for(var i=0;i<n;i++){
        out[i]<--(in>>i)&1;
        out[i]*(out[i]-1)===0;
        res+=out[i]*step;
        step+=step;
    }

    res === in;
}

component main = LessThan(4);

/* INPUT = {
    "ins":["9","7"]
} */
