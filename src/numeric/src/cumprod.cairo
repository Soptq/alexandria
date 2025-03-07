//! The cumulative product of the elements.

/// Compute the cumulative product of a sequence.
/// # Arguments
/// * `sequence` - The sequence to operate.
/// # Returns
/// * `Array<T>` - The cumulative product of sequence.
fn cumprod<T, +Mul<T>, +Copy<T>, +Drop<T>,>(mut sequence: Span<T>) -> Array<T> {
    // [Check] Inputs
    assert(sequence.len() >= 1, 'Array must have at least 1 elt');

    // [Compute] Interpolation
    let mut array = array![];
    let mut prev_value = *sequence.pop_front().unwrap();
    array.append(prev_value);
    loop {
        match sequence.pop_front() {
            Option::Some(current_value) => {
                let prod = *current_value * prev_value;
                array.append(prod);
                prev_value = prod;
            },
            Option::None => { break; },
        };
    };
    array
}
