
extends Node

const SAVE_PATH = "user://savegame.json"

func save_game():
	var save_data = {
		"player_position": {
			"x": 100,
			"y": 200
		},
		"level": 1,
		"coins": 50
	}

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

	print("Game saved!")

func load_game():
	if not FileAccess.file_exists(SAVE_PATH):
		print("No save file found!")
		return

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json_string = file.get_as_text()
	file.close()

	var json = JSON.new()
	var error = json.parse(json_string)

	if error != OK:
		print("Failed to load save!")
		return

	var save_data = json.data

	print("Loaded game!")
	print(save_data)
	
	return save_data
	
func new_game():
	var save_data = {
		"player_position": {
			"x": 100,
			"y": 200
		},
		"level": 1,
		"coins": 0
	}

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

	print("New game created and saved!")
	return save_data
