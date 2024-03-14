pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

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

component main = Num2Bits(8);

/* INPUT = {
    "in": "123"
} */
