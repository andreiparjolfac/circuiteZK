pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template QuinSelector(n){
    signal input ins[n];
    signal input k;
    signal output out;

    assert(k>=0);
    assert(k<=n);

    out<--ins[k];
}

component main = QuinSelector(5);

/* INPUT = {
    "ins":["1","2","3","4","5"],
    "k":"2"
} */
