extends Node

const GRedux = preload("res://addons/gredux/gredux.gd")

var Store

const INCREMENT = "INCREMENT"
const DECREMENT = "DECREMENT"


static func increment():
	return { "type": INCREMENT }


static func decrement():
	return { "type": DECREMENT }


static func reducer(state = 0, action):
	if action["type"] == INCREMENT:
		return state + 1

	if action["type"] == DECREMENT:
		return state - 1

	return state
