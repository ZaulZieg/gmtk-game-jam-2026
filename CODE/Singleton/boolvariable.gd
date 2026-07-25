extends Node

signal change_update

@onready var opening_dialog : bool = false
@onready var hallway1_light_left : bool = true
@onready var hallway1_light_right : bool = true
@onready var hallway2_light_left : bool = true
@onready var hallway2_light_right : bool = true
@onready var player_flashlisght : bool = false

var ghost_in_hallway1 : bool = false
var ghost_in_hallway2 : bool = false
var ghost_in_flashlight : bool = false
var hallway1_light_on : bool = false
var hallway2_light_on : bool = false

func update_sanity():
	hallway1_light_on = hallway1_light_left or hallway1_light_right
	hallway2_light_on = hallway2_light_left or hallway2_light_right
	var status : bool = false
	if Global.player_in_room == "Hallway_1":
		if hallway1_light_on and ghost_in_hallway1:
			status = true
		if hallway1_light_on != true and player_flashlisght != true:
			status = true
	elif Global.player_in_room == "Hallway_2":
		if hallway2_light_on and ghost_in_hallway2:
			status = true
		if !hallway2_light_on and !player_flashlisght:
			status = true
	if ghost_in_flashlight:
		status = true
	
	change_update.emit(status)
