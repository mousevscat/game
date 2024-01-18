extends Node

@export var gameSave:GameSave = GameSave.new()

func saveGame(SaveFilePath:String):
	var Player:Node2D = get_tree().current_scene.get_node("player")
	if Player:
		gameSave.SavedPlayer.pack(Player)
		gameSave.PlayerPosition = Player.global_position
		Player.free()
	gameSave.SaveScene.pack(get_tree().current_scene)
	ResourceSaver.save(gameSave, SaveFilePath)
	loadGame(SaveFilePath)
	
func loadGame(SaveFilePath:String):
	gameSave = load(SaveFilePath)
	var tree:SceneTree = get_tree()
	tree.change_scene_to_packed(gameSave.SaveScene)
	var player:Node2D = gameSave.SavedPlayer.instantiate()
	await  tree.node_added
	get_tree().current_scene.add_child(player)
	player.owner = get_tree().current_scene
	player.global_position = gameSave.PlayerPosition
