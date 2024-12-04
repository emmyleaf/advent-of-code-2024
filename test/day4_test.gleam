import day4
import gleeunit/should
import simplifile as file

const example_input = "MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX"

pub fn day4_star1_example_test() {
  day4.star1(example_input)
  |> should.equal(18)
}

pub fn day4_star1_actual_test() {
  let assert Ok(input) = file.read("input/day4.txt")
  day4.star1(input)
  |> should.equal(2493)
}

pub fn day4_star2_example_test() {
  day4.star2(example_input)
  |> should.equal(9)
}

pub fn day4_star2_actual_test() {
  let assert Ok(input) = file.read("input/day4.txt")
  day4.star2(input)
  |> should.equal(1890)
}
