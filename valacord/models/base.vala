// valacord © Nikolas Wipper 2019

namespace discord {
	public abstract class Base {
		protected Snowflake _id;

		protected string get_string_member_with_default(Json.Object obj, string member_name, string default_value) {
			if (obj.has_member(member_name) && !obj.get_null_member(member_name))
			{
				return obj.get_string_member(member_name);
			}
			return default_value;
		}

		protected int64 get_int_member_with_default(Json.Object obj, string member_name, int64 default_value) {
			if (obj.has_member(member_name) && !obj.get_null_member(member_name))
			{
				return obj.get_int_member(member_name);
			}
			return default_value;
		}

		protected bool get_boolean_member_with_default(Json.Object obj, string member_name, bool default_value) {
			if (obj.has_member(member_name) && !obj.get_null_member(member_name))
			{
				return obj.get_boolean_member(member_name);
			}
			return default_value;
		}

		protected Json.Array get_array_member_with_default(Json.Object obj, string member_name, Json.Array default_value) {
			if (obj.has_member(member_name) && !obj.get_null_member(member_name))
			{
				return obj.get_array_member(member_name);
			}
			return default_value;
		}

		protected Json.Object get_object_member_with_default(Json.Object obj, string member_name, Json.Object default_value) {
			if (obj.has_member(member_name) && !obj.get_null_member(member_name))
			{
				return obj.get_object_member(member_name);
			}
			return default_value;
		}

		public uint64 id { get { return this._id.id; } }
	}
}