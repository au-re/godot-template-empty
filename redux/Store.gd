extends Node

const Counter = preload("res://redux/Counter/Counter.gd")
const GRedux = preload("res://addons/gredux/gredux.gd")

var initial_state = {
	"counter": 0
}

var reducers = {
	"counter": funcref(Counter, "reducer")
}

var Store


func on_store_changed(name, state):
	print(state)


func _ready():
	Store = GRedux.new(reducers, initial_state)

	Store.subscribe(self, "on_store_changed")

	Store.dispatch(increment())
	Store.dispatch(increment())
	Store.dispatch(decrement())
