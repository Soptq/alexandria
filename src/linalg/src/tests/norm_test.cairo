use alexandria_linalg::norm::norm;

// the following trait is not safe, it is only used for testing.
impl u128_to_u32 of Into<u128, u32> {
    fn into(self: u128) -> u32 {
        self.try_into().unwrap()
    }
}

#[test]
#[available_gas(2000000)]
fn norm_test_1() {
    let mut array: Array<u128> = array![3, 4];
    assert(norm(array.span(), 2, 10) == 5, 'invalid l2 norm');
}

#[test]
#[available_gas(2000000)]
fn norm_test_2() {
    let mut array: Array<u128> = array![3, 4];
    assert(norm(array.span(), 1, 10) == 7, 'invalid l1 norm');
}

#[test]
#[available_gas(2000000)]
fn norm_test_3() {
    let mut array: Array<u128> = array![3, 4];
    assert(norm(array.span(), 0, 10) == 2, 'invalid l1 norm');
}

#[test]
#[available_gas(2000000)]
fn norm_test_into() {
    let mut array: Array<u32> = array![3, 4];
    assert(norm(array.span(), 2, 10) == 5, 'invalid l2 norm');
}
