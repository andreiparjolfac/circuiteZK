pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

include "circomlib/mimcsponge.circom";


template revealSigner(){
    signal input sk;
    signal input pk;

    signal input msgHash;
    signal input attestation;

    signal pk_from_sk;

    component pkGen = MiMCSponge(1, 220, 1);
    sk==>pkGen.ins[0];
    0==>pkGen.k;
    pkGen.outs[0]==>pk_from_sk;

    pk_from_sk===pk;

    component attGen = MiMCSponge(2,220,1);

    signal attestation_from_sk;
    sk==>attGen.ins[0];
    msgHash==>attGen.ins[1];
    0==>attGen.k;
    attGen.outs[0]==>attestation_from_sk;

    attestation_from_sk===attestation;

}


template GroupSig () {
    signal input sk;
    
    signal input pk1;
    signal input pk2;
    signal input pk3;

    signal input msgHash;

    signal output attestation;

    signal pk;

    component pkGen = MiMCSponge(1, 220, 1);

    pkGen.ins[0]<==sk;
    pkGen.k<==0;
    pkGen.outs[0]==>pk;

    signal inter; 
    inter<==(pk1-pk)*(pk2-pk);
    inter*(pk3-pk)===0;

    component attestGen = MiMCSponge(2,220,1);
    attestGen.ins[0]<==sk;
    attestGen.ins[1]<==msgHash;
    attestGen.k<==0;
    attestation<==attestGen.outs[0];



}

component main { public [ pk,msgHash,attestation ] } = revealSigner();


/*
INPUT={
    "sk":"1234",
    "pk":"7775487299549827675993462716748178228268183973561749683426836418698345365613",
    "msgHash":"101",
    "attestation":"16521430005882446462501417739063040515290304793054830279393208813927489155963"
}

*/
