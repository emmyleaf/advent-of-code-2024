import day2
import gleeunit/should
import simplifile as file

const example_input = "7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9"

pub fn day2_star1_example_test() {
  day2.star1(example_input)
  |> should.equal(2)
}

pub fn day2_star1_actual_test() {
  let assert Ok(input) = file.read("input/day2.txt")
  day2.star1(input)
  |> should.equal(490)
}

pub fn day2_star2_example_test() {
  day2.star2(example_input)
  |> should.equal(4)
}

pub fn day2_star2_actual_test() {
  let assert Ok(input) = file.read("input/day2.txt")
  day2.star2(input)
  |> should.equal(536)
}
