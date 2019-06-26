// valacord © Nikolas Wipper 2019

namespace discord {
	public class Message : Base {
		string _content;

		int64 _timestamp;
		int64? _edited_timestamp;
		int8 _type;

		Snowflake? _nonce;
		Snowflake? _guild_id;
		Snowflake? _webhook_id;
		Snowflake _channel_id;

		bool _tts;
		bool _pinned;
		bool _mention_everyone;

		// @TODO: user/member/activity/application object
		Json.Object _author;
		Json.Object? _member;
		Json.Object? _activity;
		Json.Object? _application;

		// @TODO: role/attachment/embed/reaction object
		List<Json.Object> _mentions;
		List<Json.Object> _mention_roles;
		List<Json.Object> _attachments;
		List<Json.Object> _embeds;
		List<Json.Object>? _reactions;

		// All members use the save _with_default because the gateway does not always send a
		// full message object when fireing a MESSAGE_UPDATE event.
		public Message(Json.Object data) {
			this._content = this.get_string_member_with_default(data, "content", "");

			this._timestamp = this.get_int_member_with_default(data, "timestamp", 0);
			this._edited_timestamp = this.get_int_member_with_default(data, "edited_timestamp", 0);
			this._type = (int8) this.get_int_member_with_default(data, "type", 0);

			this._nonce = new Snowflake(this.get_int_member_with_default(data, "nonce", 0));
			this._guild_id = new Snowflake(this.get_int_member_with_default(data, "guild_id", 0));
			this._webhook_id = new Snowflake(this.get_int_member_with_default(data, "webhook_id", 0));
			this._channel_id = new Snowflake(this.get_int_member_with_default(data, "channel_id", 0));

			this._tts = this.get_boolean_member_with_default(data, "tts", false);
			this._pinned = this.get_boolean_member_with_default(data, "pinned", false);
			this._mention_everyone = this.get_boolean_member_with_default(data, "mention_everyone", false);

			this._author = this.get_object_member_with_default(data, "author", new Json.Object());
			this._member = this.get_object_member_with_default(data, "member", new Json.Object());
			this._activity = this.get_object_member_with_default(data, "activity", new Json.Object());
			this._application = this.get_object_member_with_default(data, "application", new Json.Object());

			this._mentions = new List<Json.Object>();
			this._mention_roles = new List<Json.Object>();
			this._attachments = new List<Json.Object>();
			this._embeds = new List<Json.Object>();
			this._reactions = new List<Json.Object>();

			Json.Array mentions = this.get_array_member_with_default(data, "mentions", new Json.Array());
			Json.Array mention_roles = this.get_array_member_with_default(data, "mention_roles", new Json.Array());
			Json.Array attachments = this.get_array_member_with_default(data, "attachments", new Json.Array());
			Json.Array embeds = this.get_array_member_with_default(data, "embeds", new Json.Array());
			Json.Array reactions = this.get_array_member_with_default(data, "reactions", new Json.Array());
			int i = 0;

			// CODE STYLE 100
			for (i=0;i<mentions.get_length();i++) { this._mentions.append(mentions.get_object_element(i)); }
			for (i=0;i<mention_roles.get_length();i++) { this._mention_roles.append(mention_roles.get_object_element(i)); }
			for (i=0;i<attachments.get_length();i++) { this._attachments.append(attachments.get_object_element(i)); }
			for (i=0;i<embeds.get_length();i++) { this._embeds.append(embeds.get_object_element(i)); }
			for (i=0;i<reactions.get_length();i++) { this._reactions.append(reactions.get_object_element(i)); }
		}

		public string content { get { return this._content; } }

		public int64 timestamp { get { return this._timestamp; } }
		public int64 edited_timestamp { get { return this._edited_timestamp; } }
		public int8 message_type { get { return this._type; } }

		public uint64 nonce { get { return this._nonce.id; } }
		public uint64 guild_id { get { return this._guild_id.id; } }
		public uint64 webhook_id { get { return this._webhook_id.id; } }
		public uint64 channel_id { get { return this._channel_id.id; } }

		public bool tts { get { return this._tts; } }
		public bool pinned { get { return this._pinned; } }
		public bool mention_everyone { get { return this._mention_everyone; } }

		public Json.Object author { get { return this._author; } }
		public Json.Object member { get { return this._member; } }
		public Json.Object activity { get { return this._activity; } }
		public Json.Object application { get { return this._application; } }

		public List<Json.Object> mentions { get { return this._mentions; } }
		public List<Json.Object> mention_roles { get { return this._mention_roles; } }
		public List<Json.Object> attachments { get { return this._attachments; } }
		public List<Json.Object> embeds { get { return this._embeds; } }
		public List<Json.Object> reactions { get { return this._reactions; } }
	}
}