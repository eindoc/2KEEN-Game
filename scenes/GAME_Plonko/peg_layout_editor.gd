@tool
extends Node2D

@export var save_path: String = "res://scenes/GAME_Plonko/levels/layout_01.json"
@export var save_layout: bool = false:
    set(value):
        if value and Engine.is_editor_hint():
            _save_pegs()
            save_layout = false  # reset the button

func _save_pegs():
    print("_save_pegs called")
    print("children count: ", get_children().size())
    
    var pegs = []
    for child in get_children():
        print("found child: ", child.name)
        pegs.append({ "x": child.position.x, "y": child.position.y })
    
    print("saving ", pegs.size(), " pegs to ", save_path)
    var file = FileAccess.open(save_path, FileAccess.WRITE)
    if file == null:
        print("ERROR: could not open file. Error code: ", FileAccess.get_open_error())
        return
    file.store_string(JSON.stringify(pegs, "\t"))
    file.close()
    print("done!")