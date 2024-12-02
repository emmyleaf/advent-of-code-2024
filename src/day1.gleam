import gleam/int
import gleam/list
import gleam/string

fn total_distance_between_lists(lists: #(List(String), List(String))) -> Int {
  let first = list.filter_map(lists.0, int.parse) |> list.sort(by: int.compare)
  let second = list.filter_map(lists.1, int.parse) |> list.sort(by: int.compare)
  list.map2(first, second, int.subtract)
  |> list.map(int.absolute_value)
  |> list.fold(0, int.add)
}

fn similarity_score(lists: #(List(String), List(String))) -> Int {
  let first = list.filter_map(lists.0, int.parse)
  let second = list.filter_map(lists.1, int.parse)
  list.map(first, fn(x) { x * list.count(second, fn(y) { x == y }) })
  |> list.fold(0, int.add)
}

pub fn star1(input: String) -> Int {
  string.split(input, on: "\n")
  |> list.filter_map(string.split_once(_, on: "   "))
  |> list.unzip
  |> total_distance_between_lists
}

pub fn star2(input: String) -> Int {
  string.split(input, on: "\n")
  |> list.filter_map(string.split_once(_, on: "   "))
  |> list.unzip
  |> similarity_score
}
