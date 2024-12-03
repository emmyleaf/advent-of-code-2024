import gleam/int
import gleam/list
import gleam/string

fn parse_int_lists(input: String) -> #(List(Int), List(Int)) {
  let lists =
    string.split(input, on: "\n")
    |> list.filter_map(string.split_once(_, on: "   "))
    |> list.unzip
  #(list.filter_map(lists.0, int.parse), list.filter_map(lists.1, int.parse))
}

fn total_distance_between_lists(lists: #(List(Int), List(Int))) -> Int {
  let first = list.sort(lists.0, by: int.compare)
  let second = list.sort(lists.1, by: int.compare)
  list.map2(first, second, int.subtract)
  |> list.map(int.absolute_value)
  |> int.sum
}

fn similarity_score(lists: #(List(Int), List(Int))) -> Int {
  list.map(lists.0, fn(x) { x * list.count(lists.1, fn(y) { x == y }) })
  |> int.sum
}

pub fn star1(input: String) -> Int {
  parse_int_lists(input) |> total_distance_between_lists
}

pub fn star2(input: String) -> Int {
  parse_int_lists(input) |> similarity_score
}
