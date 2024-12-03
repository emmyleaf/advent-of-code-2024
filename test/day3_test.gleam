import day3
import gleeunit/should
import simplifile as file

pub fn day3_star1_example_test() {
  "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
  |> day3.star1
  |> should.equal(161)
}

pub fn day3_star1_actual_test() {
  let assert Ok(input) = file.read("input/day3.txt")
  day3.star1(input)
  |> should.equal(173_517_243)
}

pub fn day3_star2_example_test() {
  "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
  |> day3.star2
  |> should.equal(48)
}

pub fn day3_star2_actual_test() {
  let assert Ok(input) = file.read("input/day3.txt")
  day3.star2(input)
  |> should.equal(100_450_138)
}
