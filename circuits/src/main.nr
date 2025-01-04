use dep::std::hash::poseidon::bn254::{hash_1, hash_2, hash_3};


fn generate_entropy(private_key: Field, message_hash: Field, nonce: Field) -> Field {
    let intermediate_hash = hash_3([private_key, message_hash, nonce]);
    hash_2([private_key, intermediate_hash])
}


fn main(
    private_key: Field,
    public_key: pub Field,
    message_hash: pub Field
) -> pub [Field; 2] {

    assert(public_key == hash_1([private_key]));

    [
        generate_entropy(private_key, message_hash, 0),
        generate_entropy(private_key, message_hash, 1)
    ]
}



