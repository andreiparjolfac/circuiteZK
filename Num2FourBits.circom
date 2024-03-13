pragma circom 2.1.6;

include "circomlib/poseidon.circom";

template Num2FourBits(){
    signal input in;
    signal output out[4];

    var res =0;
    var step=1;

    

    for(var i=0;i<4;i++){
        out[i]<-- (in>>i)&1;
        res+=out[i]*step;
        step+=step;   
    }

    in===res;

}

component main  = Num2FourBits();

/* INPUT = {
    "in":"7"
} */
