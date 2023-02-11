@tool
extends RefCounted



# Not useful right now
static func save_variant(value):
	pass


# not useful right now
static func load_variant(value, current):
	pass











static func save_null(value) -> Object:
	return null

static func load_null(value) -> Object:
	return null



static func save_bool(value: bool) -> int:
	if value:
		return 1
	return 0

static func load_bool(value) -> bool:
	if value:
		return true
	return false




static func save_int(value: int) -> int:
	return value

static func load_int(value) -> int:
	match typeof(value):
		TYPE_INT:
			return value
		TYPE_FLOAT:
			return roundi(value)
	return 0




static func save_float(value: float) -> float:
	return value


static func load_float(value) -> float:
	match typeof(value):
		TYPE_INT:
			return float(value)
		TYPE_FLOAT:
			return value
	return 0.0




static func save_String(value: String) -> String:
	return value

static func load_String(value) -> String:
	match typeof(value):
		TYPE_STRING:
			return value
		TYPE_STRING_NAME:
			return String(value)
	return ''





static func save_Vector2(value: Vector2) -> Array [float]:
	var array: Array [float] = [
		save_float(value[0]), save_float(value[1])
	]
	return array

static func load_Vector2(value) -> Vector2:
	var v2 := Vector2.ZERO
	
	if typeof(value) == TYPE_ARRAY:
		var array_size: int = clampi(value.size(), 0, 2)
		for i in array_size:
			v2[i] = load_float(value[i])
	
	return v2



static func save_Vector2i(value: Vector2i) -> Array [int]:
	var array: Array [int] = [ 
		save_int(value[0]), save_int(value[1])
	]
	return array

static func load_Vector2i(value) -> Vector2i:
	var v2i := Vector2i.ZERO
	
	if typeof(value) == TYPE_ARRAY:
		var array_size := clampi(value.size(), 0, 2)
		for i in array_size:
			v2i[i] = load_int(value[i])
	
	return v2i




static func save_Rect2(value: Rect2) -> Array [float]:
	var array: Array [float] = [
		save_float(value.end[0]), save_float(value.end[1]),
		save_float(value.position[0]), save_float(value.position[1]),
		save_float(value.size[0]), save_float(value.size[1]),
	]
	return array

static func load_Rect2(value) -> Rect2:
	var rect := Rect2()
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 5:
			rect.end[0] = load_float(value[0])
			rect.end[1] = load_float(value[1])
			rect.position[0] = load_float(value[2])
			rect.position[1] = load_float(value[3])
			rect.size[0] = load_float(value[4])
			rect.size[1] = load_float(value[5])
	
	return rect


static func save_Rect2i(value: Rect2i) -> Array [int]:
	var array: Array [int] = [
		save_int(value.end[0]), save_int(value.end[1]),
		save_int(value.position[0]), save_int(value.position[1]),
		save_int(value.size[0]), save_int(value.size[1]),
	]
	return array

static func load_Rect2i(value) -> Rect2i:
	var rect := Rect2i()
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 5:
			rect.end[0] = load_int(value[0])
			rect.end[1] = load_int(value[1])
			rect.position[0] = load_int(value[2])
			rect.position[1] = load_int(value[3])
			rect.size[0] = load_int(value[4])
			rect.size[1] = load_int(value[5])
	
	return rect






static func save_Vector3(value: Vector3) -> Array [float]:
	var array: Array [float] = [
		save_float(value[0]), save_float(value[1]), save_float(value[2])
	]
	return array

static func load_Vector3(value) -> Vector3:
	var v3 := Vector3.ZERO
	
	if typeof(value) == TYPE_ARRAY:
		var array_size := clampi(value.size(), 0, 3)
		for i in array_size:
			v3[i] = load_float(value[i])
	
	return v3




static func save_Vector3i(value: Vector3i) -> Array [int]:
	var array: Array [int] = [
		save_int(value[0]), save_int(value[1]), save_int(value[2])
	]
	return array

static func load_Vector3i(value) -> Vector3i:
	var v3i := Vector3i.ZERO
	
	if typeof(value) == TYPE_ARRAY:
		var array_size := clampi(value.size(), 0, 3)
		for i in array_size:
			v3i[i] = load_int(value[i])
	
	return v3i



static func save_Transform2D(value: Transform2D) -> Array [float]:
	var array: Array [float] = [
		save_float(value.origin[0]), save_float(value.origin[1]),
		save_float(value.x[0]), save_float(value.x[1]),
		save_float(value.y[0]), save_float(value.y[1]),
	]
	return array


static func load_Transform2D(value) -> Transform2D:
	var transform := Transform2D()
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 5:
			transform.origin[0] = load_float(value[0])
			transform.origin[1] = load_float(value[1])
			transform.x[0] = load_float(value[2])
			transform.x[1] = load_float(value[3])
			transform.y[0] = load_float(value[4])
			transform.y[1] = load_float(value[5])
	
	return transform





static func save_Vector4(value: Vector4) -> Array [float]:
	var array: Array [float] = [
		save_float(value.w), save_float(value.x), save_float(value.y), save_float(value.z)
	]
	return array

static func load_Vector4(value) -> Vector4:
	var v4 := Vector4.ZERO
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 3:
			v4.w = load_float(value[0])
			v4.x = load_float(value[1])
			v4.y = load_float(value[2])
			v4.z = load_float(value[3])
	
	return v4



static func save_Vector4i(value: Vector4i) -> Array [int]:
	var array: Array [int] = [
		save_int(value.w), save_int(value.x), save_int(value.y), save_int(value.z)
	]
	return array

static func load_Vector4i(value) -> Vector4i:
	var v4i := Vector4i.ZERO
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 3:
			v4i.w = load_int(value[0])
			v4i.x = load_int(value[1])
			v4i.y = load_int(value[2])
			v4i.z = load_int(value[3])
	
	return v4i




static func save_Plane(value: Plane) -> Array [float]:
	var array: Array [float] = [
		save_float(value.x), save_float(value.y), save_float(value.z),
		save_float(value.d),
		save_float(value.normal.x), save_float(value.normal.y), save_float(value.normal.z),
	]
	return array

static func load_Plane(value) -> Plane:
	var plane := Plane()
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 6:
			plane.x = load_float(value[0])
			plane.y = load_float(value[1])
			plane.z = load_float(value[2])
			plane.d = load_float(value[3])
			plane.normal.x = load_float(value[4])
			plane.normal.y = load_float(value[5])
			plane.normal.z = load_float(value[6])
	
	return plane





static func save_Quaternion(value: Quaternion) -> Array [float]:
	var array: Array [float] = [
		save_float(value.w), save_float(value.x), save_float(value.y), save_float(value.z)
	]
	return array

static func load_Quaternion(value) -> Quaternion:
	var quaternion := Quaternion()
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 3:
			quaternion.w = load_float(value[0])
			quaternion.x = load_float(value[1])
			quaternion.y = load_float(value[2])
			quaternion.z = load_float(value[3])
	
	return quaternion






static func save_AABB(value: AABB) -> Array [float]:
	var array: Array [float] = [
		save_float(value.end.x), save_float(value.end.y), save_float(value.end.z),
		save_float(value.position.x), save_float(value.position.y), save_float(value.position.z),
		save_float(value.size.x), save_float(value.size.y), save_float(value.size.z),
	]
	return array

static func load_AABB(value) -> AABB:
	var aabb := AABB()
	
	if typeof(value) == TYPE_ARRAY:
		if value.size() > 8:
			aabb.end.x = load_float(value[0])
			aabb.end.y = load_float(value[1])
			aabb.end.z = load_float(value[2])
			aabb.position.x = load_float(value[3])
			aabb.position.y = load_float(value[4])
			aabb.position.z = load_float(value[5])
			aabb.size.x = load_float(value[6])
			aabb.size.y = load_float(value[7])
			aabb.size.z = load_float(value[8])
	
	return aabb





static func save_Basis(value: Basis) -> Array [float]:
	var array: Array [float] = [
		save_float(value.x.x), save_float(value.x.y), save_float(value.x.z),
		save_float(value.y.x), save_float(value.y.y), save_float(value.y.z),
		save_float(value.z.x), save_float(value.z.y), save_float(value.z.z),
	]
	return array

static func load_Basis(value) -> Basis:
	var basis := Basis()
	
	if typeof(value) == TYPE_ARRAY and value.size() > 8:
		basis.x.x = load_float(value[0])
		basis.x.y = load_float(value[1])
		basis.x.z = load_float(value[2])
		basis.y.x = load_float(value[3])
		basis.y.y = load_float(value[4])
		basis.y.z = load_float(value[5])
		basis.z.x = load_float(value[6])
		basis.z.y = load_float(value[7])
		basis.z.z = load_float(value[8])
	
	return basis


static func save_Transform3D(value: Transform3D) -> Array [float]:
	var array: Array [float] = save_Basis(value.basis)
	array.push_back(save_float(value.origin.x))
	array.push_back(save_float(value.origin.y))
	array.push_back(save_float(value.origin.z))
	
	return array

static func load_Transform3D(value) -> Transform3D:
	var transform := Transform3D()
	
	if typeof(value) == TYPE_ARRAY and value.size() > 11:
		transform.basis = load_Basis(value)
		transform.origin.x = load_float(value[9])
		transform.origin.y = load_float(value[10])
		transform.origin.z = load_float(value[11])
	
	return transform




static func save_Projection(value: Projection) -> Array [float]:
	var array: Array [float] = []
	
	array.append_array(save_Vector4(value.w))
	array.append_array(save_Vector4(value.x))
	array.append_array(save_Vector4(value.y))
	array.append_array(save_Vector4(value.z))
	
	return array

static func load_Projection(value) -> Projection:
	var projection := Projection()
	
	if typeof(value) == TYPE_ARRAY and value.size() > 15:
		var w = value.slice(0, 3)
		var x = value.slice(3, 7)
		var y = value.slice(7, 11)
		var z = value.slice(11, 15)
		projection.w = load_Vector4(w)
		projection.x = load_Vector4(x)
		projection.y = load_Vector4(y)
		projection.z = load_Vector4(z)
	
	return projection





## Used for accessing each channel property when loading a color.
const _COLOR_INT_STRING: Dictionary = { 0: &'r', 1: &'g', 2: &'b', 3: &'a' }

static func save_Color(value: Color, include_alpha: bool = true) -> Array [float]:
	if include_alpha:
		var array: Array [float] = [ value.r, value.g, value.b, value.a ]
		return array
	else:
		var array: Array [float] = [ value.r, value.g, value.b ]
		return array

static func load_Color(value) -> Color:
	var color := Color.WHITE
	
	if typeof(value) == TYPE_ARRAY:
		var array_size := clampi(value.size(), 0, 4)
		for i in array_size:
			var property_name: StringName = _COLOR_INT_STRING.get(i, &'')
			color[property_name] = load_float(value[i])
	
	return color






static func save_StringName(value: StringName) -> String:
	return String(value)

static func load_StringName(value) -> StringName:
	match typeof(value):
		TYPE_STRING_NAME:
			return value
		TYPE_STRING:
			return StringName(value)
	return &''





static func save_NodePath(value: NodePath) -> String:
	return String(value)

static func load_NodePath(value) -> NodePath:
	match typeof(value):
		TYPE_NODE_PATH:
			return value
		TYPE_STRING:
			return NodePath(value)
	return ^''




# Skipping some



static func save_PackedInt32Array(value: PackedInt32Array) -> Array [int]:
	var array: Array [int] = []
	for i in value:
		array.push_back(save_int(i))
	return array

static func load_PackedInt32Array(value) -> PackedInt32Array:
	var pack := PackedInt32Array()
	if typeof(value) == TYPE_ARRAY:
		for i in value:
			pack.push_back(load_int(i))
	return pack




static func save_PackedInt64Array(value: PackedInt64Array) -> Array [int]:
	var array: Array [int] = []
	for i in value:
		array.push_back(save_int(i))
	return array

static func load_PackedInt64Array(value) -> PackedInt64Array:
	var pack := PackedInt64Array()
	if typeof(value) == TYPE_ARRAY:
		for i in value:
			pack.push_back(load_int(i))
	return pack



static func save_PackedFloat32Array(value: PackedFloat32Array) -> Array [float]:
	var array: Array [float] = []
	for f in value:
		array.push_back(save_float(f))
	return array

static func load_PackedFloat32Array(value: PackedFloat32Array) -> PackedFloat32Array:
	var pack := PackedFloat32Array()
	if typeof(value) == TYPE_ARRAY:
		for f in value:
			pack.push_back(load_float(f))
	return pack


static func save_PackedFloat64Array(value: PackedFloat64Array) -> Array [float]:
	var array: Array [float] = []
	for f in value:
		array.push_back(save_float(f))
	return array

static func load_PackedFloat64Array(value) -> PackedFloat64Array:
	var pack := PackedFloat64Array()
	if typeof(value) == TYPE_ARRAY:
		for f in value:
			pack.push_back(load_float(f))
	return pack






static func save_PackedStringArray(value: PackedStringArray) -> Array [String]:
	var array: Array [String] = []
	for s in value:
		array.push_back(save_String(s))
	return array

static func load_PackedStringArray(value) -> PackedStringArray:
	var pack := PackedStringArray()
	if typeof(value) == TYPE_ARRAY:
		for s in value:
			pack.push_back(load_String(s))
	return pack









static func save_PackedVector2Array(value: PackedVector2Array) -> Array [float]:
	var array: Array [float] = []
	
	for v2i in value:
		array.push_back(save_float(v2i[0]))
		array.push_back(save_float(v2i[1]))
	
	return array

static func load_PackedVector2Array(value) -> PackedVector2Array:
	var pack := PackedVector2Array()
	
	if typeof(value) == TYPE_ARRAY:
		var array_size: int = value.size()
		var half_size: int = array_size / 2
		var current_iteration: int = 1
		for i in half_size:
			var v2 := Vector2(load_float(value[(i * current_iteration)]), load_float(value[(i * current_iteration) + 1]))
			pack.push_back(v2)
			current_iteration += 1
	
	return pack



# It's getting really late and this has gone far beyond my needs.
# I'll finish it some other time. Right now I'll just upload it as it is.

