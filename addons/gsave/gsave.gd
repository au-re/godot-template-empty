extends Node

const GMoment = preload("res://addons/gmoment/gmoment.gd")

const SAVE_FOLDER : String = "res://debug/save"
const SAVE_NAME_TEMPLATE : String = "%s.sav"


static func save(name="save", data={}):
	"""save a file
	"""

	var save = {
		"version": ProjectSettings.get_setting("application/config/version"),
		"time": GMoment.now(),
		"data": data
	}

	var directory : Directory = Directory.new()
	if not directory.dir_exists(SAVE_FOLDER):
		directory.make_dir_recursive(SAVE_FOLDER)

	var save_path = SAVE_FOLDER.plus_file(SAVE_NAME_TEMPLATE % name)

	var file = File.new()
	if file.open(save_path, File.WRITE) != OK:
		print("There was an issue writing the save to %s" % [save_path])
		return

	file.store_line(JSON.print(save))
	file.close()


static func load():
	var save_file_path : String = SAVE_FOLDER.plus_file(SAVE_NAME_TEMPLATE)

	var file : File = File.new()
	if not file.file_exists(save_file_path):
		print("Save file %s doesn't exist" % save_file_path)
		return

	if file.open(save_file_path, File.READ) != OK:
		print("Error opening file")
		return

	var save = JSON.parse(file.get_line()).result
	return save
