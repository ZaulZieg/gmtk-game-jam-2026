extends Node

signal change_update

@onready var opening_dialog : bool = false
@onready var hallway1_light_left : bool = true
@onready var hallway1_light_right : bool = true
@onready var hallway2_light_left : bool = true
@onready var hallway2_light_right : bool = true
@onready var player_flashlisght : bool = false

#DOCUMENT ROOM
var doc_room_pc1 : bool = true
var doc_room_pc2 : bool = true
var doc_room_pc3 : bool = true
var doc_room_light : bool = true

#COFFIN ROOM
var cof_room_light : bool = true
var cof_ghost_in_room : bool = false

#MALE TOILET
var male_toilet_light : bool = true
var male_toilet_ghost : bool = false

#FEMALE TOILET
var female_toilet_light : bool = true

#CREMATION_ROOM
var cre_ghost : bool = false
var cre_light : bool = true

#AUTOPSY_ROOM
var aut_ghost : bool = false
var aut_light : bool = true

#FO ROOM
var fo_light : bool = true
var fo_pc : bool = true
var fo_ghost : bool = false


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

	elif Global.player_in_room == "Document_room":
		if !doc_room_light and !player_flashlisght:
			status = true

	elif Global.player_in_room == "Coffin_room":
		if cof_ghost_in_room and cof_room_light:
			status = true
		if !cof_room_light and !player_flashlisght:
			status = true

	elif Global.player_in_room == "Male_bathroom":
		if male_toilet_ghost and male_toilet_light:
			status = true
		if !male_toilet_light and !player_flashlisght:
			status = true

	elif Global.player_in_room == "Female_bathroom":
		if !female_toilet_light and !player_flashlisght:
			status = true

	elif Global.player_in_room == "Cremation_room":
		if cre_ghost and cre_light:
			status = true
		if !cre_light and !player_flashlisght:
			status = true
	
	elif Global.player_in_room == "Autopsy_room":
		if aut_ghost and aut_light:
			status = true
		if !aut_light and !player_flashlisght:
			status = true

	elif Global.player_in_room == "FO":
		if !fo_light and !player_flashlisght:
			status = true
		if !fo_light:
			fo_ghost = true

	if ghost_in_flashlight:
		status = true
	
	change_update.emit(status)
