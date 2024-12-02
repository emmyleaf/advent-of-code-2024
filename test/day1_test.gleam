import day1
import gleeunit/should
import simplifile as file

const example_input = "3   4
4   3
2   5
1   3
3   9
3   3"

pub fn day1_star1_example_test() {
  day1.star1(example_input)
  |> should.equal(11)
}

pub fn day1_star1_actual_test() {
  let assert Ok(input) = file.read("input/day1.txt")
  day1.star1(input)
  |> should.equal(1_830_467)
}

pub fn day1_star2_example_test() {
  day1.star2(example_input)
  |> should.equal(31)
}

pub fn day1_star2_actual_test() {
  let assert Ok(input) = file.read("input/day1.txt")
  day1.star2(input)
  |> should.equal(26_674_158)
}
