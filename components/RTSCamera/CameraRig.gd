extends Spatial

export var pan_speed = 10
export var zoom_speed = 1
export var mouse_sensitivity = 0.2
export var border_thickness = 20
export var max_x = 100
export var min_x = -100
export var max_y = 80
export var min_y = 10
export var max_z = 100
export var min_z = -100

""" RTS camera controls

- pan/zoom with keys
- pan with mouse (viewport edges)
- focus on item
"""

func _focus_on_object(object_id):
	""" when an object is focused on, move the camera to it
	"""
	print("FOCUS_ON_OBJECT", object_id)


func _pan(_delta):
	"""
	"""
	var screen_height = get_viewport().size.y
	var screen_width = get_viewport().size.x
	var mouse_pos = get_viewport().get_mouse_position()

	var in_top_border = mouse_pos[1] < 0 + border_thickness
	var in_bottom_border = mouse_pos[1] > screen_height - border_thickness
	var in_left_border = mouse_pos[0] < 0 + border_thickness
	var in_right_border = mouse_pos[0] > screen_width - border_thickness

	if Input.is_action_pressed("camera_down") || in_bottom_border:
		if not transform.origin.z > max_z:
			translate(Vector3(0, 0, pan_speed * _delta))

	if Input.is_action_pressed("camera_up") || in_top_border:
		if not transform.origin.z < min_z:
			translate(Vector3(0, 0, -pan_speed * _delta))

	if Input.is_action_pressed("camera_left") || in_left_border:
		if not transform.origin.x < min_x:
			translate(Vector3(-pan_speed * _delta, 0, 0))

	if Input.is_action_pressed("camera_right") || in_right_border:
		if not transform.origin.x > max_x:
			translate(Vector3(pan_speed * _delta, 0, 0))


func _zoom(event):
	""" zoom event including keeping track of zoom speed
	"""
	if event.is_action_pressed("camera_zoom_out"):
		if not transform.origin.y > max_y:
			translate(Vector3(0, zoom_speed, 0))

	if event.is_action_pressed("camera_zoom_in"):
		if not transform.origin.y < min_y:
			translate(Vector3(0, -zoom_speed, 0))


var is_rotating = false
func _center_on_mouse(event):
	# var screen_height = get_viewport().size.y
	# var screen_width = get_viewport().size.x

	if event is InputEventMouseButton:
		if event.is_action_pressed("camera_rotate"):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			is_rotating = true
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			is_rotating = false

	if event is InputEventMouseMotion and is_rotating:
		rotate_y(deg2rad(-event.relative.x*mouse_sensitivity))
		$Camera.rotate_x(deg2rad(-event.relative.y*mouse_sensitivity))
		# get_viewport().warp_mouse(Vector2(screen_height/2,screen_width/2))


func _process(_delta):
	_pan(_delta)


func _input(event):
	# ideally we would invoke zoom from within _process like the other actions
	# and make use of delta however godot considers middle mouse events as purely binary
	_zoom(event)
	_center_on_mouse(event)


func _on_store_changed(name, state):
	if name != "focused_item":
		return

	_focus_on_object(state)

