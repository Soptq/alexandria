use alexandria_numeric::cumprod::cumprod;

#[test]
#[available_gas(2000000)]
fn cumprod_test() {
    let xs: Array<u64> = array![3, 5, 7];
    let ys = cumprod(xs.span());
    assert(*ys[0] == *xs[0], 'wrong value at index 0');
    assert(*ys[1] == *xs[0] * *xs[1], 'wrong value at index 1');
    assert(*ys[2] == *xs[0] * *xs[1] * *xs[2], 'wrong value at index 2');
}

#[test]
#[should_panic(expected: ('Array must have at least 1 elt',))]
#[available_gas(2000000)]
fn cumprod_test_revert_empty() {
    let xs: Array<u64> = array![];
    let ys = cumprod(xs.span());
}
