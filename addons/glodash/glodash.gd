static func shallow_copy(dict):
	return shallow_merge(dict, {})


static func shallow_merge(src_dict, dest_dict):
	for i in src_dict:
		dest_dict[i] = src_dict[i]
	return dest_dict
