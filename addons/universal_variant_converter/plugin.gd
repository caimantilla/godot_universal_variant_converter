@tool
extends EditorPlugin


const UNIVERSAL_TYPE_CONVERTER := preload("universal_type_converter.gd")


func _enter_tree() -> void:
	add_custom_type("UniversalVariantConverter", "RefCounted", UNIVERSAL_TYPE_CONVERTER, null)


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
