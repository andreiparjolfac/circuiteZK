pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

template IsZero () {
    signal input in;
    signal output out;

    signal inv<-- in==0 ? 0 : 1/in;

    out<== 1 - in*inv;

    out*in ===0;


}

component main = IsZero();

/* INPUT = {
    "in": "0"
} */
